@implementation L3ModelManager

- (BOOL)loadModel
{
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  spotlight_l3_1 *v8;
  NSObject *v9;
  spotlight_l3_1 *model;
  BOOL v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  self->_loaded = 0;
  if (!-[L3ModelManager loadDictionary](self, "loadDictionary"))
  {
    SSGeneralLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[L3ModelManager loadModel].cold.3();
    goto LABEL_13;
  }
  if (!-[L3ModelManager loadModelConfig](self, "loadModelConfig"))
  {
    SSGeneralLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[L3ModelManager loadModel].cold.2();
LABEL_13:
    v11 = 0;
    goto LABEL_18;
  }
  v3 = CFSTR("spotlight_l3_ios_v1.mlmodelc");
  SSDefaultsGetAssetPath(CFSTR("spotlight_l3_ios_v1.mlmodelc"));
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v3 = CFSTR("spotlight_l3_ios.mlmodelc");
    SSDefaultsGetAssetPath(CFSTR("spotlight_l3_ios.mlmodelc"));
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setComputeUnits:", 0);
  v15 = 0;
  v8 = -[spotlight_l3_1 initWithContentsOfURL:configuration:error:]([spotlight_l3_1 alloc], "initWithContentsOfURL:configuration:error:", v6, v7, &v15);
  v9 = v15;
  model = self->_model;
  self->_model = v8;

  v11 = v9 == 0;
  SSGeneralLog();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[L3ModelManager loadModel].cold.1((uint64_t)v3, (uint64_t)v9, v13);

  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v17 = v3;
      _os_log_impl(&dword_1B86C5000, v13, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking] L3 - successfully loaded l3 model %@ ", buf, 0xCu);
    }

    self->_loaded = 1;
  }

LABEL_18:
  return v11;
}

- (_MDPlistContainer)loadMdpData:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _MDPlistContainer *v8;

  SSDefaultsGetAssetPath(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v4, 8, 0);
    v6 = v5;
    if (v5)
    {
      v7 = objc_retainAutorelease(v5);
      objc_msgSend(v7, "bytes");
      objc_msgSend(v7, "length");
      v8 = (_MDPlistContainer *)_MDPlistContainerCreateWithBytesAndDeallocator();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __30__L3ModelManager_loadMdpData___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (BOOL)loadDictionary
{
  _MDPlistContainer *v3;
  _MDPlistContainer *v4;
  SSPlistDataReader *localeDict;
  SSPlistDataReader *bundleDict;
  SSPlistDataReader *v7;
  SSPlistDataReader *v8;
  SSPlistDataReader *v9;
  SSPlistDataReader *v10;
  SSPlistDataReader *v11;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = -[L3ModelManager loadMdpData:](self, "loadMdpData:", CFSTR("spotlight_l3_dictionary.mdplist"));
  if (v3)
  {
    v4 = v3;
    v17 = xmmword_1E6E43B40;
    v18 = xmmword_1E6E43B30;
    v15 = 0uLL;
    v16 = 0;
    localeDict = self->_localeDict;
    self->_localeDict = 0;

    bundleDict = self->_bundleDict;
    self->_bundleDict = 0;

    if (_MDPlistContainerGetPlistObjectAtKeyArray())
    {
      v13 = v15;
      v14 = v16;
      v7 = -[SSPlistDataReader initWithPlistContainer:obj:]([SSPlistDataReader alloc], "initWithPlistContainer:obj:", v4, &v13);
      v8 = self->_bundleDict;
      self->_bundleDict = v7;

    }
    if (_MDPlistContainerGetPlistObjectAtKeyArray())
    {
      v9 = [SSPlistDataReader alloc];
      v13 = v15;
      v14 = v16;
      v10 = -[SSPlistDataReader initWithPlistContainer:obj:](v9, "initWithPlistContainer:obj:", v4, &v13);
      v11 = self->_localeDict;
      self->_localeDict = v10;

    }
    if (self->_bundleDict)
      LOBYTE(v3) = self->_localeDict != 0;
    else
      LOBYTE(v3) = 0;
  }
  return (char)v3;
}

- (BOOL)loadModelConfig
{
  L3ModelManager *v2;
  _MDPlistContainer *v3;
  uint64_t v4;
  uint64_t v5;
  NSMutableArray *idFeatureConfigs;
  uint64_t v7;
  NSMutableArray *denseFeatureConfigs;
  int Count;
  int v10;
  int v11;
  unint64_t v12;
  _UNKNOWN **v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  _UNKNOWN **v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  _UNKNOWN **v36;
  _MDPlistContainer *v37;
  NSObject *v38;
  NSObject *v39;
  int v41;
  L3ModelManager *v42;
  _MDPlistContainer *cf;
  int v44;
  NSMutableArray **p_idFeatureConfigs;
  void **p_denseFeatureConfigs;
  uint64_t v47;
  void *v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  __int128 v57;
  uint64_t v58;

  v2 = self;
  v58 = *MEMORY[0x1E0C80C00];
  v3 = -[L3ModelManager loadMdpData:](self, "loadMdpData:", CFSTR("spotlight_l3_model_v1.mdplist"));
  if (v3
    || (v4 = -[L3ModelManager loadMdpData:](v2, "loadMdpData:", CFSTR("spotlight_l3_model.mdplist")),
        (v3 = (_MDPlistContainer *)v4) != 0))
  {
    v57 = xmmword_1E6E43B50;
    v55 = 0uLL;
    v56 = 0;
    if (_MDPlistContainerGetPlistObjectAtKeyArray())
    {
      cf = v3;
      v5 = objc_opt_new();
      idFeatureConfigs = v2->_idFeatureConfigs;
      p_idFeatureConfigs = &v2->_idFeatureConfigs;
      v2->_idFeatureConfigs = (NSMutableArray *)v5;

      v7 = objc_opt_new();
      denseFeatureConfigs = v2->_denseFeatureConfigs;
      p_denseFeatureConfigs = (void **)&v2->_denseFeatureConfigs;
      v2->_denseFeatureConfigs = (NSMutableArray *)v7;

      v53 = v55;
      v54 = v56;
      Count = _MDPlistArrayGetCount();
      if (Count >= 1)
      {
        v10 = Count;
        v11 = 0;
        v12 = 0x1E0CB3000uLL;
        v13 = &off_1E6E41000;
        v42 = v2;
        v41 = Count;
        while (1)
        {
          v53 = 0uLL;
          v54 = 0;
          v51 = v55;
          v52 = v56;
          _MDPlistArrayGetPlistObjectAtIndex();
          v51 = 0uLL;
          v52 = 0;
          if (-[L3ModelManager getBoolFeatureField:valueObj:fieldName:defaultValue:](v2, "getBoolFeatureField:valueObj:fieldName:defaultValue:", &v53, &v51, "enabled", 1))
          {
            break;
          }
LABEL_24:
          if (++v11 == v10)
            goto LABEL_27;
        }
        v14 = -[L3ModelManager getStringFeatureField:valueObj:fieldName:log:](v2, "getStringFeatureField:valueObj:fieldName:log:", &v53, &v51, "name", 1);
        if (!v14)
        {
          SSGeneralLog();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            -[L3ModelManager loadModelConfig].cold.1();

          v37 = cf;
          goto LABEL_32;
        }
        v15 = v14;
        objc_msgSend(*(id *)(v12 + 2368), "stringWithUTF8String:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (!strcmp(-[L3ModelManager getStringFeatureField:valueObj:fieldName:log:](v2, "getStringFeatureField:valueObj:fieldName:log:", &v53, &v51, "feature_type", 1), "id_string"))
        {
          v17 = (void *)objc_opt_new();
          objc_msgSend(v17, "setName:", v16);
          objc_msgSend(v17, "setEmbeddingTableSize:", -[L3ModelManager getIntFeatureField:valueObj:fieldName:defaultValue:](v2, "getIntFeatureField:valueObj:fieldName:defaultValue:", &v53, &v51, "embedding_size", 1024));
          objc_msgSend(v17, "setEmbeddingDimention:", -[L3ModelManager getIntFeatureField:valueObj:fieldName:defaultValue:](v2, "getIntFeatureField:valueObj:fieldName:defaultValue:", &v53, &v51, "embedding_dim", 128));
          objc_msgSend(v17, "setHashing:", -[L3ModelManager getBoolFeatureField:valueObj:fieldName:defaultValue:](v2, "getBoolFeatureField:valueObj:fieldName:defaultValue:", &v53, &v51, "hashing", 0));
          objc_msgSend(v17, "setHashBucketStart:", -[L3ModelManager getIntFeatureField:valueObj:fieldName:defaultValue:](v2, "getIntFeatureField:valueObj:fieldName:defaultValue:", &v53, &v51, "hash_bucket_start", 128));
          v22 = (id *)p_idFeatureConfigs;
        }
        else
        {
          v47 = v15;
          v17 = (void *)objc_opt_new();
          LODWORD(v18) = 0;
          -[L3ModelManager getFloatFeatureField:valueObj:fieldName:defaultValue:](v2, "getFloatFeatureField:valueObj:fieldName:defaultValue:", &v53, &v51, "default_value", v18);
          objc_msgSend(v17, "setDefaultValue:");
          v49 = v53;
          v50 = v54;
          if (_MDPlistDictionaryGetPlistObjectForKey())
          {
            objc_msgSend(v17, "setNormalization:", 1);
            v49 = 0uLL;
            v50 = 0;
            objc_msgSend(*(id *)(v12 + 2368), "stringWithUTF8String:", -[L3ModelManager getStringFeatureField:valueObj:fieldName:log:](v2, "getStringFeatureField:valueObj:fieldName:log:", &v51, &v49, "type", 1));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setNormalizationType:", v19);

            *(float *)&v20 = (float)-[L3ModelManager getIntFeatureField:valueObj:fieldName:defaultValue:](v2, "getIntFeatureField:valueObj:fieldName:defaultValue:", &v51, &v49, "min", 0);
            objc_msgSend(v17, "setNormalizationMin:", v20);
            *(float *)&v21 = (float)-[L3ModelManager getIntFeatureField:valueObj:fieldName:defaultValue:](v2, "getIntFeatureField:valueObj:fieldName:defaultValue:", &v51, &v49, "max", 10);
            objc_msgSend(v17, "setNormalizationMax:", v21);
          }
          else
          {
            objc_msgSend(v17, "setNormalization:", 0);
          }
          v23 = -[L3ModelManager getStringFeatureField:valueObj:fieldName:log:](v2, "getStringFeatureField:valueObj:fieldName:log:", &v53, &v51, "transform", 0);
          if (v23)
          {
            v24 = v23;
            objc_msgSend(v17, "setTransform:", 1);
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setTransformType:", v25);

            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", -[L3ModelManager getStringFeatureField:valueObj:fieldName:log:](v2, "getStringFeatureField:valueObj:fieldName:log:", &v53, &v51, "original_feature", 1));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setOriginalFeatureName:", v26);

          }
          if (-[L3ModelManager getStringFeatureField:valueObj:fieldName:log:](v2, "getStringFeatureField:valueObj:fieldName:log:", &v53, &v51, "nested_field", 0))
          {
            v27 = -[L3ModelManager getStringFeatureField:valueObj:fieldName:log:](v2, "getStringFeatureField:valueObj:fieldName:log:", &v53, &v51, "sub_name", 1);
            if (!v27)
            {
              SSGeneralLog();
              v39 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                -[L3ModelManager loadModelConfig].cold.2();

              CFRelease(cf);
              goto LABEL_33;
            }
            v28 = v27;
            v29 = -[L3ModelManager getIntFeatureField:valueObj:fieldName:defaultValue:](v2, "getIntFeatureField:valueObj:fieldName:defaultValue:", &v53, &v51, "padding", 3);
            if (v29 < 1)
            {
              v12 = 0x1E0CB3000;
            }
            else
            {
              v44 = v11;
              v30 = 0;
              v48 = v17;
              v31 = v13;
              v32 = (uint64_t)v16;
              do
              {
                v33 = (void *)v32;
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s_%s_%d"), v47, v28, v30);
                v32 = objc_claimAutoreleasedReturnValue();

                v34 = *p_denseFeatureConfigs;
                v35 = (void *)objc_msgSend(objc_alloc((Class)v31[297]), "initWithConfig:name:", v48, v32);
                objc_msgSend(v34, "addObject:", v35);

                v30 = (v30 + 1);
              }
              while (v29 != (_DWORD)v30);
              v2 = v42;
              v10 = v41;
              v12 = 0x1E0CB3000;
              v11 = v44;
              v36 = v31;
              v17 = v48;
              v16 = (void *)v32;
              v13 = v36;
            }
            goto LABEL_23;
          }
          objc_msgSend(v17, "setName:", v16);
          v22 = p_denseFeatureConfigs;
          v12 = 0x1E0CB3000;
        }
        objc_msgSend(*v22, "addObject:", v17);
LABEL_23:

        goto LABEL_24;
      }
LABEL_27:
      CFRelease(cf);
      LOBYTE(v4) = 1;
    }
    else
    {
      v37 = v3;
LABEL_32:
      CFRelease(v37);
LABEL_33:
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (BOOL)loadUnitTestData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v4 = a3;
  if (-[L3ModelManager loadMdpData:](self, "loadMdpData:", CFSTR("spotlight_l3_ios_unit_test_data_v1.mdplist")))
  {
    memset(v11, 0, sizeof(v11));
    _MDPlistGetRootPlistObjectFromPlist();
    -[L3ModelManager get2DArrayFeatureField:fieldName:dataType:](self, "get2DArrayFeatureField:fieldName:dataType:", v11, "idFeatures", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[L3ModelManager get2DArrayFeatureField:fieldName:dataType:](self, "get2DArrayFeatureField:fieldName:dataType:", v11, "denseFeatures", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6 != 0;
      if (v6)
      {
        -[L3ModelManager getArrayDictionaryFeatureField:fieldName:](self, "getArrayDictionaryFeatureField:fieldName:", v11, "rawFeatures");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[L3ModelManager getArrayFeatureField:fieldName:dataType:](self, "getArrayFeatureField:fieldName:dataType:", v11, "scores", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("idFeatures"));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("denseFeatures"));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("rawFeatures"));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("scores"));

      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (const)getStringFeatureField:(id *)a3 valueObj:(id *)a4 fieldName:(const char *)a5 log:(BOOL)a6
{
  _BOOL4 v6;
  NSObject *v9;

  v6 = a6;
  if (_MDPlistDictionaryGetPlistObjectForKey())
    return (const char *)_MDPlistStringGetValue();
  if (v6)
  {
    SSGeneralLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[L3ModelManager getStringFeatureField:valueObj:fieldName:log:].cold.1((uint64_t)a5, v9);

  }
  return 0;
}

- (BOOL)getBoolFeatureField:(id *)a3 valueObj:(id *)a4 fieldName:(const char *)a5 defaultValue:(BOOL)a6
{
  if (_MDPlistDictionaryGetPlistObjectForKey())
    return _MDPlistBooleanGetValue() != 0;
  return a6;
}

- (int64_t)getIntFeatureField:(id *)a3 valueObj:(id *)a4 fieldName:(const char *)a5 defaultValue:(int64_t)a6
{
  if (_MDPlistDictionaryGetPlistObjectForKey())
    return _MDPlistNumberGetIntValue();
  return a6;
}

- (float)getFloatFeatureField:(id *)a3 valueObj:(id *)a4 fieldName:(const char *)a5 defaultValue:(float)a6
{
  double v7;

  if (_MDPlistDictionaryGetPlistObjectForKey())
  {
    _MDPlistNumberGetDoubleValue();
    return v7;
  }
  return a6;
}

- (id)get2DArrayFeatureField:(id *)a3 fieldName:(const char *)a4 dataType:(int)a5
{
  int Count;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  int i;
  void *v13;
  void *v14;
  id v15;

  if (!_MDPlistDictionaryGetPlistObjectForKey())
    return 0;
  Count = _MDPlistArrayGetCount();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
  if (Count < 1)
  {
LABEL_12:
    v15 = v7;
    goto LABEL_15;
  }
  v8 = 0;
  while (1)
  {
    _MDPlistArrayGetPlistObjectAtIndex();
    v9 = _MDPlistArrayGetCount();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9);
    v11 = v10;
    if (v9 >= 1)
      break;
LABEL_11:
    objc_msgSend(v7, "addObject:", v11);

    if (++v8 == Count)
      goto LABEL_12;
  }
  if (a5 <= 1)
  {
    for (i = 0; i != v9; ++i)
    {
      v13 = (void *)MEMORY[0x1E0CB37E8];
      _MDPlistArrayGetPlistObjectAtIndex();
      if (a5)
      {
        _MDPlistNumberGetDoubleValue();
        objc_msgSend(v13, "numberWithDouble:");
      }
      else
      {
        objc_msgSend(v13, "numberWithLongLong:", _MDPlistNumberGetIntValue());
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v14);

    }
    goto LABEL_11;
  }

  v15 = 0;
LABEL_15:

  return v15;
}

- (id)getArrayFeatureField:(id *)a3 fieldName:(const char *)a4 dataType:(int)a5
{
  int Count;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  if (!_MDPlistDictionaryGetPlistObjectForKey())
    return 0;
  Count = _MDPlistArrayGetCount();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
  if (Count < 1)
  {
LABEL_9:
    v12 = v7;
    goto LABEL_12;
  }
  v8 = 0;
  while (1)
  {
    _MDPlistArrayGetPlistObjectAtIndex();
    if (a5 == 1)
    {
      v10 = (void *)MEMORY[0x1E0CB37E8];
      _MDPlistNumberGetDoubleValue();
      objc_msgSend(v10, "numberWithDouble:", 0, 0, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (a5)
      break;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", _MDPlistNumberGetIntValue(), 0, 0, 0);
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v11 = (void *)v9;
    objc_msgSend(v7, "addObject:", v9);

    if (Count == ++v8)
      goto LABEL_9;
  }
  v12 = 0;
LABEL_12:

  return v12;
}

- (id)getArrayDictionaryFeatureField:(id *)a3 fieldName:(const char *)a4
{
  int Count;
  void *v5;
  int i;
  id v7;
  void *v9;

  if (_MDPlistDictionaryGetPlistObjectForKey())
  {
    Count = _MDPlistArrayGetCount();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", Count);
    if (Count >= 1)
    {
      for (i = 0; i != Count; ++i)
      {
        _MDPlistArrayGetPlistObjectAtIndex();
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", _MDPlistDictionaryGetCount());
        v7 = v9;
        _MDPlistDictionaryIterate();
        objc_msgSend(v5, "addObject:", v7);

      }
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

void __59__L3ModelManager_getArrayDictionaryFeatureField_fieldName___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (_MDPlistGetPlistObjectType() == 244 || _MDPlistGetPlistObjectType() == 245)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", _MDPlistStringGetValue());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    v6 = (void *)MEMORY[0x1E0CB3940];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    _MDPlistNumberGetDoubleValue();
    objc_msgSend(v7, "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    v6 = (void *)MEMORY[0x1E0CB3940];
  }
  objc_msgSend(v6, "stringWithUTF8String:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, v8);

}

- (int64_t)getBundleId:(id)a3 defaultValue:(int64_t)a4 hashing:(BOOL)a5 hashBucketStart:(int)a6 embeddingTableSize:(int)a7
{
  SSPlistDataReader *bundleDict;
  _BOOL4 v10;
  int64_t v11;

  if (a3)
  {
    bundleDict = self->_bundleDict;
    if (bundleDict)
    {
      v10 = a5;
      v11 = -[SSPlistDataReader intValueForBundle:defaultValue:](bundleDict, "intValueForBundle:defaultValue:");
      a4 = v11;
      if (v10 && v11 >= a6)
        return (v11 - a6) % (a7 - a6) + a6;
    }
  }
  return a4;
}

- (int64_t)getLocaleId:(id)a3 defaultValue:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  SSPlistDataReader *localeDict;

  v6 = a3;
  v7 = v6;
  if (v6 && self->_localeDict)
  {
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    localeDict = self->_localeDict;
    v7 = objc_retainAutorelease(v8);
    a4 = -[SSPlistDataReader intValueForKey:defaultValue:](localeDict, "intValueForKey:defaultValue:", objc_msgSend(v7, "UTF8String"), a4);
  }

  return a4;
}

- (float)minMaxNormalize:(float)a3 min:(float)a4 max:(float)a5
{
  return (float)(a3 - a4) / (float)(a5 - a4);
}

- (float)sigmoid:(float)a3
{
  return 1.0 / (exp((float)-a3) + 1.0);
}

- (void)extractFeatures:(id)a3 idFeatures:(id)a4 denseFeatures:(id)a5 index:(int64_t)a6 unitTest:(BOOL)a7
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _QWORD *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  char v38;
  float v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _BOOL8 v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  float v50;
  double v51;
  void *v52;
  int v53;
  int v54;
  int v55;
  int v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  int v61;
  double v62;
  NSObject *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  uint64_t v69;
  _BOOL4 v70;
  NSMutableArray *obj;
  id v72;
  id v73;
  NSMutableArray *v74;
  id v75;
  L3ModelManager *v76;
  id v77;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  _QWORD v87[2];
  char v88[16];
  char v89[16];
  _BYTE v90[128];
  char v91[16];
  _QWORD v92[2];
  _QWORD v93[2];
  _BYTE v94[128];
  uint64_t v95;

  v70 = a7;
  v95 = *MEMORY[0x1E0C80C00];
  v77 = a3;
  v72 = a4;
  v75 = a5;
  v76 = self;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v86 = 0u;
  obj = self->_idFeatureConfigs;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v73 = *(id *)v84;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(id *)v84 != v73)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * i);
        objc_msgSend(v14, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("locale"));

        if (v16)
        {
          v17 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v14, "name");
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "numberWithLong:", -[L3ModelManager getLocaleId:defaultValue:](self, "getLocaleId:defaultValue:", v19, 1));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v93[0] = v21;
          v22 = (v12 + 1);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v93[1] = v23;
          v24 = (void *)MEMORY[0x1E0C99D20];
          v25 = v93;
LABEL_10:
          objc_msgSend(v24, "arrayWithObjects:count:", v25, 2);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "setObject:forKeyedSubscript:", v20, v29);

          v12 = v22;
          goto LABEL_13;
        }
        objc_msgSend(v14, "name");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "isEqualToString:", CFSTR("section_bundle_id"));

        if (v27)
        {
          v28 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v14, "name");
          v18 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "numberWithLong:", -[L3ModelManager getBundleId:defaultValue:hashing:hashBucketStart:embeddingTableSize:](self, "getBundleId:defaultValue:hashing:hashBucketStart:embeddingTableSize:", v19, 1006, objc_msgSend(v14, "hashing"), objc_msgSend(v14, "hashBucketStart"), objc_msgSend(v14, "embeddingTableSize")));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a6);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v92[0] = v21;
          v22 = (v12 + 1);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v92[1] = v23;
          v24 = (void *)MEMORY[0x1E0C99D20];
          v25 = v92;
          goto LABEL_10;
        }
        SSGeneralLog();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          -[L3ModelManager extractFeatures:idFeatures:denseFeatures:index:unitTest:].cold.3((uint64_t)v91, (uint64_t)v14);
LABEL_13:

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v83, v94, 16);
    }
    while (v11);
  }

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v74 = self->_denseFeatureConfigs;
  v30 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
  if (!v30)
    goto LABEL_48;
  v31 = v30;
  v32 = 0;
  v33 = !v70;
  v34 = *(_QWORD *)v80;
  do
  {
    v35 = 0;
    do
    {
      if (*(_QWORD *)v80 != v34)
        objc_enumerationMutation(v74);
      v36 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v35);
      objc_msgSend(v36, "name");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("position_section")) & v33;

      v39 = 3.0;
      if ((v38 & 1) == 0)
      {
        v40 = v32;
        v41 = v31;
        v42 = v34;
        v43 = v33;
        objc_msgSend(v36, "name");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "transform"))
        {
          objc_msgSend(v36, "originalFeatureName");
          v45 = objc_claimAutoreleasedReturnValue();

          v44 = (void *)v45;
        }
        if (v70)
        {
          objc_msgSend(v44, "lowercaseString");
          v46 = objc_claimAutoreleasedReturnValue();

          v44 = (void *)v46;
        }
        objc_msgSend(v77, "objectForKeyedSubscript:", v44);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
        {
          if (objc_msgSend(v36, "transform"))
          {
            objc_msgSend(v36, "transformType");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = objc_msgSend(v48, "isEqualToString:", CFSTR("string_length"));

            if (v49)
            {
              v39 = (float)(unint64_t)objc_msgSend(v47, "length");
            }
            else
            {
              SSGeneralLog();
              v68 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
                -[L3ModelManager extractFeatures:idFeatures:denseFeatures:index:unitTest:].cold.2((uint64_t)v89, (uint64_t)v36);

              v39 = 0.0;
            }
            goto LABEL_32;
          }
          objc_msgSend(v47, "floatValue");
        }
        else
        {
          objc_msgSend(v36, "defaultValue");
        }
        v39 = v50;
LABEL_32:

        v33 = v43;
        v34 = v42;
        v31 = v41;
        v32 = v40;
      }
      if (!objc_msgSend(v36, "normalization"))
        goto LABEL_42;
      objc_msgSend(v36, "normalizationType");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v52, "isEqualToString:", CFSTR("minmax"));

      if (v53)
      {
        objc_msgSend(v36, "normalizationMin");
        v55 = v54;
        objc_msgSend(v36, "normalizationMax");
        LODWORD(v57) = v56;
        *(float *)&v58 = v39;
        LODWORD(v59) = v55;
        -[L3ModelManager minMaxNormalize:min:max:](v76, "minMaxNormalize:min:max:", v58, v59, v57);
LABEL_38:
        v39 = *(float *)&v51;
        goto LABEL_42;
      }
      objc_msgSend(v36, "normalizationType");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = objc_msgSend(v60, "isEqualToString:", CFSTR("sigmoid"));

      if (v61)
      {
        *(float *)&v62 = v39;
        -[L3ModelManager sigmoid:](v76, "sigmoid:", v62);
        goto LABEL_38;
      }
      SSGeneralLog();
      v63 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
        -[L3ModelManager extractFeatures:idFeatures:denseFeatures:index:unitTest:].cold.1((uint64_t)v88, (uint64_t)v36);

LABEL_42:
      *(float *)&v51 = v39;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", a6);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v87[0] = v65;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32 + v35);
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      v87[1] = v66;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "setObject:forKeyedSubscript:", v64, v67);

      ++v35;
    }
    while (v31 != v35);
    v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v74, "countByEnumeratingWithState:objects:count:", &v79, v90, 16);
    v31 = v69;
    v32 = (v32 + v35);
  }
  while (v69);
LABEL_48:

}

- (id)predict:(id)a3
{
  return -[L3ModelManager predict:unitTest:](self, "predict:unitTest:", a3, 0);
}

- (id)predict:(id)a3 unitTest:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v4 = a4;
  v29[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (self->_model)
  {
    v8 = objc_msgSend(v6, "count");
    v9 = objc_alloc(MEMORY[0x1E0C9E970]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_idFeatureConfigs, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v13 = (void *)objc_msgSend(v9, "initWithShape:dataType:error:", v12, 131104, &v27);
    v14 = v27;

    v23 = objc_alloc(MEMORY[0x1E0C9E970]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v15;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSMutableArray count](self->_denseFeatureConfigs, "count"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v14;
    v18 = (void *)objc_msgSend(v23, "initWithShape:dataType:error:", v17, 65568, &v26);
    v24 = v26;

    if (v8 >= 1)
    {
      for (i = 0; i != v8; ++i)
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", i, v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[L3ModelManager extractFeatures:idFeatures:denseFeatures:index:unitTest:](self, "extractFeatures:idFeatures:denseFeatures:index:unitTest:", v20, v13, v18, i, v4);

      }
    }
    -[L3ModelManager predictProcessedFeatures:denseFeatures:](self, "predictProcessedFeatures:denseFeatures:", v13, v18, v24);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)predictProcessedFeatures:(id)a3 denseFeatures:(id)a4
{
  id v6;
  id v7;
  spotlight_l3_1Input *v8;
  spotlight_l3_1 *model;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v25;

  v6 = a3;
  v7 = a4;
  v8 = -[spotlight_l3_1Input initWithId_features:dense_features:]([spotlight_l3_1Input alloc], "initWithId_features:dense_features:", v6, v7);
  model = self->_model;
  v25 = 0;
  -[spotlight_l3_1 predictionFromFeatures:error:](model, "predictionFromFeatures:error:", v8, &v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = 0;
  if (!v25 && v10)
  {
    objc_msgSend(v10, "y");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 < 1)
    {
      v12 = 0;
    }
    else
    {
      v15 = (void *)MEMORY[0x1E0C99DE8];
      objc_msgSend(v11, "y");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "arrayWithCapacity:", objc_msgSend(v16, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "y");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18 >= 1)
      {
        v19 = 0;
        do
        {
          objc_msgSend(v11, "y");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v21);

          ++v19;
          objc_msgSend(v11, "y");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "count");

        }
        while (v23 > v19);
      }
    }
  }

  return v12;
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (spotlight_l3_1)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (SSPlistDataReader)bundleDict
{
  return self->_bundleDict;
}

- (void)setBundleDict:(id)a3
{
  objc_storeStrong((id *)&self->_bundleDict, a3);
}

- (SSPlistDataReader)localeDict
{
  return self->_localeDict;
}

- (void)setLocaleDict:(id)a3
{
  objc_storeStrong((id *)&self->_localeDict, a3);
}

- (NSMutableArray)idFeatureConfigs
{
  return self->_idFeatureConfigs;
}

- (void)setIdFeatureConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_idFeatureConfigs, a3);
}

- (NSMutableArray)denseFeatureConfigs
{
  return self->_denseFeatureConfigs;
}

- (void)setDenseFeatureConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_denseFeatureConfigs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denseFeatureConfigs, 0);
  objc_storeStrong((id *)&self->_idFeatureConfigs, 0);
  objc_storeStrong((id *)&self->_localeDict, 0);
  objc_storeStrong((id *)&self->_bundleDict, 0);
  objc_storeStrong((id *)&self->_model, 0);
}

- (void)loadModel
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B86C5000, v0, v1, "[SpotlightRanking] L3 - failed to load l3 model dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loadModelConfig
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1B86C5000, v0, v1, "[SpotlightRanking] L3 error: Can not read model config features->sub_name", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getStringFeatureField:(uint64_t)a1 valueObj:(NSObject *)a2 fieldName:log:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315138;
  v3 = a1;
  _os_log_error_impl(&dword_1B86C5000, a2, OS_LOG_TYPE_ERROR, "[SpotlightRanking] L3 error: Can not read model config features->%s", (uint8_t *)&v2, 0xCu);
}

- (void)extractFeatures:(uint64_t)a1 idFeatures:(uint64_t)a2 denseFeatures:index:unitTest:.cold.1(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1, a2), "normalizationType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_1_2(&dword_1B86C5000, v5, v6, "[SpotlightRanking] L3 error: normalization type %@ is not supported");

  OUTLINED_FUNCTION_1_0();
}

- (void)extractFeatures:(uint64_t)a1 idFeatures:(uint64_t)a2 denseFeatures:index:unitTest:.cold.2(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1, a2), "transformType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_1_2(&dword_1B86C5000, v5, v6, "[SpotlightRanking] L3 error: transform type %@ is not supported");

  OUTLINED_FUNCTION_1_0();
}

- (void)extractFeatures:(uint64_t)a1 idFeatures:(uint64_t)a2 denseFeatures:index:unitTest:.cold.3(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend((id)OUTLINED_FUNCTION_2_1(a1, a2), "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *v3 = 138412290;
  *v2 = v4;
  OUTLINED_FUNCTION_1_2(&dword_1B86C5000, v5, v6, "[SpotlightRanking] L3 error: id feature %@ is not supported");

  OUTLINED_FUNCTION_1_0();
}

@end
