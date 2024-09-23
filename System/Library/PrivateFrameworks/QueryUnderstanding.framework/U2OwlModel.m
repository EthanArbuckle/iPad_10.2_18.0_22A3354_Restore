@implementation U2OwlModel

void __40__U2OwlModel_loadWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  BOOL v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_244EAA000, v5, OS_LOG_TYPE_ERROR, "[QPNLU] Failed to load EmbeddingService error: %@", (uint8_t *)&v8, 0xCu);
    }

  }
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    v7 = WeakRetained == 0;
  else
    v7 = 1;
  if (!v7)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, WeakRetained, v3);

}

void __40__U2OwlModel_loadWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  _QWORD *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (v3)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v3;
      _os_log_impl(&dword_244EAA000, v6, OS_LOG_TYPE_DEBUG, "[QPNLU] Failed to load U2Head error: %@", buf, 0xCu);
    }

    v7 = *(_QWORD *)(a1 + 40);
    if (v7 && v5)
      (*(void (**)(uint64_t, _QWORD *, id))(v7 + 16))(v7, v5, v3);
  }
  else
  {
    objc_msgSend(*((id *)WeakRetained + 2), "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF38]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("nlx_embeddings_version"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BE2E770]), "initWithLocale:version:", v5[3], v10);
    v12 = (void *)v5[1];
    v5[1] = v11;

    v13 = (void *)v5[1];
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __40__U2OwlModel_loadWithCompletionHandler___block_invoke_4;
    v15[3] = &unk_2515EC3C8;
    objc_copyWeak(&v17, (id *)(a1 + 48));
    v14 = *(void **)(a1 + 40);
    v15[4] = *(_QWORD *)(a1 + 32);
    v16 = v14;
    objc_msgSend(v13, "loadWithCompletionHandler:", v15);

    objc_destroyWeak(&v17);
  }

}

- (void)loadWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  U2HeadWrapper *u2headWrapper;
  id v8;
  _QWORD v9[5];
  id v10;
  id v11;
  uint8_t v12[16];
  id buf[2];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_244EAA000, v5, OS_LOG_TYPE_DEBUG, "[QPNLU] Loading OWLBERT EmbeddingService", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  objc_msgSend((id)objc_opt_class(), "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_244EAA000, v6, OS_LOG_TYPE_DEBUG, "[QPNLU] Loading U2Head", v12, 2u);
  }

  u2headWrapper = self->_u2headWrapper;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__U2OwlModel_loadWithCompletionHandler___block_invoke;
  v9[3] = &unk_2515EC3C8;
  objc_copyWeak(&v11, buf);
  v9[4] = self;
  v8 = v4;
  v10 = v8;
  -[U2HeadWrapper loadWithCompletionHandler:](u2headWrapper, "loadWithCompletionHandler:", v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);

}

+ (id)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __17__U2OwlModel_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_0 != -1)
    dispatch_once(&log_onceToken_0, block);
  return (id)log_log_0;
}

- (U2OwlModel)initWithLocale:(id)a3
{
  id v5;
  U2OwlModel *v6;
  U2OwlModel *v7;
  U2HeadWrapper *v8;
  U2HeadWrapper *u2headWrapper;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)U2OwlModel;
  v6 = -[U2OwlModel init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_locale, a3);
    v8 = -[U2HeadWrapper initWithLocale:]([U2HeadWrapper alloc], "initWithLocale:", v5);
    u2headWrapper = v7->_u2headWrapper;
    v7->_u2headWrapper = v8;

  }
  return v7;
}

void __17__U2OwlModel_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.queryunderstanding", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_0;
  log_log_0 = (uint64_t)v1;

}

- (NSDictionary)modelMetadata
{
  void *v2;
  void *v3;

  -[U2HeadWrapper metadata](self->_u2headWrapper, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDBFF38]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)getUnderstandingForQueryString:(id)a3 spans:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  QUEmbeddingService *embeddingService;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = mach_absolute_time();
  embeddingService = self->_embeddingService;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __73__U2OwlModel_getUnderstandingForQueryString_spans_withCompletionHandler___block_invoke;
  v16[3] = &unk_2515EC3F0;
  v19 = v10;
  v20 = v11;
  v16[4] = self;
  v17 = v8;
  v18 = v9;
  v13 = v9;
  v14 = v8;
  v15 = v10;
  -[QUEmbeddingService getEmbeddingForQuery:completionHandler:](embeddingService, "getEmbeddingForQuery:completionHandler:", v14, v16);

}

void __73__U2OwlModel_getUnderstandingForQueryString_spans_withCompletionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;

  v5 = a2;
  v6 = a3;
  v7 = a1[8];
  v8 = mach_absolute_time();
  if (QPTimingNanosecondsSinceAbsoluteTime_onceToken == -1)
  {
    if (v6)
    {
LABEL_3:
      (*(void (**)(void))(a1[7] + 16))();
      goto LABEL_8;
    }
  }
  else
  {
    dispatch_once(&QPTimingNanosecondsSinceAbsoluteTime_onceToken, &__block_literal_global_0);
    if (v6)
      goto LABEL_3;
  }
  v21 = *(void **)(a1[4] + 16);
  v22 = (v8 - v7) * QPTimingNanosecondsSinceAbsoluteTime_sTimebaseInfo / *(unsigned int *)algn_2544001B4;
  objc_msgSend(v5, "embedding");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a1[5];
  v10 = a1[6];
  objc_msgSend(v5, "tokens");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenRanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtokenLenForTokens");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subtokens");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  objc_msgSend(v21, "getU2PredictionsForEmbedding:queryString:spans:tokens:tokenRanges:subtokenLenForTokens:subtokens:error:", v20, v9, v10, v11, v12, v13, v14, &v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v23;

  objc_msgSend(v5, "tokenRanges");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTokenRanges:", v17);

  objc_msgSend(v15, "setEmbeddingsTime:", v22);
  v18 = a1[8];
  v19 = mach_absolute_time();
  if (QPTimingNanosecondsSinceAbsoluteTime_onceToken != -1)
    dispatch_once(&QPTimingNanosecondsSinceAbsoluteTime_onceToken, &__block_literal_global_0);
  objc_msgSend(v15, "setPredictionTime:", (v19 - v18) * QPTimingNanosecondsSinceAbsoluteTime_sTimebaseInfo / *(unsigned int *)algn_2544001B4);
  (*(void (**)(void))(a1[7] + 16))();

LABEL_8:
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_u2headWrapper, 0);
  objc_storeStrong((id *)&self->_embeddingService, 0);
}

@end
