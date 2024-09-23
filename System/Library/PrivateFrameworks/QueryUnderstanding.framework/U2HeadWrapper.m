@implementation U2HeadWrapper

- (NSDictionary)metadata
{
  void *v2;
  void *v3;
  void *v4;

  -[U2Head model](self->_u2Head, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "metadata");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

void __43__U2HeadWrapper_loadWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t v21;
  int v22;
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = v6;
    objc_msgSend((id)objc_opt_class(), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v22 = 138412290;
      v23 = v7;
      _os_log_impl(&dword_244EAA000, v8, OS_LOG_TYPE_ERROR, "[QPNLU] Failed to load U2 Model Error: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  else
  {
    objc_msgSend(v5, "model");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modelDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "metadata");
    v8 = objc_claimAutoreleasedReturnValue();

    -[NSObject objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF50]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("."));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("5"));

    if ((v14 & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v22 = 138412290;
        v23 = v8;
        _os_log_impl(&dword_244EAA000, v15, OS_LOG_TYPE_DEFAULT, "[QPNLU] U2 Model Loaded with metadata: %@", (uint8_t *)&v22, 0xCu);
      }

      v16 = *(_QWORD *)(a1 + 32);
      v17 = v5;
      v7 = 0;
      v18 = *(NSObject **)(v16 + 16);
      *(_QWORD *)(v16 + 16) = v17;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.QueryParser.QUModelError"), -9001, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
      {
        v22 = 138412290;
        v23 = v8;
        _os_log_impl(&dword_244EAA000, v18, OS_LOG_TYPE_FAULT, "[QPNLU] Failed to load U2 Model incompatible version. %@", (uint8_t *)&v22, 0xCu);
      }
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = os_signpost_id_make_with_pointer(v20, *(const void **)(a1 + 32));

  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_244EAA000, v19, OS_SIGNPOST_INTERVAL_END, v21, "U2Head initialization", ", (uint8_t *)&v22, 2u);
  }

}

+ (id)signpostLog
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __28__U2HeadWrapper_signpostLog__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[U2HeadWrapper signpostLog]::onceToken != -1)
    dispatch_once(&+[U2HeadWrapper signpostLog]::onceToken, block);
  return (id)+[U2HeadWrapper signpostLog]::log;
}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __20__U2HeadWrapper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[U2HeadWrapper log]::onceToken != -1)
    dispatch_once(&+[U2HeadWrapper log]::onceToken, block);
  return (id)+[U2HeadWrapper log]::log;
}

- (void)loadWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_make_with_pointer(v6, self);

  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_244EAA000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v7, "U2Head initialization", ", buf, 2u);
  }

  v8 = objc_alloc_init(MEMORY[0x24BDBFFD8]);
  objc_msgSend(v8, "setComputeUnits:", 0);
  objc_msgSend(v8, "setExperimentalMLE5EngineUsage:", 0);
  -[U2HeadWrapper assetURL](self, "assetURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "log");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v9, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v11;
    _os_log_impl(&dword_244EAA000, v10, OS_LOG_TYPE_DEFAULT, "[QPNLU] Loading U2Head from %@", buf, 0xCu);

  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __43__U2HeadWrapper_loadWithCompletionHandler___block_invoke;
  v13[3] = &unk_2515EC310;
  v13[4] = self;
  v12 = v4;
  v14 = v12;
  +[U2Head loadContentsOfURL:configuration:completionHandler:](U2Head, "loadContentsOfURL:configuration:completionHandler:", v9, v8, v13);

}

- (U2HeadWrapper)initWithLocale:(id)a3
{
  id v5;
  U2HeadWrapper *v6;
  U2HeadWrapper *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)U2HeadWrapper;
  v6 = -[U2HeadWrapper init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_locale, a3);

  return v7;
}

- (id)assetURL
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (gUseSpotlightResources)
  {
    objc_msgSend(MEMORY[0x24BEB01E0], "sharedResourcesManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "loadAllParametersForClient:locale:", CFSTR("Parser"), self->_locale);
    objc_msgSend(v3, "resourcesForClient:locale:options:", CFSTR("Parser"), self->_locale, &unk_2515EDE38);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    objc_msgSend(v4, "filePathArrayForKey:didFailWithError:", CFSTR("QueryUnderstanding"), &v16);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v16;
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v6;
        _os_log_impl(&dword_244EAA000, v7, OS_LOG_TYPE_ERROR, "[QPNLU] Failed to find U2 Model in resource Error: %@", buf, 0xCu);
      }

    }
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v10 = (void *)gU2HeadBundle;
    -[NSLocale localeIdentifier](self->_locale, "localeIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLForResource:withExtension:subdirectory:localization:", CFSTR("U2Head"), CFSTR("mlmodelc"), 0, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      v12 = (void *)gU2HeadBundle;
      -[NSLocale languageCode](self->_locale, "languageCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLForResource:withExtension:subdirectory:localization:", CFSTR("U2Head"), CFSTR("mlmodelc"), 0, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      return v14;
    }
  }
  return v9;
}

void __20__U2HeadWrapper_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.queryunderstanding", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)+[U2HeadWrapper log]::log;
  +[U2HeadWrapper log]::log = (uint64_t)v1;

}

void __28__U2HeadWrapper_signpostLog__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.spotlight.QueryParser", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)+[U2HeadWrapper signpostLog]::log;
  +[U2HeadWrapper signpostLog]::log = (uint64_t)v1;

}

+ (BOOL)useSpotlightResources
{
  return gUseSpotlightResources;
}

+ (void)setUseSpotlightResources:(BOOL)a3
{
  gUseSpotlightResources = a3;
}

+ (NSBundle)U2HeadBundle
{
  return (NSBundle *)(id)gU2HeadBundle;
}

+ (void)setU2HeadBundle:(id)a3
{
  objc_storeStrong((id *)&gU2HeadBundle, a3);
}

- (id)argmaxWithIndex:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  float v6;
  void *v7;
  float v8;
  float v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = 0;
  v5 = 0;
  v6 = 0.0;
  while (objc_msgSend(v3, "count") > v4)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "floatValue");
    v9 = v8;

    if (v9 <= v6)
    {
      v5 = v5;
    }
    else
    {
      v6 = v9;
      v5 = v4;
    }
    ++v4;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  *(float *)&v11 = v6;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (vector<float,)getTokenScoresfromScoreTensor:(U2HeadWrapper *)self intentIndex:(SEL)a3 tokens:(id)a4 subtokenLenForTokens:(int)a5 subtokens:(id)a6 scoreFromSubtokenScores:(id)a7
{
  uint64_t v13;
  id v14;
  id v15;
  float (**v16)(id, void *, uint64_t, uint64_t, uint64_t, uint64_t, void **);
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t i;
  float v37;
  uint64_t v38;
  float *v39;
  float *var0;
  uint64_t v41;
  float *v42;
  vector<float, std::allocator<float>> *result;
  uint64_t v44;
  int v45;
  id v46;
  unint64_t v47;
  int v48;
  int v49;
  void *v50;
  id v51;
  void *v52;
  void *__p;
  void *v55;
  uint64_t v56;
  void *v57[3];
  void *v58;
  _BYTE *v59;

  v13 = *(_QWORD *)&a5;
  v14 = a4;
  v15 = a6;
  v46 = a7;
  v51 = a8;
  v16 = (float (**)(id, void *, uint64_t, uint64_t, uint64_t, uint64_t, void **))a9;
  v50 = v15;
  v52 = v14;
  v17 = objc_msgSend(v15, "count");
  objc_msgSend(v14, "shape");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectAtIndexedSubscript:", 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = objc_msgSend(v19, "intValue");

  v44 = (int)v14;
  v45 = (int)v14;
  std::vector<float>::vector(retstr, v17 * (int)v14);
  LODWORD(v57[0]) = 1065353216;
  std::vector<float>::vector(&v58, objc_msgSend(v51, "count"), v57);
  v47 = v17;
  if (v17)
  {
    v20 = 0;
    v49 = 0;
    do
    {
      objc_msgSend(v46, "objectAtIndexedSubscript:", v20, v44);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "intValue");

      v48 = v22;
      if (v22 >= 2)
      {
        v23 = 0;
        v24 = v49;
        v25 = -(uint64_t)v22;
        do
        {
          objc_msgSend(v51, "objectAtIndexedSubscript:", v24);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "length");
          objc_msgSend(v50, "objectAtIndexedSubscript:", v20);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "length");
          *((float *)v58 + v24) = (float)((__PAIR128__(v27, v23) - 1) >> 64) / (float)v29;

          --v23;
          ++v24;
        }
        while (v25 != v23);
      }
      v49 += v48;
      ++v20;
    }
    while (v20 != v47);
  }
  std::vector<float>::vector(v57, v47);
  if (v47)
  {
    v30 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 4 * v44;
    do
    {
      objc_msgSend(v46, "objectAtIndexedSubscript:", v31, v44);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "intValue");

      if (v45 >= 1)
      {
        for (i = 0; i != v45; *(float *)((char *)&retstr->var0[i++] + v30) = v37)
        {
          __p = 0;
          v55 = 0;
          v56 = 0;
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v58, (uint64_t)v59, (v59 - (_BYTE *)v58) >> 2);
          v37 = v16[2](v16, v52, v13, i, v32, v35, &__p);
          if (__p)
          {
            v55 = __p;
            operator delete(__p);
          }
          *((float *)v57[0] + v31) = v37 + *((float *)v57[0] + v31);
        }
      }
      v32 = (v35 + v32);
      ++v31;
      v30 += v33;
    }
    while (v31 != v47);
    v38 = 0;
    v39 = (float *)v57[0];
    var0 = retstr->var0;
    do
    {
      v41 = v45;
      v42 = var0;
      if (v45 >= 1)
      {
        do
        {
          *v42 = *v42 / v39[v38];
          ++v42;
          --v41;
        }
        while (v41);
      }
      ++v38;
      var0 = (float *)((char *)var0 + v33);
    }
    while (v38 != v47);
  }
  if (v57[0])
  {
    v57[1] = v57[0];
    operator delete(v57[0]);
  }
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }

  return result;
}

- (id)mapLogitsToLabels:(id)a3 queryString:(id)a4 tokens:(id)a5 subtokenLenForTokens:(id)a6 subtokens:(id)a7
{
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  float v22;
  id v23;
  id v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  U2Output *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  int v49;
  void *v50;
  void *v51;
  id v52;
  unint64_t v53;
  _QWORD v54[4];
  id v55;
  id v56;
  _BYTE *v57;
  float v58;
  int v59;
  float *v60;
  float *v61;
  _BYTE buf[24];
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v39 = a4;
  v52 = a5;
  v45 = a6;
  v46 = a7;
  v38 = v12;
  objc_msgSend(v12, "top_arg_ids");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "intent_scores");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "arg_conf_scores");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safety_head_scores");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "log");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v47;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v41;
    *(_WORD *)&buf[22] = 2112;
    v63 = v48;
    _os_log_impl(&dword_244EAA000, v13, OS_LOG_TYPE_DEBUG, "[QPNLU] got U2output-> intentScores: %@; topArgIds: %@; argConfidenceScores: %@",
      buf,
      0x20u);
  }

  -[U2HeadWrapper argmaxWithIndex:](self, "argmaxWithIndex:", v47);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectAtIndexedSubscript:", 0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectAtIndexedSubscript:", 1);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[U2HeadWrapper getTokenScoresfromScoreTensor:intentIndex:tokens:subtokenLenForTokens:subtokens:scoreFromSubtokenScores:](self, "getTokenScoresfromScoreTensor:intentIndex:tokens:subtokenLenForTokens:subtokens:scoreFromSubtokenScores:", v48, objc_msgSend(v43, "intValue"), v52, v45, v46, &__block_literal_global_138);
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v52, "count"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v52, "count"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "shape");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v15, "intValue");

  v16 = 0;
  v17 = 0;
  while (objc_msgSend(v52, "count") > v17)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v17;
    if (v49 < 1)
    {
      v21 = 0;
    }
    else
    {
      v20 = 0;
      v21 = 0;
      do
      {
        v22 = v60[v16 + v20];
        if (v22 >= 0.02)
        {
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x2020000000;
          LOBYTE(v63) = 0;
          v54[0] = MEMORY[0x24BDAC760];
          v54[1] = 3221225472;
          v54[2] = __85__U2HeadWrapper_mapLogitsToLabels_queryString_tokens_subtokenLenForTokens_subtokens___block_invoke;
          v54[3] = &unk_2515EC378;
          v58 = v22;
          v23 = v19;
          v55 = v23;
          v24 = v18;
          v59 = v20;
          v56 = v24;
          v57 = buf;
          objc_msgSend(v23, "enumerateObjectsUsingBlock:", v54);
          if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
          {
            *(float *)&v25 = v22;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addObject:", v26);

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v20);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "addObject:", v27);

          }
          _Block_object_dispose(buf, 8);
        }
        else if (v22 > v60[v53 * v49 + (int)v21])
        {
          v21 = v20;
        }
        ++v20;
      }
      while (v49 != v20);
    }
    if (!objc_msgSend(v19, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v21);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "addObject:", v28);

      *(float *)&v29 = v60[v53 * v49 + (int)v21];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObject:", v30);

    }
    v31 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v51, "addObject:", v31);

    v32 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v50, "addObject:", v32);

    v17 = v53 + 1;
    v16 += v49;
  }
  v33 = objc_alloc_init(U2Output);
  -[U2Output setIntentId:](v33, "setIntentId:", v43);
  -[U2Output setConfidenceScore:](v33, "setConfidenceScore:", v44);
  -[U2Output setTokens:](v33, "setTokens:", v52);
  objc_msgSend(v42, "objectAtIndexedSubscript:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[U2Output setSafetyScore:](v33, "setSafetyScore:", v34);

  v35 = (void *)objc_msgSend(v51, "copy");
  -[U2Output setArgIdsForTokens:](v33, "setArgIdsForTokens:", v35);

  v36 = (void *)objc_msgSend(v50, "copy");
  -[U2Output setArgScoresForTokens:](v33, "setArgScoresForTokens:", v36);

  if (v60)
  {
    v61 = v60;
    operator delete(v60);
  }

  return v33;
}

void __85__U2HeadWrapper_mapLogitsToLabels_queryString_tokens_subtokenLenForTokens_subtokens___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  float v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a2;
  v8 = *(float *)(a1 + 56);
  v14 = v7;
  objc_msgSend(v7, "floatValue");
  if (v8 > *(float *)&v9)
  {
    v10 = *(void **)(a1 + 32);
    LODWORD(v9) = *(_DWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "insertObject:atIndex:", v11, a3);

    v12 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(a1 + 60));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "insertObject:atIndex:", v13, a3);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (id)getU2PredictionsForEmbedding:(id)a3 queryString:(id)a4 spans:(id)a5 tokens:(id)a6 tokenRanges:(id)a7 subtokenLenForTokens:(id)a8 subtokens:(id)a9 error:(id *)a10
{
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t j;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  U2HeadInput *v36;
  U2Head *u2Head;
  void *v38;
  id v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  os_signpost_id_t v43;
  NSObject *v44;
  void *v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  U2HeadWrapper *ptr;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint8_t *v71;
  uint8_t buf[8];
  uint8_t *v73;
  uint64_t v74;
  int v75;
  uint8_t v76[4];
  id v77;
  _QWORD v78[3];
  _QWORD v79[5];

  v79[3] = *MEMORY[0x24BDAC8D0];
  v54 = a3;
  v53 = a4;
  v51 = a5;
  v55 = a6;
  v52 = a7;
  v56 = a8;
  v58 = a9;
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "signpostLog");
  v17 = objc_claimAutoreleasedReturnValue();
  ptr = self;
  v18 = os_signpost_id_make_with_pointer(v17, self);

  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_244EAA000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v18, "U2Head prediction", ", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v58, "count"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v58, "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v73 = buf;
  v74 = 0x2020000000;
  v75 = 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v55, "count"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = MEMORY[0x24BDAC760];
  v65[1] = 3221225472;
  v65[2] = __120__U2HeadWrapper_getU2PredictionsForEmbedding_queryString_spans_tokens_tokenRanges_subtokenLenForTokens_subtokens_error___block_invoke;
  v65[3] = &unk_2515EC3A0;
  v49 = v20;
  v66 = v49;
  v71 = buf;
  v48 = v52;
  v67 = v48;
  v47 = v51;
  v68 = v47;
  v60 = v46;
  v69 = v60;
  v59 = v19;
  v70 = v59;
  objc_msgSend(v56, "enumerateObjectsUsingBlock:", v65);
  v64 = 0;
  v61 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithShape:dataType:error:", &unk_2515EDE08, 131104, &v64);
  v21 = v64;
  for (i = 0; i != 28; ++i)
  {
    if (i >= *((int *)v73 + 6) + 2)
      v23 = &unk_2515EDE60;
    else
      v23 = &unk_2515EDE78;
    objc_msgSend(v61, "setObject:atIndexedSubscript:", v23, i);
  }
  v63 = v21;
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFFF0]), "initWithShape:dataType:error:", &unk_2515EDE20, 131104, &v63);
  v50 = v63;

  for (j = 0; j != 28; ++j)
  {
    if (j)
    {
      if (j - 1 >= (unint64_t)objc_msgSend(v60, "count"))
      {
        v27 = 0;
      }
      else
      {
        objc_msgSend(v60, "objectAtIndexedSubscript:", j - 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "BOOLValue");

      }
      if (j - 1 >= (unint64_t)objc_msgSend(v59, "count"))
      {
        v28 = 0;
      }
      else
      {
        objc_msgSend(v59, "objectAtIndexedSubscript:", j - 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v29, "BOOLValue");

      }
    }
    else
    {
      v28 = 0;
      v27 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v27);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v79[0] = &unk_2515EDE60;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", j);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v79[1] = v31;
    v79[2] = &unk_2515EDE60;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v79, 3);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v30, v32);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = &unk_2515EDE60;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", j);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v78[1] = v34;
    v78[2] = &unk_2515EDE78;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v78, 3);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v33, v35);

  }
  v36 = -[U2HeadInput initWithInput_mask:input_span_features:sequence_output:]([U2HeadInput alloc], "initWithInput_mask:input_span_features:sequence_output:", v61, v24, v54);
  u2Head = ptr->_u2Head;
  v62 = v50;
  -[U2Head predictionFromFeatures:error:](u2Head, "predictionFromFeatures:error:", v36, &v62);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v62;

  if (v38)
  {
    -[U2HeadWrapper mapLogitsToLabels:queryString:tokens:subtokenLenForTokens:subtokens:](ptr, "mapLogitsToLabels:queryString:tokens:subtokenLenForTokens:subtokens:", v38, v53, v55, v56, v58);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v41 = objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "signpostLog");
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = os_signpost_id_make_with_pointer(v42, ptr);

    if (v43 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)v76 = 0;
      _os_signpost_emit_with_name_impl(&dword_244EAA000, v41, OS_SIGNPOST_INTERVAL_END, v43, "U2Head prediction", ", v76, 2u);
    }

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v76 = 138412290;
      v77 = v39;
      _os_log_impl(&dword_244EAA000, v44, OS_LOG_TYPE_ERROR, "[QPNLU] U2Head prediction error: %@", v76, 0xCu);
    }

    v40 = 0;
    if (a10)
      *a10 = objc_retainAutorelease(v39);
  }

  _Block_object_dispose(buf, 8);
  return v40;
}

void __120__U2HeadWrapper_getU2PredictionsForEmbedding_queryString_spans_tokens_tokenRanges_subtokenLenForTokens_subtokens_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  unint64_t v16;
  uint64_t v17;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t j;
  unint64_t v24;
  uint64_t v25;
  uint64_t v27;
  int k;
  void *v29;
  void *v30;
  int m;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += objc_msgSend(v5, "intValue");
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rangeValue");
  v11 = v10;

  if (v11)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "peopleNameRanges");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v39;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v39 != v14)
            objc_enumerationMutation(v12);
          v16 = objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * i), "rangeValue");
          if (v16 <= v9 && v16 + v17 >= v9 + v11)
          {
            v13 = 1;
            goto LABEL_15;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        if (v13)
          continue;
        break;
      }
    }
LABEL_15:

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    objc_msgSend(*(id *)(a1 + 48), "locationNameRanges", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v35;
      v22 = v9 + v11;
      while (2)
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v35 != v21)
            objc_enumerationMutation(v19);
          v24 = objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * j), "rangeValue");
          if (v24 <= v9 && v24 + v25 >= v22)
          {
            v27 = 1;
            goto LABEL_28;
          }
        }
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v20)
          continue;
        break;
      }
    }
    v27 = 0;
LABEL_28:

  }
  else
  {
    v13 = 0;
    v27 = 0;
  }
  for (k = 0; k < (int)objc_msgSend(v5, "intValue"); ++k)
  {
    v29 = *(void **)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v30);

  }
  for (m = 0; m < (int)objc_msgSend(v5, "intValue"); ++m)
  {
    v32 = *(void **)(a1 + 64);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v27);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObject:", v33);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_u2Head, 0);
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
