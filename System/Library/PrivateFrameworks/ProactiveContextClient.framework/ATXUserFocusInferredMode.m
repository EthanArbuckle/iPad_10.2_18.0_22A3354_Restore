@implementation ATXUserFocusInferredMode

- (ATXUserFocusInferredMode)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXUserFocusInferredMode *v6;

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UserFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "InferredMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXUserFocusInferredMode initWithStream:](self, "initWithStream:", v5);

  return v6;
}

- (ATXUserFocusInferredMode)initWithStream:(id)a3
{
  id v5;
  ATXUserFocusInferredMode *v6;
  ATXUserFocusInferredMode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserFocusInferredMode;
  v6 = -[ATXUserFocusInferredMode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stream, a3);

  return v7;
}

- (id)currentMode
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = (void *)MEMORY[0x1D82448B0](self, a2);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  v14 = 0;
  -[BMStream atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:](self->_stream, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1E943D3E0, &unk_1E943D3E0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__ATXUserFocusInferredMode_currentMode__block_invoke_5;
  v8[3] = &unk_1E942DB38;
  v8[4] = &v9;
  v5 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_17, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  objc_autoreleasePoolPop(v3);
  return v6;
}

void __39__ATXUserFocusInferredMode_currentMode__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__ATXUserFocusInferredMode_currentMode__block_invoke_cold_1(v2);

  }
}

void __39__ATXUserFocusInferredMode_currentMode__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isStart");

  if (v4)
  {
    objc_msgSend(v8, "eventBody");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

  }
}

- (id)currentModeEvent
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v3 = (void *)MEMORY[0x1D82448B0](self, a2);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__16;
  v13 = __Block_byref_object_dispose__16;
  v14 = 0;
  -[BMStream atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:](self->_stream, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1E943D3E0, &unk_1E943D3E0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__ATXUserFocusInferredMode_currentModeEvent__block_invoke_8;
  v8[3] = &unk_1E942DB38;
  v8[4] = &v9;
  v5 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_7_1, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  objc_autoreleasePoolPop(v3);
  return v6;
}

void __44__ATXUserFocusInferredMode_currentModeEvent__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__ATXUserFocusInferredMode_currentMode__block_invoke_cold_1(v2);

  }
}

void __44__ATXUserFocusInferredMode_currentModeEvent__block_invoke_8(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStart");

  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

- (id)previousModeEvent
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = (void *)MEMORY[0x1D82448B0](self, a2);
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__16;
  v14 = __Block_byref_object_dispose__16;
  v15 = 0;
  -[BMStream atx_publisherFromStartDate:](self->_stream, "atx_publisherFromStartDate:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = &v10;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45__ATXUserFocusInferredMode_previousModeEvent__block_invoke;
  v9[3] = &unk_1E942EB38;
  v9[4] = &v10;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__ATXUserFocusInferredMode_previousModeEvent__block_invoke_9;
  v8[3] = &unk_1E942DB38;
  v5 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", v9, v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  objc_autoreleasePoolPop(v3);
  return v6;
}

void __45__ATXUserFocusInferredMode_previousModeEvent__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __45__ATXUserFocusInferredMode_previousModeEvent__block_invoke_cold_1(v3);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "modeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412546;
    v11 = v8;
    v12 = 2048;
    v13 = (int)objc_msgSend(v9, "modeType");
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "BMInferredModeStream: done fetching last mode event. previousBMInferredModeEvent modeUUID:%@, modeType: %lu", (uint8_t *)&v10, 0x16u);

  }
}

void __45__ATXUserFocusInferredMode_previousModeEvent__block_invoke_9(uint64_t a1, void *a2)
{
  void *v4;
  char v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isStart");

  if ((v5 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

- (id)lastTwoInferredModeEvents
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x1D82448B0](self, a2);
  v4 = (void *)objc_opt_new();
  -[BMStream atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:](self->_stream, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, &unk_1E943D3F8, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __53__ATXUserFocusInferredMode_lastTwoInferredModeEvents__block_invoke_12;
  v9[3] = &unk_1E942EE08;
  v6 = v4;
  v10 = v6;
  v7 = (id)objc_msgSend(v5, "sinkWithCompletion:receiveInput:", &__block_literal_global_11_5, v9);

  objc_autoreleasePoolPop(v3);
  return v6;
}

void __53__ATXUserFocusInferredMode_lastTwoInferredModeEvents__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__ATXUserFocusInferredMode_lastTwoInferredModeEvents__block_invoke_cold_1(v2);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "BMInferredModeStream: done fetching the last two mode events", v6, 2u);
  }

}

uint64_t __53__ATXUserFocusInferredMode_lastTwoInferredModeEvents__block_invoke_12(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)inferredModeEventWithSuggestionUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D82448B0]();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__16;
  v22 = __Block_byref_object_dispose__16;
  v23 = 0;
  -[BMStream atx_publisherFromStartDate:](self->_stream, "atx_publisherFromStartDate:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__ATXUserFocusInferredMode_inferredModeEventWithSuggestionUUID___block_invoke;
  v15[3] = &unk_1E942EE30;
  v16 = v4;
  v17 = &v18;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __64__ATXUserFocusInferredMode_inferredModeEventWithSuggestionUUID___block_invoke_13;
  v12[3] = &unk_1E942EE58;
  v8 = v16;
  v13 = v8;
  v14 = &v18;
  v9 = (id)objc_msgSend(v6, "sinkWithCompletion:receiveInput:", v15, v12);

  v10 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  objc_autoreleasePoolPop(v5);
  return v10;
}

void __64__ATXUserFocusInferredMode_inferredModeEventWithSuggestionUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __64__ATXUserFocusInferredMode_inferredModeEventWithSuggestionUUID___block_invoke_cold_1(a1, v3, v6);
  }
  else if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "modeIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "modeType");
    v10 = 138543874;
    v11 = v7;
    v12 = 2114;
    v13 = v8;
    v14 = 2048;
    v15 = v9;
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "BMInferredModeStream: done fetching mode event with suggestion UUID %{public}@, modeUUID:%{public}@, modeType:%lu", (uint8_t *)&v10, 0x20u);

  }
}

void __64__ATXUserFocusInferredMode_inferredModeEventWithSuggestionUUID___block_invoke_13(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isStart"))
    goto LABEL_4;
  objc_msgSend(v10, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  v7 = v10;
  if (v6)
  {
    objc_msgSend(v10, "eventBody");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v3 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
LABEL_4:

    v7 = v10;
  }

}

- (id)currentModeEventAtGivenTime:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D82448B0]();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__16;
  v18 = __Block_byref_object_dispose__16;
  v19 = 0;
  -[BMStream atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:](self->_stream, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v4, 0, &unk_1E943D3E0, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__ATXUserFocusInferredMode_currentModeEventAtGivenTime___block_invoke_15;
  v11[3] = &unk_1E942EB60;
  v7 = v4;
  v12 = v7;
  v13 = &v14;
  v8 = (id)objc_msgSend(v6, "sinkWithCompletion:shouldContinue:", &__block_literal_global_14_0, v11);

  v9 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  objc_autoreleasePoolPop(v5);
  return v9;
}

void __56__ATXUserFocusInferredMode_currentModeEventAtGivenTime___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;

  v2 = a2;
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __39__ATXUserFocusInferredMode_currentMode__block_invoke_cold_1(v2);

  }
}

uint64_t __56__ATXUserFocusInferredMode_currentModeEventAtGivenTime___block_invoke_15(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isStart");

  if (v6)
  {
    __atxlog_handle_modes();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v4, "eventBody");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 136315650;
      v12 = "-[ATXUserFocusInferredMode currentModeEventAtGivenTime:]_block_invoke";
      v13 = 2112;
      v14 = v8;
      v15 = 1024;
      v16 = objc_msgSend(v9, "modeType");
      _os_log_impl(&dword_1D2C00000, v7, OS_LOG_TYPE_DEFAULT, "%s: Active inferred mode at time %@ is %d", (uint8_t *)&v11, 0x1Cu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

  return 0;
}

+ (id)currentMode
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1D82448B0](a1, a2);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "currentMode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

+ (id)currentModeEvent
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1D82448B0](a1, a2);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "currentModeEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

+ (id)currentModeEventAtGivenTime:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D82448B0]();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "currentModeEventAtGivenTime:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

void __39__ATXUserFocusInferredMode_currentMode__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D2C00000, v2, v3, "Unable to get inferred mode event: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __45__ATXUserFocusInferredMode_previousModeEvent__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D2C00000, v2, v3, "BMInferredModeStream: error fetching last mode event: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __53__ATXUserFocusInferredMode_lastTwoInferredModeEvents__block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_2(&dword_1D2C00000, v2, v3, "BMInferredModeStream: error fetching last two mode events: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __64__ATXUserFocusInferredMode_inferredModeEventWithSuggestionUUID___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_error_impl(&dword_1D2C00000, a3, OS_LOG_TYPE_ERROR, "BMInferredModeStream: error fetching mode event with UUID %{public}@: %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
