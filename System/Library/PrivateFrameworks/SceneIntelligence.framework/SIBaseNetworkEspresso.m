@implementation SIBaseNetworkEspresso

- (SIBaseNetworkEspresso)initWithNetworkConfiguration:(id)a3
{
  id v4;
  SIBaseNetworkEspresso *v5;
  uint64_t v6;
  NSString *modelName;
  void *v8;
  uint64_t v9;
  void *netPath;
  void *v11;
  uint64_t v12;
  NSString *v13;
  uint64_t v14;
  NSString *networkMode;
  SIBaseNetworkEspresso *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SIBaseNetworkEspresso;
  v5 = -[SIBaseNetworkEspresso init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "networkName");
    v6 = objc_claimAutoreleasedReturnValue();
    modelName = v5->_modelName;
    v5->_modelName = (NSString *)v6;

    objc_msgSend(v4, "networkPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "networkPath");
      v9 = objc_claimAutoreleasedReturnValue();
      netPath = v5->_netPath;
      v5->_netPath = (NSString *)v9;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      netPath = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "networkName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SIMLModelPath(netPath, v11);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v5->_netPath;
      v5->_netPath = (NSString *)v12;

    }
    v5->_engineType = objc_msgSend(v4, "engineType");
    objc_msgSend(v4, "networkMode");
    v14 = objc_claimAutoreleasedReturnValue();
    networkMode = v5->_networkMode;
    v5->_networkMode = (NSString *)v14;

    v5->_isPrepared = 0;
    v16 = v5;
  }

  return v5;
}

- (SIBaseNetworkEspresso)initWithNetworkPath:(id)a3 andEngine:(int64_t)a4 networkMode:(id)a5
{
  id v8;
  id v9;
  SINetworkConfiguration *v10;
  SIBaseNetworkEspresso *v11;

  v8 = a3;
  v9 = a5;
  v10 = objc_alloc_init(SINetworkConfiguration);
  -[SINetworkConfiguration setNetworkPath:](v10, "setNetworkPath:", v8);
  -[SINetworkConfiguration setEngineType:](v10, "setEngineType:", a4);
  -[SINetworkConfiguration setNetworkMode:](v10, "setNetworkMode:", v9);
  v11 = -[SIBaseNetworkEspresso initWithNetworkConfiguration:](self, "initWithNetworkConfiguration:", v10);

  return v11;
}

- (BOOL)prepare
{
  _BOOL4 v3;
  NSObject *v4;
  NSString *modelName;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[SIBaseNetworkEspresso preSetup](self, "preSetup");
  v3 = -[SIBaseNetworkEspresso initMLNetwork](self, "initMLNetwork");
  if (v3)
  {
    -[SIBaseNetworkEspresso postSetup](self, "postSetup");
    __SceneIntelligenceLogSharedInstance();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      modelName = self->_modelName;
      -[SIBaseNetworkEspresso networkVersion](self, "networkVersion");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 136381443;
      v9 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      v10 = 1025;
      v11 = 83;
      v12 = 2113;
      v13 = modelName;
      v14 = 2113;
      v15 = v6;
      _os_log_impl(&dword_21071A000, v4, OS_LOG_TYPE_INFO, " %{private}s:%{private}d *** [Initialization] Model: %{private}@. Version: %{private}@ ***", (uint8_t *)&v8, 0x26u);

    }
    self->_isPrepared = 1;
  }
  return v3;
}

- (id)networkVersion
{
  _BYTE v3[100];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  if (espresso_network_get_version())
    return CFSTR("Unknown");
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", v3);
}

- (id)networkName
{
  return self->_modelName;
}

- (BOOL)isUsingANE
{
  _BOOL4 v3;

  v3 = +[SIBaseNetworkEspresso supportsANE](SIBaseNetworkEspresso, "supportsANE");
  if (v3)
    LOBYTE(v3) = self->_engineType == 1;
  return v3;
}

- (BOOL)initMLNetwork
{
  return -[SIBaseNetworkEspresso initContext](self, "initContext")
      && -[SIBaseNetworkEspresso initPlan](self, "initPlan")
      && -[SIBaseNetworkEspresso initNetwork](self, "initNetwork")
      && -[SIBaseNetworkEspresso buildPlan](self, "buildPlan")
      && -[SIBaseNetworkEspresso validateNetworkOutputDimension](self, "validateNetworkOutputDimension")
      && -[SIBaseNetworkEspresso initNetworkOutput](self, "initNetworkOutput");
}

- (BOOL)buildPlan
{
  if (self->_enablePreprocess)
    -[SIBaseNetworkEspresso initPreprocess](self, "initPreprocess");
  espresso_plan_build();
  return 1;
}

- (BOOL)initContext
{
  void *context;
  void *v4;
  void *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  uint64_t v9;
  std::__shared_weak_count *v10;

  context = (void *)espresso_create_context();
  v5 = context;
  self->_context = context;
  if (context)
  {
    Espresso::get_internal_context((Espresso *)context, v4);
    *(_DWORD *)(v9 + 68) = 1;
    if (v10)
    {
      p_shared_owners = (unint64_t *)&v10->__shared_owners_;
      do
        v7 = __ldaxr(p_shared_owners);
      while (__stlxr(v7 - 1, p_shared_owners));
      if (!v7)
      {
        ((void (*)())v10->__on_zero_shared)();
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  return v5 != 0;
}

- (BOOL)initPlan
{
  void *plan;

  plan = (void *)espresso_create_plan();
  self->_plan = plan;
  return plan != 0;
}

- (BOOL)initNetwork
{
  NSString *netPath;
  id v4;
  NSString *networkMode;
  BOOL v6;

  netPath = self->_netPath;
  if (!netPath)
    return 0;
  -[NSString stringByAppendingPathComponent:](netPath, "stringByAppendingPathComponent:", CFSTR("model.espresso.net"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  espresso_plan_add_network();
  networkMode = self->_networkMode;
  if (networkMode
    && !-[NSString isEqualToString:](networkMode, "isEqualToString:", &stru_24CA5D420)
    && (-[NSString UTF8String](self->_networkMode, "UTF8String"), espresso_network_select_configuration()))
  {
    v6 = 0;
  }
  else
  {
    -[SIBaseNetworkEspresso updateOutputBlobMap](self, "updateOutputBlobMap");
    v6 = 1;
  }

  return v6;
}

- (void)updateOutputBlobMap
{
  unordered_map<std::string, espresso_buffer_t, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, espresso_buffer_t>>> *p_outputBufferMap;
  uint64_t output_blob_name;
  char *v4;
  uint64_t v5;
  _OWORD v6[10];
  uint64_t v7;
  void *v8[2];
  char v9;

  p_outputBufferMap = &self->_outputBufferMap;
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::clear((uint64_t)&self->_outputBufferMap);
  output_blob_name = espresso_get_output_blob_name();
  if (output_blob_name)
  {
    v4 = (char *)output_blob_name;
    v5 = 1;
    do
    {
      std::string::basic_string[abi:nn180100]<0>(v8, v4);
      v7 = 0;
      memset(v6, 0, sizeof(v6));
      std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::string,espresso_buffer_t>((uint64_t)p_outputBufferMap, (uint64_t)v8, (uint64_t)v8, (uint64_t)v6);
      if (v9 < 0)
        operator delete(v8[0]);
      v4 = (char *)espresso_get_output_blob_name();
      ++v5;
    }
    while (v4);
  }
}

- (BOOL)validateNetworkOutputDimension
{
  __int128 v2;
  _QWORD *next;
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  char v8;
  NSObject *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  _QWORD *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  next = self->_expectedDimensions.__table_.__p1_.__value_.__next_;
  if (next)
  {
    *(_QWORD *)&v2 = 136383235;
    v16 = v2;
    do
    {
      v5 = next + 2;
      v39 = 0u;
      v40 = 0u;
      v6 = next + 2;
      if (*((char *)next + 39) < 0)
        v6 = (_QWORD *)*v5;
      -[SIBaseNetworkEspresso getBlobDimensionByName:andDestination:](self, "getBlobDimensionByName:andDestination:", v6, &v39, v16);
      v7 = 0;
      v8 = 1;
      do
      {
        v8 &= *(_QWORD *)((char *)&v39 + v7) == *(_QWORD *)(next[5] + v7);
        v7 += 8;
      }
      while (v7 != 32);
      if ((v8 & 1) == 0)
      {
        __SceneIntelligenceLogSharedInstance();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          if (*((char *)next + 39) < 0)
            v5 = (_QWORD *)*v5;
          v10 = (uint64_t *)next[5];
          v11 = *v10;
          v12 = v10[1];
          v14 = v10[2];
          v13 = v10[3];
          *(_DWORD *)buf = v16;
          v18 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
          v19 = 1025;
          v20 = 248;
          v21 = 2081;
          v22 = v5;
          v23 = 2049;
          v24 = v11;
          v25 = 2049;
          v26 = v12;
          v27 = 2049;
          v28 = v14;
          v29 = 2049;
          v30 = v13;
          v31 = 2048;
          v32 = v39;
          v33 = 2048;
          v34 = *((_QWORD *)&v39 + 1);
          v35 = 2048;
          v36 = v40;
          v37 = 2048;
          v38 = *((_QWORD *)&v40 + 1);
          _os_log_impl(&dword_21071A000, v9, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** The shape of blob \"%{private}s\" doesn't match with the expectation in validation. We expect the shape to be (%{private}zu, %{private}zu, %{private}zu, %{private}zu) while the shape is (%zu, %zu, %zu, %zu)\n ***", buf, 0x6Cu);
        }

      }
      next = (_QWORD *)*next;
    }
    while (next);
  }
  return 1;
}

- (void)setExpectedDimension:(const char *)a3 andDimension:(unint64_t *)a4
{
  _OWORD *v7;
  __int128 v8;
  unsigned __int8 *v9;
  _OWORD *v10;
  void *v11;
  void *__p[2];
  char v13;
  void **v14;

  v7 = operator new(0x20uLL);
  v8 = *((_OWORD *)a4 + 1);
  *v7 = *(_OWORD *)a4;
  v7[1] = v8;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)a3);
  v14 = __p;
  v9 = std::__hash_table<std::__hash_value_type<std::string,std::vector<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<unsigned long>>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_expectedDimensions, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v14);
  v10 = v7 + 2;
  v11 = (void *)*((_QWORD *)v9 + 5);
  if (v11)
  {
    *((_QWORD *)v9 + 6) = v11;
    operator delete(v11);
    *((_QWORD *)v9 + 5) = 0;
    *((_QWORD *)v9 + 6) = 0;
    *((_QWORD *)v9 + 7) = 0;
  }
  *((_QWORD *)v9 + 5) = v7;
  *((_QWORD *)v9 + 6) = v10;
  *((_QWORD *)v9 + 7) = v10;
  if (v13 < 0)
    operator delete(__p[0]);
}

- (void)getBlobDimensionByName:(const char *)a3 andDestination:(unint64_t *)a4
{
  espresso_network_query_blob_dimensions();
}

- (BOOL)initNetworkOutput
{
  char *i;
  _QWORD *v4;

  for (i = (char *)self->_outputBufferMap.__table_.__p1_.__value_.__next_; i; i = *(char **)i)
  {
    v4 = i + 16;
    if (i[39] < 0)
      v4 = (_QWORD *)*v4;
    -[SIBaseNetworkEspresso bindNetworkOutput:](self, "bindNetworkOutput:", v4);
  }
  return 1;
}

- (void)bindNetworkInputWithImage:(__CVBuffer *)a3 withInputName:(id)a4
{
  id v4;

  v4 = objc_retainAutorelease(a4);
  objc_msgSend(v4, "UTF8String");
  espresso_network_bind_cvpixelbuffer();

}

- (BOOL)bindNetworkInputWithEspressoBuffer:(id *)a3 withInputName:(id)a4
{
  id v4;
  BOOL v5;

  v4 = objc_retainAutorelease(a4);
  objc_msgSend(v4, "UTF8String");
  v5 = espresso_network_bind_buffer() == 0;

  return v5;
}

- (void)bindNetworkOutput:(const char *)a3
{
  NSSet *disabledOutputSet;
  void *v6;
  void *__p[2];
  char v8;

  disabledOutputSet = self->_disabledOutputSet;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(disabledOutputSet) = -[NSSet containsObject:](disabledOutputSet, "containsObject:", v6);

  if ((disabledOutputSet & 1) == 0)
  {
    std::string::basic_string[abi:nn180100]<0>(__p, (char *)a3);
    if (!std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_outputBufferMap.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p))abort();
    if (v8 < 0)
      operator delete(__p[0]);
    espresso_network_bind_buffer();
  }
}

- ($FD4688982923A924290ECB669CAF1EC2)getTensorByName:(const char *)a3
{
  unordered_map<std::string, espresso_buffer_t, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, espresso_buffer_t>>> *p_outputBufferMap;
  char *v4;
  void *__p[2];
  char v7;
  void **v8;

  p_outputBufferMap = &self->_outputBufferMap;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)a3);
  v8 = __p;
  v4 = std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_outputBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v8);
  if (v7 < 0)
    operator delete(__p[0]);
  return ($FD4688982923A924290ECB669CAF1EC2 *)(v4 + 40);
}

- (__CVBuffer)getOutPixelBufferByName:(const char *)a3
{
  unordered_map<std::string, __CVBuffer *, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, __CVBuffer *>>> *p_outputPixelBufMap;
  __CVBuffer *v4;
  void *__p[2];
  char v7;
  void **v8;

  p_outputPixelBufMap = &self->_outputPixelBufMap;
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)a3);
  v8 = __p;
  v4 = (__CVBuffer *)*((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_outputPixelBufMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v8)+ 5);
  if (v7 < 0)
    operator delete(__p[0]);
  return v4;
}

- (CGSize)getResolutionByBlobName:(const char *)a3
{
  double v3;
  double v4;
  _QWORD v5[5];
  CGSize result;

  v5[4] = *MEMORY[0x24BDAC8D0];
  -[SIBaseNetworkEspresso getBlobDimensionByName:andDestination:](self, "getBlobDimensionByName:andDestination:", a3, v5);
  v3 = (double)v5[0];
  v4 = (double)v5[1];
  result.height = v4;
  result.width = v3;
  return result;
}

- (int64_t)switchConfiguration:(id)a3
{
  id v4;
  void *v5;
  char v6;
  int64_t v7;
  id v8;
  NSObject *v9;
  NSString *netPath;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  __int16 v19;
  NSString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SIBaseNetworkEspresso networkMode](self, "networkMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  if ((v6 & 1) != 0)
    goto LABEL_2;
  -[SIBaseNetworkEspresso cleanUpOutputPixelBufferMap](self, "cleanUpOutputPixelBufferMap");
  -[SIBaseNetworkEspresso plan](self, "plan");
  espresso_plan_build_clean();
  v8 = objc_retainAutorelease(v4);
  objc_msgSend(v8, "UTF8String");
  if (espresso_network_select_configuration())
  {
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      netPath = self->_netPath;
      v15 = 136381187;
      v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      v17 = 1025;
      v18 = 382;
      v19 = 2113;
      v20 = netPath;
      v11 = " %{private}s:%{private}d *** Could not switch the configuration for the model: %{private}@ ***";
      v12 = v9;
      v13 = 28;
LABEL_17:
      _os_log_impl(&dword_21071A000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v15, v13);
    }
LABEL_18:

    v7 = 5;
    goto LABEL_19;
  }
  -[SIBaseNetworkEspresso updateOutputBlobMap](self, "updateOutputBlobMap");
  if (!-[SIBaseNetworkEspresso buildPlan](self, "buildPlan"))
  {
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v15 = 136380931;
    v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    v17 = 1025;
    v18 = 388;
    v11 = " %{private}s:%{private}d *** build plan fail when switching the configuration! ***";
LABEL_16:
    v12 = v9;
    v13 = 18;
    goto LABEL_17;
  }
  if (!-[SIBaseNetworkEspresso validateNetworkOutputDimension](self, "validateNetworkOutputDimension"))
  {
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v15 = 136380931;
    v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    v17 = 1025;
    v18 = 393;
    v11 = " %{private}s:%{private}d *** validation for network output fail when switching the configuration! ***";
    goto LABEL_16;
  }
  if (!-[SIBaseNetworkEspresso initNetworkOutput](self, "initNetworkOutput"))
  {
    __SceneIntelligenceLogSharedInstance();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v15 = 136380931;
    v16 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    v17 = 1025;
    v18 = 398;
    v11 = " %{private}s:%{private}d *** initializing the network output buffer fail when switching the configuration! ***";
    goto LABEL_16;
  }
  -[SIBaseNetworkEspresso setNetworkMode:](self, "setNetworkMode:", v8);
LABEL_2:
  v7 = 0;
LABEL_19:

  return v7;
}

- (unint64_t)getInputChannels:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v6;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "UTF8String");
  if (espresso_network_query_blob_dimensions())
    v4 = -1;
  else
    v4 = v6;

  return v4;
}

- (unint64_t)getInputHeight:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v6;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "UTF8String");
  if (espresso_network_query_blob_dimensions())
    v4 = -1;
  else
    v4 = v6;

  return v4;
}

- (unint64_t)getInputWidth:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v6;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "UTF8String");
  if (espresso_network_query_blob_dimensions())
    v4 = -1;
  else
    v4 = v6;

  return v4;
}

- (unint64_t)getInputLength:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  unint64_t v7;
  _BYTE buf[12];
  __int16 v10;
  int v11;
  __int16 v12;
  int v13;
  __int16 v14;
  id v15;
  void *__p[2];
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  *(_QWORD *)buf = __p;
  std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_input_espresso_buffer, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)buf);
  if (v17 < 0)
    operator delete(__p[0]);
  v5 = espresso_buffer_unpack_tensor_shape();
  if (v5)
  {
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381443;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      v10 = 1025;
      v11 = 431;
      v12 = 1024;
      v13 = v5;
      v14 = 2113;
      v15 = v4;
      _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** getInputLength failed with status: %d for name %{private}@ ***", buf, 0x22u);
    }

    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (unint64_t)getOutputChannels:(id)a3
{
  id v3;
  unint64_t v4;
  unint64_t v6;

  v3 = objc_retainAutorelease(a3);
  objc_msgSend(v3, "UTF8String");
  if (espresso_network_query_blob_dimensions())
    v4 = -1;
  else
    v4 = v6;

  return v4;
}

- (unint64_t)getOutputHeight:(id)a3
{
  id v4;
  unint64_t v5;
  void *__p[2];
  char v8;
  void **v9;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v9 = __p;
  v5 = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v9)+ 16);
  if (v8 < 0)
    operator delete(__p[0]);

  return v5;
}

- (unint64_t)getOutputRowElements:(id)a3
{
  id v4;
  unint64_t v5;
  void *__p[2];
  char v8;
  void **v9;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v9 = __p;
  v5 = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v9)+ 15);
  if (v8 < 0)
    operator delete(__p[0]);

  return v5;
}

- (unint64_t)getOutputWidth:(id)a3
{
  id v4;
  unint64_t v5;
  void *__p[2];
  char v8;
  void **v9;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v9 = __p;
  v5 = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v9)+ 15);
  if (v8 < 0)
    operator delete(__p[0]);

  return v5;
}

- (void)getRawOutput:(id)a3
{
  id v4;
  void *v5;

  v4 = objc_retainAutorelease(a3);
  v5 = *(void **)-[SIBaseNetworkEspresso getTensorByName:](self, "getTensorByName:", objc_msgSend(v4, "UTF8String"));

  return v5;
}

- (unint64_t)getOutputBytePerRow:(id)a3
{
  id v4;
  unint64_t v5;
  void *__p[2];
  char v8;
  void **v9;

  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v9 = __p;
  v5 = *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v9)+ 11);
  if (v8 < 0)
    operator delete(__p[0]);

  return v5;
}

- (unint64_t)getOutputComponentSize:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  __int128 *v8;
  _BYTE __p[12];
  __int16 v10;
  int v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v4, "UTF8String"));
  v8 = (__int128 *)__p;
  v5 = *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_outputBufferMap, (uint64_t)__p, (uint64_t)&std::piecewise_construct, &v8)+ 50);
  if (v12 < 0)
    operator delete(*(void **)__p);
  if (v5 != 65568)
  {
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136380931;
      *(_QWORD *)&__p[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      v10 = 1025;
      v11 = 475;
      _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Got unexpected storage type when querying the componentSize in espressoV1. ***", __p, 0x12u);
    }

  }
  return 4;
}

- (unint64_t)getOutputLength:(id)a3
{
  id v4;
  int v5;
  NSObject *v6;
  unint64_t v7;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  -[SIBaseNetworkEspresso getTensorByName:](self, "getTensorByName:", objc_msgSend(v4, "UTF8String"));
  v5 = espresso_buffer_unpack_tensor_shape();
  if (v5)
  {
    __SceneIntelligenceLogSharedInstance();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136381443;
      v10 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      v11 = 1025;
      v12 = 485;
      v13 = 1024;
      v14 = v5;
      v15 = 2113;
      v16 = v4;
      _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** getOutputLength failed with status: %d for name %{private}@ ***", buf, 0x22u);
    }

    v7 = 0;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)getOpsForLibrary
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    v6 = 1025;
    v7 = 498;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Backend library does not support getOpsForLibrary. (You are probably not running with E5RT) ***", (uint8_t *)&v4, 0x12u);
  }

  return 0;
}

- (int64_t)runNetwork
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!espresso_plan_execute_sync())
    return 0;
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    v6 = 1025;
    v7 = 505;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failure to run network for MS ***", (uint8_t *)&v4, 0x12u);
  }

  return 4;
}

- (int64_t)setInput:(id)a3 fromCVPixelBuffer:(__CVBuffer *)a4
{
  id v6;
  int64_t v7;
  NSObject *v8;
  id v10;
  void *BaseAddress;
  void *__p[2];
  char v13;
  void **v14;
  int8x16_t v15;
  int8x16_t v16;
  _BYTE buf[32];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!self->_isPrepared)
  {
    __SceneIntelligenceLogSharedInstance();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      *(_WORD *)&buf[12] = 1025;
      *(_DWORD *)&buf[14] = 520;
      _os_log_impl(&dword_21071A000, v8, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Model is not prepared before setting the input ***", buf, 0x12u);
    }

    goto LABEL_9;
  }
  if (CVPixelBufferGetPixelFormatType(a4) != 1111970369 && CVPixelBufferGetPixelFormatType(a4) != 1278226488)
  {
    v10 = objc_retainAutorelease(v6);
    std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v10, "UTF8String"));
    if (std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_input_espresso_buffer.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p)|| (*(_QWORD *)buf = __p, *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_input_espresso_buffer, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)buf)+ 50) = 65568, -[SIBaseNetworkEspresso getBlobDimensionByName:andDestination:](self, "getBlobDimensionByName:andDestination:", objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), buf), v15 = vextq_s8(*(int8x16_t *)&buf[16], *(int8x16_t *)&buf[16], 8uLL), v16 = vextq_s8(*(int8x16_t *)buf, *(int8x16_t *)buf, 8uLL), v14 = __p, std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_input_espresso_buffer,
            (uint64_t)__p,
            (uint64_t)&std::piecewise_construct,
            (__int128 **)&v14),
          !espresso_buffer_pack_tensor_shape()))
    {
      CVPixelBufferLockBaseAddress(a4, 0);
      BaseAddress = CVPixelBufferGetBaseAddress(a4);
      *(_QWORD *)buf = __p;
      *((_QWORD *)std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_input_espresso_buffer, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)buf)+ 5) = BaseAddress;
      *(_QWORD *)buf = __p;
      -[SIBaseNetworkEspresso bindNetworkInputWithEspressoBuffer:withInputName:](self, "bindNetworkInputWithEspressoBuffer:withInputName:", std::__hash_table<std::__hash_value_type<std::string,espresso_buffer_t>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,espresso_buffer_t>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,espresso_buffer_t>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t)&self->_input_espresso_buffer, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)buf)+ 40, v10);
      if (v13 < 0)
        operator delete(__p[0]);
      goto LABEL_5;
    }
    if (v13 < 0)
      operator delete(__p[0]);
LABEL_9:
    v7 = 3;
    goto LABEL_10;
  }
  -[SIBaseNetworkEspresso bindNetworkInputWithImage:withInputName:](self, "bindNetworkInputWithImage:withInputName:", a4, v6);
LABEL_5:
  v7 = 0;
LABEL_10:

  return v7;
}

- (int64_t)setInput:(id)a3 fromRawPointer:(const void *)a4
{
  id v6;
  void *v7;
  id v8;
  unsigned __int8 *v9;
  int64_t v10;
  NSObject *v11;
  NSObject *v12;
  void *__p[2];
  char v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = v6;
  if (self->_isPrepared)
  {
    v8 = objc_retainAutorelease(v6);
    std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v8, "UTF8String"));
    v9 = std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_input_espresso_buffer.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)__p);
    if (v9)
    {
      v10 = 0;
      *((_QWORD *)v9 + 5) = a4;
    }
    else
    {
      __SceneIntelligenceLogSharedInstance();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136381187;
        v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
        v18 = 1025;
        v19 = 563;
        v20 = 2113;
        v21 = v8;
        _os_log_impl(&dword_21071A000, v12, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Input %{private}@ does not exist ***", buf, 0x1Cu);
      }

      v10 = 3;
    }
    if (v15 < 0)
      operator delete(__p[0]);
  }
  else
  {
    __SceneIntelligenceLogSharedInstance();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136380931;
      v17 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
      v18 = 1025;
      v19 = 556;
      _os_log_impl(&dword_21071A000, v11, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Model is not prepared before setting the input ***", buf, 0x12u);
    }

    v10 = 3;
  }

  return v10;
}

- (int64_t)setOutputBlob:(id)a3 forOutputSurface:(__IOSurface *)a4
{
  return 0;
}

- (SIBaseNetworkEspresso)initWithNetworkPath:(id)a3 engine:(int64_t)a4 networkMode:(id)a5 directAccessOutputBuffer:(BOOL)a6
{

  return 0;
}

- (void)cleanUpOutputPixelBufferMap
{
  CVPixelBufferRef i;

  for (i = (CVPixelBufferRef)self->_outputPixelBufMap.__table_.__p1_.__value_.__next_; i; i = *(CVPixelBufferRef *)i)
    CVPixelBufferRelease(*((CVPixelBufferRef *)i + 5));
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::clear((uint64_t)&self->_outputPixelBufMap);
}

- (BOOL)supportFloat16IO
{
  return 0;
}

- (BOOL)supportZeroCopyOutput
{
  return 0;
}

- (int64_t)addPrewiringBuffersToStreamForFunctionName:(id)a3 inputPools:(id)a4 outputPools:(id)a5 clearWiredBuffer:(BOOL)a6
{
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v8 = 136380931;
    v9 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    v10 = 1025;
    v11 = 606;
    _os_log_impl(&dword_21071A000, v6, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** ANEP is not supported in EspressoV1 ***", (uint8_t *)&v8, 0x12u);
  }

  return 4;
}

- (int64_t)unwirePrewiringBuffersForFunctionName:(id)a3
{
  NSObject *v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v5 = 136380931;
    v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    v7 = 1025;
    v8 = 612;
    _os_log_impl(&dword_21071A000, v3, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** ANEP is not supported in EspressoV1 ***", (uint8_t *)&v5, 0x12u);
  }

  return 4;
}

- (int64_t)unwirePrewiringBuffers
{
  NSObject *v2;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  __SceneIntelligenceLogSharedInstance();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v4 = 136380931;
    v5 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SIBaseNetworkEspresso.mm";
    v6 = 1025;
    v7 = 618;
    _os_log_impl(&dword_21071A000, v2, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** ANEP is not supported in EspressoV1 ***", (uint8_t *)&v4, 0x12u);
  }

  return 4;
}

- (id)networkInputNames
{
  return 0;
}

- (id)networkOutputNames
{
  return 0;
}

- (__IOSurface)getOutputSurface:(id)a3
{
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  espresso_plan_destroy();
  espresso_context_destroy();
  -[SIBaseNetworkEspresso cleanUpOutputPixelBufferMap](self, "cleanUpOutputPixelBufferMap");
  v3.receiver = self;
  v3.super_class = (Class)SIBaseNetworkEspresso;
  -[SIBaseNetworkEspresso dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v2;
  void *v3;

  -[SIBaseNetworkEspresso tracingEntry](self, "tracingEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSDictionary)tracingEntry
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[7];

  v10[6] = *MEMORY[0x24BDAC8D0];
  v10[0] = self->_netPath;
  v9[0] = CFSTR("netPath");
  v9[1] = CFSTR("engineType");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_engineType);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v3;
  v10[2] = self->_modelName;
  v9[2] = CFSTR("modelName");
  v9[3] = CFSTR("enablePreprocess");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_enablePreprocess);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v4;
  v9[4] = CFSTR("networkVersion");
  -[SIBaseNetworkEspresso networkVersion](self, "networkVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v5;
  v9[5] = CFSTR("networkMode");
  -[SIBaseNetworkEspresso networkMode](self, "networkMode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[5] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

+ (NSDictionary)tracingEntryFormat
{
  if (+[SIBaseNetworkEspresso tracingEntryFormat]::onceToken != -1)
    dispatch_once(&+[SIBaseNetworkEspresso tracingEntryFormat]::onceToken, &__block_literal_global_2);
  return (NSDictionary *)(id)+[SIBaseNetworkEspresso tracingEntryFormat]::entryFormat;
}

void __43__SIBaseNetworkEspresso_tracingEntryFormat__block_invoke()
{
  void *v0;

  v0 = (void *)+[SIBaseNetworkEspresso tracingEntryFormat]::entryFormat;
  +[SIBaseNetworkEspresso tracingEntryFormat]::entryFormat = (uint64_t)&unk_24CA66A08;

}

- (void)context
{
  return self->_context;
}

- (void)plan
{
  return self->_plan;
}

- ($C4732ECC957FA13B9B3DF4A51A95735B)network
{
  uint64_t v2;
  void *plan;
  $C4732ECC957FA13B9B3DF4A51A95735B result;

  v2 = *(_QWORD *)&self->_network.network_index;
  plan = self->_network.plan;
  result.var1 = v2;
  result.var0 = plan;
  return result;
}

- (int64_t)engineType
{
  return self->_engineType;
}

- ($F613A077D53D3D97A8E0FDF5BAE1891D)preprocessor
{
  *($9DF72902E0F602464F2F248C9389BF3B *)retstr = *($9DF72902E0F602464F2F248C9389BF3B *)((char *)self + 248);
  return self;
}

- (void)setPreprocessor:(id *)a3
{
  __int128 v3;

  v3 = *(_OWORD *)&a3->var0;
  *(_DWORD *)&self->_preprocessor.network_wants_bgr = *(_DWORD *)&a3->var4;
  *(_OWORD *)&self->_preprocessor.bias_r = v3;
}

- (BOOL)enablePreprocess
{
  return self->_enablePreprocess;
}

- (void)setEnablePreprocess:(BOOL)a3
{
  self->_enablePreprocess = a3;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (NSString)networkMode
{
  return self->_networkMode;
}

- (void)setNetworkMode:(id)a3
{
  objc_storeStrong((id *)&self->_networkMode, a3);
}

- (BOOL)useManagedBuffers
{
  return self->_useManagedBuffers;
}

- (void)setUseManagedBuffers:(BOOL)a3
{
  self->_useManagedBuffers = a3;
}

- (NSSet)disabledOutputSet
{
  return self->_disabledOutputSet;
}

- (void)setDisabledOutputSet:(id)a3
{
  objc_storeStrong((id *)&self->_disabledOutputSet, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disabledOutputSet, 0);
  objc_storeStrong((id *)&self->_networkMode, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table((uint64_t)&self->_input_espresso_buffer);
  std::__hash_table<std::__hash_value_type<std::string,std::vector<unsigned long>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::vector<unsigned long>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::vector<unsigned long>>>>::~__hash_table((uint64_t)&self->_expectedDimensions);
  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table((uint64_t)&self->_outputPixelBufMap);
  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table((uint64_t)&self->_outputBufferMap);
  objc_storeStrong((id *)&self->_netPath, 0);
}

- (id).cxx_construct
{
  *((_OWORD *)self + 1) = 0u;
  *((_OWORD *)self + 2) = 0u;
  *((_DWORD *)self + 12) = 1065353216;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 72) = 0u;
  *((_DWORD *)self + 22) = 1065353216;
  *((_OWORD *)self + 6) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_DWORD *)self + 32) = 1065353216;
  *(_OWORD *)((char *)self + 136) = 0u;
  *(_OWORD *)((char *)self + 152) = 0u;
  *((_DWORD *)self + 42) = 1065353216;
  return self;
}

@end
