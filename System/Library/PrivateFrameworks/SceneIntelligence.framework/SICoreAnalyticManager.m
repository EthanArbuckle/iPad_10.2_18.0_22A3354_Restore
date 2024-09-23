@implementation SICoreAnalyticManager

- (SICoreAnalyticManager)initWithEventName:(id)a3 requiredKeys:(id)a4 minLogTimeInterval:(int)a5
{
  id v9;
  id v10;
  SICoreAnalyticManager *v11;
  SICoreAnalyticManager *v12;
  NSString *countItemKey;
  SICoreAnalyticManager *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SICoreAnalyticManager;
  v11 = -[SICoreAnalyticManager init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_coreAnalyticTimeInterval = a5;
    v11->_createdTime = CACurrentMediaTime();
    objc_storeStrong((id *)&v12->_coreAnalyticEventName, a3);
    objc_storeStrong((id *)&v12->_accumulatedDataKeys, a4);
    countItemKey = v12->_countItemKey;
    v12->_countItemKey = 0;

    -[SICoreAnalyticManager resetStatisticData](v12, "resetStatisticData");
    v14 = v12;
  }

  return v12;
}

- (void)averageAccumulatedDataOverKey:(id)a3
{
  objc_storeStrong((id *)&self->_countItemKey, a3);
}

- (void)resetStatisticData
{
  unordered_map<std::string, float, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, float>>> *p_accumulatedData;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *__p[2];
  char v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  void **v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  self->_lastSummaryTimestamp = CACurrentMediaTime();
  p_accumulatedData = &self->_accumulatedData;
  std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::clear((uint64_t)&self->_accumulatedData);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSSet allObjects](self->_accumulatedDataKeys, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7)), "UTF8String"));
        v14 = __p;
        *((_DWORD *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v14)+ 10) = 0;
        if (v9 < 0)
          operator delete(__p[0]);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v5);
  }

}

- (void)summaryCoreAnalyticEvent
{
  double v3;
  NSObject *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = CACurrentMediaTime() - self->_lastSummaryTimestamp;
  self->_elapseTime = v3;
  if (v3 > (double)self->_coreAnalyticTimeInterval)
  {
    if (self->_coreAnalyticEventName)
    {
      AnalyticsSendEventLazy();
    }
    else
    {
      __SceneIntelligenceLogSharedInstance();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136380931;
        v6 = "/Library/Caches/com.apple.xbs/Sources/SceneIntelligence/Source/Common/SICoreAnalyticManager.mm";
        v7 = 1025;
        v8 = 70;
        _os_log_impl(&dword_21071A000, v4, OS_LOG_TYPE_ERROR, " %{private}s:%{private}d *** Failed to send analytics event since the eventName is not assigned ***", buf, 0x12u);
      }

    }
    -[SICoreAnalyticManager resetStatisticData](self, "resetStatisticData");
    self->_lastSummaryTimestamp = CACurrentMediaTime();
  }
}

uint64_t __49__SICoreAnalyticManager_summaryCoreAnalyticEvent__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "coreAnalyticDictionary");
}

- (void)accumulateStatisticDataForKey:(id)a3 value:(float)a4
{
  id v6;
  float *v7;
  void *__p[2];
  char v9;
  void **v10;

  v6 = objc_retainAutorelease(a3);
  std::string::basic_string[abi:nn180100]<0>(__p, (char *)objc_msgSend(v6, "UTF8String"));
  v10 = __p;
  v7 = (float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_accumulatedData, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)&v10);
  v7[10] = v7[10] + a4;
  if (v9 < 0)
    operator delete(__p[0]);

}

- (void)coreAnalyticDictionaryForPersonPetDetection:(id *)a3
{
  float v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  float v10;
  void *v11;
  float v12;
  double v13;
  void *v14;
  float v15;
  void *v16;
  float v17;
  double v18;
  void *v19;
  float v20;
  void *v21;
  float v22;
  double v23;
  void *v24;
  float v25;
  void *v26;
  float v27;
  double v28;
  void *v29;
  void *v30;
  float v31;
  float v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  void *v37;
  void *v38;
  float v39;
  float v40;
  double v41;
  void *v42;
  void *v43;
  float v44;
  float v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  float v52;
  float v53;
  double v54;
  void *v55;
  float v56;
  void *v57;
  float v58;
  double v59;
  void *v60;
  float v61;
  void *v62;
  float v63;
  double v64;
  void *v65;
  unordered_map<std::string, float, std::hash<std::string>, std::equal_to<std::string>, std::allocator<std::pair<const std::string, float>>> *p_accumulatedData;
  void *v67[2];
  char v68;
  void *v69[2];
  char v70;
  void *v71[2];
  char v72;
  void *v73[2];
  char v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  void *v83[2];
  char v84;
  void *v85[2];
  char v86;
  void *v87[2];
  char v88;
  void *v89[2];
  char v90;
  void *v91[2];
  char v92;
  void *v93[2];
  char v94;
  void *v95[2];
  char v96;
  void *v97[2];
  char v98;
  void *__p[2];
  char v100;
  void *v101[2];
  char v102;
  void *v103[2];
  char v104;
  void **v105;
  _BYTE v106[128];
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x24BDAC8D0];
  std::string::basic_string[abi:nn180100]<0>(v103, "faceCount");
  v101[0] = v103;
  p_accumulatedData = &self->_accumulatedData;
  v5 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (__int128 **)v101)+ 10);
  if (v5 == 0.0)
  {
    v9 = &unk_24CA66648;
  }
  else
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    std::string::basic_string[abi:nn180100]<0>(v101, "fakeFaceCount");
    __p[0] = v101;
    v7 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v101, (uint64_t)&std::piecewise_construct, (__int128 **)__p)+ 10);
    std::string::basic_string[abi:nn180100]<0>(__p, "faceCount");
    v97[0] = __p;
    *(float *)&v8 = v7
                  / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)__p, (uint64_t)&std::piecewise_construct, (__int128 **)v97)+ 10);
    objc_msgSend(v6, "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*a3, "setObject:forKeyedSubscript:", v9, CFSTR("fakeFaceRate"));
  if (v5 != 0.0)
  {

    if (v100 < 0)
      operator delete(__p[0]);
    if (v102 < 0)
      operator delete(v101[0]);
  }
  if (v104 < 0)
    operator delete(v103[0]);
  std::string::basic_string[abi:nn180100]<0>(v103, "upperBodyCount");
  v97[0] = v103;
  v10 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (__int128 **)v97)+ 10);
  if (v10 == 0.0)
  {
    v14 = &unk_24CA66648;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    std::string::basic_string[abi:nn180100]<0>(v97, "fakeUpperBodyCount");
    v95[0] = v97;
    v12 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v97, (uint64_t)&std::piecewise_construct, (__int128 **)v95)+ 10);
    std::string::basic_string[abi:nn180100]<0>(v95, "upperBodyCount");
    v93[0] = v95;
    *(float *)&v13 = v12
                   / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v95, (uint64_t)&std::piecewise_construct, (__int128 **)v93)+ 10);
    objc_msgSend(v11, "numberWithFloat:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*a3, "setObject:forKeyedSubscript:", v14, CFSTR("fakeUpperBodyRate"));
  if (v10 != 0.0)
  {

    if (v96 < 0)
      operator delete(v95[0]);
    if (v98 < 0)
      operator delete(v97[0]);
  }
  if (v104 < 0)
    operator delete(v103[0]);
  std::string::basic_string[abi:nn180100]<0>(v103, "petCount");
  v93[0] = v103;
  v15 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (__int128 **)v93)+ 10);
  if (v15 == 0.0)
  {
    v19 = &unk_24CA66648;
  }
  else
  {
    v16 = (void *)MEMORY[0x24BDD16E0];
    std::string::basic_string[abi:nn180100]<0>(v93, "fakePetCount");
    v91[0] = v93;
    v17 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v93, (uint64_t)&std::piecewise_construct, (__int128 **)v91)+ 10);
    std::string::basic_string[abi:nn180100]<0>(v91, "petCount");
    v89[0] = v91;
    *(float *)&v18 = v17
                   / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v91, (uint64_t)&std::piecewise_construct, (__int128 **)v89)+ 10);
    objc_msgSend(v16, "numberWithFloat:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*a3, "setObject:forKeyedSubscript:", v19, CFSTR("fakePetRate"));
  if (v15 != 0.0)
  {

    if (v92 < 0)
      operator delete(v91[0]);
    if (v94 < 0)
      operator delete(v93[0]);
  }
  if (v104 < 0)
    operator delete(v103[0]);
  std::string::basic_string[abi:nn180100]<0>(v103, "travelTime");
  v89[0] = v103;
  v20 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (__int128 **)v89)+ 10);
  if (v20 == 0.0)
  {
    v24 = &unk_24CA66648;
  }
  else
  {
    v21 = (void *)MEMORY[0x24BDD16E0];
    std::string::basic_string[abi:nn180100]<0>(v89, "travelDistance");
    v87[0] = v89;
    v22 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v89, (uint64_t)&std::piecewise_construct, (__int128 **)v87)+ 10);
    std::string::basic_string[abi:nn180100]<0>(v87, "travelTime");
    v85[0] = v87;
    *(float *)&v23 = v22
                   / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v87, (uint64_t)&std::piecewise_construct, (__int128 **)v85)+ 10);
    objc_msgSend(v21, "numberWithFloat:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*a3, "setObject:forKeyedSubscript:", v24, CFSTR("velocity"));
  if (v20 != 0.0)
  {

    if (v88 < 0)
      operator delete(v87[0]);
    if (v90 < 0)
      operator delete(v89[0]);
  }
  if (v104 < 0)
    operator delete(v103[0]);
  objc_msgSend(*a3, "removeObjectForKey:", CFSTR("travelDistance"));
  objc_msgSend(*a3, "removeObjectForKey:", CFSTR("travelTime"));
  std::string::basic_string[abi:nn180100]<0>(v103, "flickeringAuthenticityCount");
  v85[0] = v103;
  v25 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (__int128 **)v85)+ 10);
  if (v25 == 0.0)
  {
    v29 = &unk_24CA66648;
  }
  else
  {
    v26 = (void *)MEMORY[0x24BDD16E0];
    std::string::basic_string[abi:nn180100]<0>(v85, "flickeringAuthenticityRate");
    v83[0] = v85;
    v27 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v85, (uint64_t)&std::piecewise_construct, (__int128 **)v83)+ 10);
    std::string::basic_string[abi:nn180100]<0>(v83, "flickeringAuthenticityCount");
    v73[0] = v83;
    *(float *)&v28 = v27
                   / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v83, (uint64_t)&std::piecewise_construct, (__int128 **)v73)+ 10);
    objc_msgSend(v26, "numberWithFloat:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*a3, "setObject:forKeyedSubscript:", v29, CFSTR("flickeringAuthenticityRate"));
  if (v25 != 0.0)
  {

    if (v84 < 0)
      operator delete(v83[0]);
    if (v86 < 0)
      operator delete(v85[0]);
  }
  if (v104 < 0)
    operator delete(v103[0]);
  objc_msgSend(*a3, "removeObjectForKey:", CFSTR("flickeringAuthenticityCount"));
  objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("semanticsCount"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "floatValue");
  v32 = v31;

  if (v32 > 0.0)
  {
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    objc_msgSend(*a3, "allKeys");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v79, v107, 16);
    if (v34)
    {
      v35 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v34; ++i)
        {
          if (*(_QWORD *)v80 != v35)
            objc_enumerationMutation(v33);
          v37 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
          if ((objc_msgSend(v37, "isEqualToString:", CFSTR("semanticsCount")) & 1) == 0
            && objc_msgSend(v37, "hasPrefix:", CFSTR("semantics")))
          {
            objc_msgSend(*a3, "objectForKeyedSubscript:", v37);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "floatValue");
            v40 = v39;

            objc_msgSend(*a3, "removeObjectForKey:", v37);
            *(float *)&v41 = v40 / v32;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v41);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*a3, "setObject:forKeyedSubscript:", v42, v37);

          }
        }
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v79, v107, 16);
      }
      while (v34);
    }

  }
  objc_msgSend(*a3, "removeObjectForKey:", CFSTR("semanticsCount"));
  objc_msgSend(*a3, "objectForKeyedSubscript:", CFSTR("deviceOrientCount"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "floatValue");
  v45 = v44;

  if (v45 > 0.0)
  {
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    objc_msgSend(*a3, "allKeys");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v75, v106, 16);
    if (v47)
    {
      v48 = *(_QWORD *)v76;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v76 != v48)
            objc_enumerationMutation(v46);
          v50 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * j);
          if ((objc_msgSend(v50, "isEqualToString:", CFSTR("deviceOrientCount")) & 1) == 0
            && objc_msgSend(v50, "hasPrefix:", CFSTR("deviceOrient")))
          {
            objc_msgSend(*a3, "objectForKeyedSubscript:", v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "floatValue");
            v53 = v52;

            objc_msgSend(*a3, "removeObjectForKey:", v50);
            *(float *)&v54 = v53 / v45;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v54);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*a3, "setObject:forKeyedSubscript:", v55, v50);

          }
        }
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v75, v106, 16);
      }
      while (v47);
    }

  }
  objc_msgSend(*a3, "removeObjectForKey:", CFSTR("deviceOrientCount"));
  std::string::basic_string[abi:nn180100]<0>(v103, "monocularDepthCount");
  v73[0] = v103;
  v56 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (__int128 **)v73)+ 10);
  if (v56 == 0.0)
  {
    v60 = &unk_24CA66648;
  }
  else
  {
    v57 = (void *)MEMORY[0x24BDD16E0];
    std::string::basic_string[abi:nn180100]<0>(v73, "monocularDepthSum");
    v71[0] = v73;
    v58 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v73, (uint64_t)&std::piecewise_construct, (__int128 **)v71)+ 10);
    std::string::basic_string[abi:nn180100]<0>(v71, "monocularDepthCount");
    v69[0] = v71;
    *(float *)&v59 = v58
                   / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v71, (uint64_t)&std::piecewise_construct, (__int128 **)v69)+ 10);
    objc_msgSend(v57, "numberWithFloat:", v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*a3, "setObject:forKeyedSubscript:", v60, CFSTR("monocularDepth"));
  if (v56 != 0.0)
  {

    if (v72 < 0)
      operator delete(v71[0]);
    if (v74 < 0)
      operator delete(v73[0]);
  }
  if (v104 < 0)
    operator delete(v103[0]);
  objc_msgSend(*a3, "removeObjectForKey:", CFSTR("monocularDepthCount"));
  objc_msgSend(*a3, "removeObjectForKey:", CFSTR("monocularDepthSum"));
  std::string::basic_string[abi:nn180100]<0>(v103, "metricDepthCount");
  v69[0] = v103;
  v61 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v103, (uint64_t)&std::piecewise_construct, (__int128 **)v69)+ 10);
  if (v61 == 0.0)
  {
    v65 = &unk_24CA66648;
  }
  else
  {
    v62 = (void *)MEMORY[0x24BDD16E0];
    std::string::basic_string[abi:nn180100]<0>(v69, "metricDepthSum");
    v67[0] = v69;
    v63 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v69, (uint64_t)&std::piecewise_construct, (__int128 **)v67)+ 10);
    std::string::basic_string[abi:nn180100]<0>(v67, "metricDepthCount");
    v105 = v67;
    *(float *)&v64 = v63
                   / *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)p_accumulatedData, (uint64_t)v67, (uint64_t)&std::piecewise_construct, (__int128 **)&v105)+ 10);
    objc_msgSend(v62, "numberWithFloat:", v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*a3, "setObject:forKeyedSubscript:", v65, CFSTR("metricDepth"));
  if (v61 != 0.0)
  {

    if (v68 < 0)
      operator delete(v67[0]);
    if (v70 < 0)
      operator delete(v69[0]);
  }
  if (v104 < 0)
    operator delete(v103[0]);
  objc_msgSend(*a3, "removeObjectForKey:", CFSTR("metricDepthCount"));
  objc_msgSend(*a3, "removeObjectForKey:", CFSTR("metricDepthSum"));
}

- (id)coreAnalyticDictionary
{
  id v3;
  NSString *countItemKey;
  float v5;
  unsigned __int8 *v6;
  unsigned __int8 *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char *next;
  double v14;
  const void **v15;
  size_t v16;
  uint64_t v17;
  int v18;
  unsigned __int8 *v19;
  uint64_t v20;
  int v21;
  int v22;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  id v28;
  id v30;
  void *__p;
  size_t __n;
  unsigned __int8 v33;
  void **p_p;

  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  countItemKey = self->_countItemKey;
  v5 = 1.0;
  if (countItemKey)
  {
    std::string::basic_string[abi:nn180100]<0>(&__p, (char *)-[NSString UTF8String](countItemKey, "UTF8String"));
    v6 = std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::find<std::string>(&self->_accumulatedData.__table_.__bucket_list_.__ptr_.__value_, (uint64_t)&__p);
    v7 = v6;
    if ((char)v33 < 0)
    {
      operator delete(__p);
      if (!v7)
        goto LABEL_9;
    }
    else if (!v6)
    {
      goto LABEL_9;
    }
    std::string::basic_string[abi:nn180100]<0>(&__p, (char *)-[NSString UTF8String](self->_countItemKey, "UTF8String"));
    p_p = &__p;
    v5 = *((float *)std::__hash_table<std::__hash_value_type<std::string,float>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,float>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,float>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t)&self->_accumulatedData, (uint64_t)&__p, (uint64_t)&std::piecewise_construct, (__int128 **)&p_p)+ 10);
    if ((char)v33 < 0)
      operator delete(__p);
    *(float *)&v8 = v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, self->_countItemKey);

  }
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_elapseTime);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("elapseTime"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5 / self->_elapseTime);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("countPerSecond"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", CACurrentMediaTime() - self->_createdTime);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("modelAge"));

  next = (char *)self->_accumulatedData.__table_.__p1_.__value_.__next_;
  if (next)
  {
    while (1)
    {
      std::string::basic_string[abi:nn180100]<0>(&__p, (char *)-[NSString UTF8String](self->_countItemKey, "UTF8String"));
      v15 = (const void **)(next + 16);
      if ((v33 & 0x80u) == 0)
        v16 = v33;
      else
        v16 = __n;
      v17 = next[39];
      v18 = (char)v17;
      if ((v17 & 0x80u) != 0)
        v17 = *((_QWORD *)next + 3);
      if (v16 != v17)
        break;
      if (v18 >= 0)
        v19 = (unsigned __int8 *)(next + 16);
      else
        v19 = (unsigned __int8 *)*v15;
      if ((v33 & 0x80) != 0)
      {
        v24 = __p;
        v25 = memcmp(__p, v19, __n);
        operator delete(v24);
        if (v25)
          goto LABEL_32;
      }
      else if (v33)
      {
        v20 = 0;
        do
        {
          v21 = *((unsigned __int8 *)&__p + v20);
          v22 = v19[v20];
        }
        while (v21 == v22 && v33 - 1 != v20++);
        if (v21 != v22)
          goto LABEL_32;
      }
LABEL_35:
      next = *(char **)next;
      if (!next)
        goto LABEL_36;
    }
    if ((v33 & 0x80) != 0)
      operator delete(__p);
LABEL_32:
    *(float *)&v14 = *((float *)next + 10) / v5;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (next[39] < 0)
      v15 = (const void **)*v15;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, v27);

    goto LABEL_35;
  }
LABEL_36:
  if (-[NSString isEqualToString:](self->_coreAnalyticEventName, "isEqualToString:", CFSTR("com.apple.sceneUnderstanding.personPetDetection")))
  {
    v30 = v3;
    -[SICoreAnalyticManager coreAnalyticDictionaryForPersonPetDetection:](self, "coreAnalyticDictionaryForPersonPetDetection:", &v30);
    v28 = v30;

    v3 = v28;
  }
  return v3;
}

- (void).cxx_destruct
{
  std::__hash_table<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,e5rt_execution_stream_operation *>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,e5rt_execution_stream_operation *>>>::~__hash_table((uint64_t)&self->_accumulatedData);
  objc_storeStrong((id *)&self->_accumulatedDataKeys, 0);
  objc_storeStrong((id *)&self->_countItemKey, 0);
  objc_storeStrong((id *)&self->_coreAnalyticEventName, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *((_DWORD *)self + 18) = 1065353216;
  return self;
}

@end
