@implementation SearchUIAudioAppPredictorCache

- (SearchUIAudioAppPredictorCache)init
{
  SearchUIAudioAppPredictorCache *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchUIAudioAppPredictorCache;
  v2 = -[TLKAsyncCache init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_clear, CFSTR("com.apple.LaunchServices.applicationRegistered"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_clear, CFSTR("com.apple.LaunchServices.applicationUnregistered"), 0);

  }
  return v2;
}

- (void)computeObjectForKey:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v8 = (void *)getSAAudioAppPredictorClass_softClass;
    v26 = getSAAudioAppPredictorClass_softClass;
    v9 = MEMORY[0x1E0C809B0];
    if (!getSAAudioAppPredictorClass_softClass)
    {
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __getSAAudioAppPredictorClass_block_invoke;
      v21 = &unk_1EA1F6930;
      v22 = &v23;
      __getSAAudioAppPredictorClass_block_invoke((uint64_t)&v18);
      v8 = (void *)v24[3];
    }
    v10 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v23, 8);
    v11 = (void *)objc_msgSend([v10 alloc], "initWithCaller:", 6);
    +[SearchUIMediaUtilities mediaSearchForMetadata:](SearchUIMediaUtilities, "mediaSearchForMetadata:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v13 = (void *)getSAAudioAppPredictorOptionsClass_softClass;
    v26 = getSAAudioAppPredictorOptionsClass_softClass;
    if (!getSAAudioAppPredictorOptionsClass_softClass)
    {
      v18 = v9;
      v19 = 3221225472;
      v20 = __getSAAudioAppPredictorOptionsClass_block_invoke;
      v21 = &unk_1EA1F6930;
      v22 = &v23;
      __getSAAudioAppPredictorOptionsClass_block_invoke((uint64_t)&v18);
      v13 = (void *)v24[3];
    }
    v14 = objc_retainAutorelease(v13);
    _Block_object_dispose(&v23, 8);
    v15 = (void *)objc_opt_new();
    objc_msgSend(v15, "setTrimDisambiguationForRelevance:", 1);
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __72__SearchUIAudioAppPredictorCache_computeObjectForKey_completionHandler___block_invoke;
    v16[3] = &unk_1EA1F7300;
    v17 = v7;
    objc_msgSend(v11, "predictWithSearch:options:completion:", v12, v15, v16);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

uint64_t __72__SearchUIAudioAppPredictorCache_computeObjectForKey_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
