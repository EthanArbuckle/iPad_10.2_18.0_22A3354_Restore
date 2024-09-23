@implementation TGIE5ModelConfigurationObjC

- (TGIE5ModelConfigurationObjC)initWithModelType:(int64_t)a3 modelBundlePath:(id)a4 e5Functions:(id)a5 adapterConfigurations:(id)a6
{
  id v10;
  id v11;
  id v12;
  TGIE5ModelConfigurationObjC *v13;
  TGIE5ModelConfigurationObjC *v14;
  uint64_t v15;
  NSString *modelBundlePath;
  uint64_t v17;
  NSSet *adapterConfigurations;
  uint64_t v19;
  NSSet *e5Functions;
  NSString *assetIdentifier;
  objc_super v23;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)TGIE5ModelConfigurationObjC;
  v13 = -[TGIE5ModelConfigurationObjC init](&v23, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_modelType = a3;
    v15 = objc_msgSend(v10, "copy");
    modelBundlePath = v14->_modelBundlePath;
    v14->_modelBundlePath = (NSString *)v15;

    v17 = objc_msgSend(v12, "copy");
    adapterConfigurations = v14->_adapterConfigurations;
    v14->_adapterConfigurations = (NSSet *)v17;

    v19 = objc_msgSend(v11, "copy");
    e5Functions = v14->_e5Functions;
    v14->_e5Functions = (NSSet *)v19;

    *(_WORD *)&v14->_useEnergyEfficientMode = 0;
    assetIdentifier = v14->_assetIdentifier;
    v14->_assetIdentifier = (NSString *)&stru_2519E2060;

  }
  return v14;
}

- (TGIE5ModelConfiguration)modelConfiguration
{
  void *v1;
  void *v2;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  BOOL v26;
  id v27;
  TGIE5ModelConfiguration *result;
  char *v29;
  std::__fs::filesystem::path v30;
  _BYTE v31[32];
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40[2];
  void *v41[2];
  void *v42[2];
  void *__p[2];
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v2 = v1;
  v54 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(v1, "modelType");
  if (v4 == 1)
    v5 = 1;
  else
    v5 = 2 * (v4 == 2);
  v49 = 0;
  v50 = 0;
  v51 = 0;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  objc_msgSend(v2, "adapterConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v46 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        if (v10)
        {
          objc_msgSend(v10, "adapterConfiguration");
        }
        else
        {
          v44 = 0;
          *(_OWORD *)v42 = 0u;
          *(_OWORD *)__p = 0u;
          *(_OWORD *)v40 = 0u;
          *(_OWORD *)v41 = 0u;
        }
        std::vector<TGIE5AdapterConfiguration>::push_back[abi:ne180100](&v49, (__int128 *)v40);
        if (SHIBYTE(v44) < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v42[1]) < 0)
          operator delete(v41[1]);
        if (SHIBYTE(v41[0]) < 0)
          operator delete(v40[0]);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    }
    while (v7);
  }

  v37 = 0;
  v38 = 0;
  v39 = 0;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v2, "e5Functions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v52, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v34 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * j);
        if (v15)
        {
          objc_msgSend(v15, "e5Function");
        }
        else
        {
          *(_OWORD *)v42 = 0u;
          *(_OWORD *)__p = 0u;
          *(_OWORD *)v40 = 0u;
          *(_OWORD *)v41 = 0u;
        }
        v16 = v38;
        if (v38 >= v39)
        {
          v19 = std::vector<TGIE5Function>::__push_back_slow_path<TGIE5Function>(&v37, (__int128 *)v40);
        }
        else
        {
          v17 = *(_OWORD *)v40;
          *(void **)(v38 + 16) = v41[0];
          *(_OWORD *)v16 = v17;
          v40[1] = 0;
          v41[0] = 0;
          v40[0] = 0;
          *(void **)(v16 + 24) = v41[1];
          *(_BYTE *)(v16 + 32) = 0;
          *(_BYTE *)(v16 + 56) = 0;
          if (LOBYTE(__p[1]))
          {
            v18 = *(_OWORD *)v42;
            *(void **)(v16 + 48) = __p[0];
            *(_OWORD *)(v16 + 32) = v18;
            v42[1] = 0;
            __p[0] = 0;
            v42[0] = 0;
            *(_BYTE *)(v16 + 56) = 1;
          }
          v19 = v16 + 64;
        }
        v38 = v19;
        if (LOBYTE(__p[1]) && SHIBYTE(__p[0]) < 0)
          operator delete(v42[0]);
        if (SHIBYTE(v41[0]) < 0)
          operator delete(v40[0]);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v52, 16);
    }
    while (v12);
  }

  *(_OWORD *)v40 = 0u;
  *(_OWORD *)v41 = 0u;
  LODWORD(v42[0]) = 1065353216;
  objc_msgSend(v2, "baseModel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20 == 0;

  if (!v21)
  {
    objc_msgSend(v2, "baseModel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "sharedConstants");
    }
    else
    {
      v32 = 0;
      memset(v31, 0, sizeof(v31));
    }
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>>>::__move_assign((uint64_t)v40, (uint64_t *)v31);
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::~__hash_table((uint64_t)v31);

  }
  objc_msgSend(v2, "modelBundlePath");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v29 = (char *)objc_msgSend(v24, "UTF8String");
  std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v30.__pn_, &v29);
  std::__fs::filesystem::__canonical((std::__fs::filesystem::path *)v31, &v30, 0);
  if (SHIBYTE(v30.__pn_.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v30.__pn_.__r_.__value_.__l.__data_);

  retstr->var0 = v5;
  *(_OWORD *)retstr->var1.var0.var0.var0.var0.var0.var0 = *(_OWORD *)v31;
  *((_QWORD *)&retstr->var1.var0.var0.var0.var0.var1 + 2) = *(_QWORD *)&v31[16];
  memset(v31, 0, 24);
  retstr->var1.var0.var0.var1.var0[0] = 0;
  retstr->var1.var0.var0.var1.var0[1] = 0;
  retstr->var1.var0.var0.var1.var0[2] = 0;
  std::vector<TGIE5AdapterConfiguration>::__init_with_size[abi:ne180100]<TGIE5AdapterConfiguration*,TGIE5AdapterConfiguration*>(retstr->var1.var0.var0.var1.var0, v49, v50, 0x8E38E38E38E38E39 * ((v50 - v49) >> 3));
  *(_QWORD *)&retstr[1].var0 = 0;
  retstr[1].var1.var0.var0.var0.var0.var1.var0 = 0;
  retstr[1].var1.var0.var0.var0.var0.var1.var1 = 0;
  std::vector<TGIE5Function>::__init_with_size[abi:ne180100]<TGIE5Function*,TGIE5Function*>(&retstr[1].var0, v37, v38, (uint64_t)(v38 - v37) >> 6);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::MemoryObject>>>>::__hash_table((uint64_t)(&retstr[1].var1.var0.var0.var0.var0.var1 + 1), (uint64_t *)v40);
  retstr[2].var1.var0.var0.var0.var0.var1.var0 = 0;
  retstr[2].var1.var0.var0.var0.var0.var1.var1 = 0;
  *((_QWORD *)&retstr[2].var1.var0.var0.var0.var0.var1 + 2) = 0;
  LOBYTE(retstr[2].var1.var0.var0.var1.var0[0]) = objc_msgSend(v2, "useModelCatalogE5CompilerCache");
  objc_msgSend(v2, "serializeModelIOPath");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25 == 0;

  if (!v26)
  {
    objc_msgSend(v2, "serializeModelIOPath");
    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v30.__pn_.__r_.__value_.__r.__words[0] = objc_msgSend(v27, "UTF8String");
    std::__fs::filesystem::path::assign[abi:ne180100]<char const*>((std::string *)&retstr[2].var1, &v30.__pn_.__r_.__value_.__l.__data_);

  }
  if ((v31[23] & 0x80000000) != 0)
    operator delete(*(void **)v31);
  std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<E5RT::IOPort>>>>::~__hash_table((uint64_t)v40);
  v40[0] = &v37;
  std::vector<TGIE5Function>::__destroy_vector::operator()[abi:ne180100]((void ***)v40);
  v40[0] = &v49;
  std::vector<TGIE5AdapterConfiguration>::__destroy_vector::operator()[abi:ne180100]((void ***)v40);
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  TGIE5ModelConfigurationObjC *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  TGIE5ModelConfigurationObjC *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = [TGIE5ModelConfigurationObjC alloc];
  v5 = -[TGIE5ModelConfigurationObjC modelType](self, "modelType");
  -[TGIE5ModelConfigurationObjC modelBundlePath](self, "modelBundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGIE5ModelConfigurationObjC e5Functions](self, "e5Functions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGIE5ModelConfigurationObjC adapterConfigurations](self, "adapterConfigurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TGIE5ModelConfigurationObjC initWithModelType:modelBundlePath:e5Functions:adapterConfigurations:](v4, "initWithModelType:modelBundlePath:e5Functions:adapterConfigurations:", v5, v6, v7, v8);

  -[TGIE5ModelConfigurationObjC serializeModelIOPath](self, "serializeModelIOPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGIE5ModelConfigurationObjC setSerializeModelIOPath:](v9, "setSerializeModelIOPath:", v10);

  -[TGIE5ModelConfigurationObjC baseModel](self, "baseModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGIE5ModelConfigurationObjC setBaseModel:](v9, "setBaseModel:", v11);

  -[TGIE5ModelConfigurationObjC setUseEnergyEfficientMode:](v9, "setUseEnergyEfficientMode:", -[TGIE5ModelConfigurationObjC useEnergyEfficientMode](self, "useEnergyEfficientMode"));
  -[TGIE5ModelConfigurationObjC setUseModelCatalogE5CompilerCache:](v9, "setUseModelCatalogE5CompilerCache:", -[TGIE5ModelConfigurationObjC useModelCatalogE5CompilerCache](self, "useModelCatalogE5CompilerCache"));
  -[TGIE5ModelConfigurationObjC assetIdentifier](self, "assetIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGIE5ModelConfigurationObjC setAssetIdentifier:](v9, "setAssetIdentifier:", v12);

  return v9;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TGIMutableE5ModelConfigurationObjC *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  TGIMutableE5ModelConfigurationObjC *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = [TGIMutableE5ModelConfigurationObjC alloc];
  v5 = -[TGIE5ModelConfigurationObjC modelType](self, "modelType");
  -[TGIE5ModelConfigurationObjC modelBundlePath](self, "modelBundlePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGIE5ModelConfigurationObjC e5Functions](self, "e5Functions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGIE5ModelConfigurationObjC adapterConfigurations](self, "adapterConfigurations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TGIE5ModelConfigurationObjC initWithModelType:modelBundlePath:e5Functions:adapterConfigurations:](v4, "initWithModelType:modelBundlePath:e5Functions:adapterConfigurations:", v5, v6, v7, v8);

  -[TGIE5ModelConfigurationObjC serializeModelIOPath](self, "serializeModelIOPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGIE5ModelConfigurationObjC setSerializeModelIOPath:](v9, "setSerializeModelIOPath:", v10);

  -[TGIE5ModelConfigurationObjC baseModel](self, "baseModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGIE5ModelConfigurationObjC setBaseModel:](v9, "setBaseModel:", v11);

  -[TGIE5ModelConfigurationObjC setUseEnergyEfficientMode:](v9, "setUseEnergyEfficientMode:", -[TGIE5ModelConfigurationObjC useEnergyEfficientMode](self, "useEnergyEfficientMode"));
  -[TGIE5ModelConfigurationObjC setUseModelCatalogE5CompilerCache:](v9, "setUseModelCatalogE5CompilerCache:", -[TGIE5ModelConfigurationObjC useModelCatalogE5CompilerCache](self, "useModelCatalogE5CompilerCache"));
  -[TGIE5ModelConfigurationObjC assetIdentifier](self, "assetIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TGIE5ModelConfigurationObjC setAssetIdentifier:](v9, "setAssetIdentifier:", v12);

  return v9;
}

- (unint64_t)hash
{
  int64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _BOOL4 v13;
  void *v14;
  unint64_t v15;

  v3 = -[TGIE5ModelConfigurationObjC modelType](self, "modelType");
  -[TGIE5ModelConfigurationObjC modelBundlePath](self, "modelBundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[TGIE5ModelConfigurationObjC adapterConfigurations](self, "adapterConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  v8 = -[TGIE5ModelConfigurationObjC useEnergyEfficientMode](self, "useEnergyEfficientMode");
  -[TGIE5ModelConfigurationObjC baseModel](self, "baseModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash");

  -[TGIE5ModelConfigurationObjC serializeModelIOPath](self, "serializeModelIOPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash");

  v13 = -[TGIE5ModelConfigurationObjC useModelCatalogE5CompilerCache](self, "useModelCatalogE5CompilerCache");
  -[TGIE5ModelConfigurationObjC assetIdentifier](self, "assetIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v5 ^ v3 ^ v7 ^ v8 ^ (unint64_t)v10 ^ v12 ^ v13 ^ objc_msgSend(v14, "hash");

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  objc_object *v9;
  objc_object *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  BOOL v15;
  void *v17;
  void *v18;
  objc_object *v19;
  objc_object *v20;
  objc_object *v21;
  objc_object *v22;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[TGIE5ModelConfigurationObjC modelType](self, "modelType");
    if (v6 == objc_msgSend(v5, "modelType"))
    {
      -[TGIE5ModelConfigurationObjC modelBundlePath](self, "modelBundlePath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "modelBundlePath");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqual:", v8))
      {
        -[TGIE5ModelConfigurationObjC adapterConfigurations](self, "adapterConfigurations");
        v9 = (objc_object *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "adapterConfigurations");
        v10 = (objc_object *)objc_claimAutoreleasedReturnValue();
        if (TGIIsEqualAllowingNil(v9, v10))
        {
          -[TGIE5ModelConfigurationObjC e5Functions](self, "e5Functions");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "e5Functions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", v12))
          {
            -[TGIE5ModelConfigurationObjC baseModel](self, "baseModel");
            v22 = (objc_object *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "baseModel");
            v21 = (objc_object *)objc_claimAutoreleasedReturnValue();
            if (TGIIsEqualAllowingNil(v22, v21))
            {
              -[TGIE5ModelConfigurationObjC serializeModelIOPath](self, "serializeModelIOPath");
              v20 = (objc_object *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "serializeModelIOPath");
              v19 = (objc_object *)objc_claimAutoreleasedReturnValue();
              if (TGIIsEqualAllowingNil(v20, v19)
                && (v13 = -[TGIE5ModelConfigurationObjC useEnergyEfficientMode](self, "useEnergyEfficientMode", v19),
                    v13 == objc_msgSend(v5, "useEnergyEfficientMode"))
                && (v14 = -[TGIE5ModelConfigurationObjC useModelCatalogE5CompilerCache](self, "useModelCatalogE5CompilerCache"), v14 == objc_msgSend(v5, "useModelCatalogE5CompilerCache")))
              {
                -[TGIE5ModelConfigurationObjC assetIdentifier](self, "assetIdentifier");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "assetIdentifier");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = v17 == v18;

              }
              else
              {
                v15 = 0;
              }

            }
            else
            {
              v15 = 0;
            }

          }
          else
          {
            v15 = 0;
          }

        }
        else
        {
          v15 = 0;
        }

      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[7];
  _QWORD v14[8];

  v14[7] = *MEMORY[0x24BDAC8D0];
  v13[0] = CFSTR("modelType");
  TGIE5ModelTypeObjcToString(-[TGIE5ModelConfigurationObjC modelType](self, "modelType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = CFSTR("modelBundlePath");
  -[TGIE5ModelConfigurationObjC modelBundlePath](self, "modelBundlePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v4;
  v13[2] = CFSTR("e5Functions");
  -[TGIE5ModelConfigurationObjC e5Functions](self, "e5Functions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v5;
  v13[3] = CFSTR("adapterConfigurations");
  -[TGIE5ModelConfigurationObjC adapterConfigurations](self, "adapterConfigurations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v6;
  v13[4] = CFSTR("useEnergyEfficientMode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TGIE5ModelConfigurationObjC useEnergyEfficientMode](self, "useEnergyEfficientMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[4] = v7;
  v13[5] = CFSTR("useModelCatalogE5CompilerCache");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[TGIE5ModelConfigurationObjC useModelCatalogE5CompilerCache](self, "useModelCatalogE5CompilerCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[5] = v8;
  v13[6] = CFSTR("assetIdentifier");
  -[TGIE5ModelConfigurationObjC assetIdentifier](self, "assetIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[6] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "description");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (int64_t)modelType
{
  return self->_modelType;
}

- (NSString)modelBundlePath
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)adapterConfigurations
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)e5Functions
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)serializeModelIOPath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSerializeModelIOPath:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (TGIE5BaseModelObjC)baseModel
{
  return (TGIE5BaseModelObjC *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBaseModel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (BOOL)useEnergyEfficientMode
{
  return self->_useEnergyEfficientMode;
}

- (void)setUseEnergyEfficientMode:(BOOL)a3
{
  self->_useEnergyEfficientMode = a3;
}

- (BOOL)useModelCatalogE5CompilerCache
{
  return self->_useModelCatalogE5CompilerCache;
}

- (void)setUseModelCatalogE5CompilerCache:(BOOL)a3
{
  self->_useModelCatalogE5CompilerCache = a3;
}

- (NSString)assetIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAssetIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_baseModel, 0);
  objc_storeStrong((id *)&self->_serializeModelIOPath, 0);
  objc_storeStrong((id *)&self->_e5Functions, 0);
  objc_storeStrong((id *)&self->_adapterConfigurations, 0);
  objc_storeStrong((id *)&self->_modelBundlePath, 0);
}

@end
