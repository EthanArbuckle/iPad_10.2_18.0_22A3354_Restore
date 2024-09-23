@implementation WFSettingsClientBiomeReversalArbiter

- (WFSettingsClientBiomeReversalArbiter)initWithBiomeStream:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WFSettingsClientBiomeReversalArbiter *v8;

  v4 = a3;
  objc_msgSend(v4, "publisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "reversePublisherOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "publisherWithOptions:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[WFSettingsClientBiomeReversalArbiter initWithPublisher:reversePublisher:](self, "initWithPublisher:reversePublisher:", v5, v7);
  return v8;
}

- (WFSettingsClientBiomeReversalArbiter)initWithPublisher:(id)a3 reversePublisher:(id)a4
{
  id v7;
  id v8;
  WFSettingsClientBiomeReversalArbiter *v9;
  WFSettingsClientBiomeReversalArbiter *v10;
  WFSettingsClientBiomeReversalArbiter *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WFSettingsClientBiomeReversalArbiter;
  v9 = -[WFSettingsClientBiomeReversalArbiter init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_publisher, a3);
    objc_storeStrong((id *)&v10->_reversePublisher, a4);
    v11 = v10;
  }

  return v10;
}

- (void)getBookmarkForCurrentStateWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint8_t buf[4];
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__62249;
  v15 = __Block_byref_object_dispose__62250;
  v16 = 0;
  -[WFSettingsClientBiomeReversalArbiter publisher](self, "publisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__WFSettingsClientBiomeReversalArbiter_getBookmarkForCurrentStateWithCompletionHandler___block_invoke;
  v10[3] = &unk_1E7AF8FC8;
  v10[4] = &v11;
  v6 = (id)objc_msgSend(v5, "sinkWithBookmark:completion:receiveInput:", 0, v10, &__block_literal_global_5_62267);

  v7 = v12[5];
  if (v7)
  {
    v4[2](v4, v7, 0);
  }
  else
  {
    getWFBiomeReversalArbiterLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v18 = "-[WFSettingsClientBiomeReversalArbiter getBookmarkForCurrentStateWithCompletionHandler:]";
      _os_log_impl(&dword_1C15B3000, v8, OS_LOG_TYPE_ERROR, "%s The Biome stream is empty", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.shortcuts.biomereversalarbiter"), 100, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v9);

  }
  _Block_object_dispose(&v11, 8);

}

- (void)getReversalStateWithBookmark:(id)a3 completionHandler:(id)a4
{
  id v7;
  void (**v8)(id, _QWORD, void *);
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[7];
  _QWORD v25[3];
  char v26;
  _QWORD v27[5];
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[5];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint8_t v39[4];
  const char *v40;
  __int128 buf;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, _QWORD, void *))a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFSettingsClientBiomeReversalArbiter.m"), 58, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bookmark"));

  }
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__62249;
  v37 = __Block_byref_object_dispose__62250;
  v38 = 0;
  -[WFSettingsClientBiomeReversalArbiter publisher](self, "publisher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "last");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __87__WFSettingsClientBiomeReversalArbiter_getReversalStateWithBookmark_completionHandler___block_invoke_2;
  v32[3] = &unk_1E7AF9070;
  v32[4] = &v33;
  v12 = (id)objc_msgSend(v10, "sinkWithCompletion:receiveInput:", &__block_literal_global_14, v32);

  if (v34[5])
  {
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0;
    -[WFSettingsClientBiomeReversalArbiter publisher](self, "publisher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v11;
    v27[1] = 3221225472;
    v27[2] = __87__WFSettingsClientBiomeReversalArbiter_getReversalStateWithBookmark_completionHandler___block_invoke_2_17;
    v27[3] = &unk_1E7AF90D8;
    v27[4] = &v28;
    v14 = (id)objc_msgSend(v13, "drivableSinkWithBookmark:completion:shouldContinue:", v7, &__block_literal_global_16_62259, v27);

    if (*((_BYTE *)v29 + 24))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "userCancelledError");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v8[2](v8, 0, v15);

    }
    else
    {
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x2020000000;
      v26 = 0;
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v42 = 0x3032000000;
      v43 = __Block_byref_object_copy__62249;
      v44 = __Block_byref_object_dispose__62250;
      v45 = 0;
      -[WFSettingsClientBiomeReversalArbiter reversePublisher](self, "reversePublisher");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v11;
      v24[1] = 3221225472;
      v24[2] = __87__WFSettingsClientBiomeReversalArbiter_getReversalStateWithBookmark_completionHandler___block_invoke_4;
      v24[3] = &unk_1E7AF9120;
      v24[4] = v25;
      v24[5] = &buf;
      v24[6] = &v33;
      v19 = (id)objc_msgSend(v18, "drivableSinkWithBookmark:completion:shouldContinue:", 0, &__block_literal_global_19, v24);

      v20 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      if (v20)
      {
        objc_msgSend(v20, "eventBody");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        ((void (**)(id, void *, void *))v8)[2](v8, v21, 0);
      }
      else
      {
        getWFBiomeReversalArbiterLogObject();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v39 = 136315138;
          v40 = "-[WFSettingsClientBiomeReversalArbiter getReversalStateWithBookmark:completionHandler:]";
          _os_log_impl(&dword_1C15B3000, v22, OS_LOG_TYPE_ERROR, "%s The only record in the Biome stream is the one we bookmarked — there's nothing to restore to before that", v39, 0xCu);
        }

        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.shortcuts.biomereversalarbiter"), 100, 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v8[2](v8, 0, v21);
      }

      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(v25, 8);
    }
    _Block_object_dispose(&v28, 8);
  }
  else
  {
    getWFBiomeReversalArbiterLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = "-[WFSettingsClientBiomeReversalArbiter getReversalStateWithBookmark:completionHandler:]";
      _os_log_impl(&dword_1C15B3000, v16, OS_LOG_TYPE_ERROR, "%s The Biome stream is empty", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.shortcuts.biomereversalarbiter"), 100, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v8[2](v8, 0, v17);

  }
  _Block_object_dispose(&v33, 8);

}

- (BOOL)lastEventEquals:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__62249;
  v14 = __Block_byref_object_dispose__62250;
  v15 = 0;
  -[WFSettingsClientBiomeReversalArbiter publisher](self, "publisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "last");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__WFSettingsClientBiomeReversalArbiter_lastEventEquals___block_invoke_2;
  v9[3] = &unk_1E7AF9070;
  v9[4] = &v10;
  v7 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", &__block_literal_global_20, v9);

  LOBYTE(v5) = objc_msgSend((id)v11[5], "isEqual:", v4);
  _Block_object_dispose(&v10, 8);

  return (char)v5;
}

- (BPSPublisher)publisher
{
  return self->_publisher;
}

- (BPSPublisher)reversePublisher
{
  return self->_reversePublisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reversePublisher, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

void __56__WFSettingsClientBiomeReversalArbiter_lastEventEquals___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "eventBody");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __87__WFSettingsClientBiomeReversalArbiter_getReversalStateWithBookmark_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __87__WFSettingsClientBiomeReversalArbiter_getReversalStateWithBookmark_completionHandler___block_invoke_2_17(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

BOOL __87__WFSettingsClientBiomeReversalArbiter_getReversalStateWithBookmark_completionHandler___block_invoke_4(_QWORD *a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;

  v4 = a2;
  v5 = v4;
  v6 = *(_QWORD *)(a1[4] + 8);
  v7 = *(unsigned __int8 *)(v6 + 24);
  if (*(_BYTE *)(v6 + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
  }
  else if (objc_msgSend(v4, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40)))
  {
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 1;
  }

  return v7 == 0;
}

void __88__WFSettingsClientBiomeReversalArbiter_getBookmarkForCurrentStateWithCompletionHandler___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), obj);
}

+ (id)reversePublisherOptions
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, 0, 1);
}

@end
