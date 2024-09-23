@implementation ATXUserFocusComputedMode

- (ATXUserFocusComputedMode)init
{
  void *v3;
  void *v4;
  void *v5;
  ATXUserFocusComputedMode *v6;

  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UserFocus");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ComputedMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ATXUserFocusComputedMode initWithStream:](self, "initWithStream:", v5);

  return v6;
}

- (ATXUserFocusComputedMode)initWithStream:(id)a3
{
  id v5;
  ATXUserFocusComputedMode *v6;
  ATXUserFocusComputedMode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXUserFocusComputedMode;
  v6 = -[ATXUserFocusComputedMode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stream, a3);

  return v7;
}

- (id)currentModeSemanticType
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
  v12 = __Block_byref_object_copy__13;
  v13 = __Block_byref_object_dispose__13;
  v14 = 0;
  -[BMStream atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:](self->_stream, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1E943D398, &unk_1E943D398, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_5;
  v8[3] = &unk_1E942DB38;
  v8[4] = &v9;
  v5 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_14, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  objc_autoreleasePoolPop(v3);
  return v6;
}

void __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke(uint64_t a1, void *a2)
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
      __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_cold_1(v2);

  }
}

void __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "starting");

  if (v4)
  {
    objc_msgSend(v10, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "atx_dndModeSemanticType");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
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
  v12 = __Block_byref_object_copy__13;
  v13 = __Block_byref_object_dispose__13;
  v14 = 0;
  -[BMStream atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:](self->_stream, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1E943D398, &unk_1E943D398, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__ATXUserFocusComputedMode_currentMode__block_invoke_8;
  v8[3] = &unk_1E942DB38;
  v8[4] = &v9;
  v5 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_7_0, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  objc_autoreleasePoolPop(v3);
  return v6;
}

void __39__ATXUserFocusComputedMode_currentMode__block_invoke(uint64_t a1, void *a2)
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
      __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_cold_1(v2);

  }
}

void __39__ATXUserFocusComputedMode_currentMode__block_invoke_8(uint64_t a1, void *a2)
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
  v4 = objc_msgSend(v3, "starting");

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
  v12 = __Block_byref_object_copy__13;
  v13 = __Block_byref_object_dispose__13;
  v14 = 0;
  -[BMStream atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:](self->_stream, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1E943D398, &unk_1E943D398, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__ATXUserFocusComputedMode_currentModeEvent__block_invoke_10;
  v8[3] = &unk_1E942DB38;
  v8[4] = &v9;
  v5 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_9_0, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  objc_autoreleasePoolPop(v3);
  return v6;
}

void __44__ATXUserFocusComputedMode_currentModeEvent__block_invoke(uint64_t a1, void *a2)
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
      __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_cold_1(v2);

  }
}

void __44__ATXUserFocusComputedMode_currentModeEvent__block_invoke_10(uint64_t a1, void *a2)
{
  void *v4;
  int v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "starting");

  if (v5)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

- (id)currentModeUUID
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
  v12 = __Block_byref_object_copy__13;
  v13 = __Block_byref_object_dispose__13;
  v14 = 0;
  -[BMStream atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:](self->_stream, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, &unk_1E943D398, &unk_1E943D398, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__ATXUserFocusComputedMode_currentModeUUID__block_invoke_12;
  v8[3] = &unk_1E942DB38;
  v8[4] = &v9;
  v5 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", &__block_literal_global_11_4, v8);

  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  objc_autoreleasePoolPop(v3);
  return v6;
}

void __43__ATXUserFocusComputedMode_currentModeUUID__block_invoke(uint64_t a1, void *a2)
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
      __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_cold_1(v2);

  }
}

void __43__ATXUserFocusComputedMode_currentModeUUID__block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "starting");

  v5 = v11;
  if (v4)
  {
    objc_msgSend(v11, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "mode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", v7);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

    }
    v5 = v11;
  }

}

- (id)lastTwoUserFocusComputedStoreEvents
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
  v13 = __Block_byref_object_copy__13;
  v14 = __Block_byref_object_dispose__13;
  v15 = (id)objc_opt_new();
  -[BMStream atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:](self->_stream, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 0, &unk_1E943D3B0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[4] = &v10;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__ATXUserFocusComputedMode_lastTwoUserFocusComputedStoreEvents__block_invoke;
  v9[3] = &unk_1E942EB38;
  v9[4] = &v10;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__ATXUserFocusComputedMode_lastTwoUserFocusComputedStoreEvents__block_invoke_16;
  v8[3] = &unk_1E942DB38;
  v5 = (id)objc_msgSend(v4, "sinkWithCompletion:receiveInput:", v9, v8);

  v6 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  objc_autoreleasePoolPop(v3);
  return v6;
}

void __63__ATXUserFocusComputedMode_lastTwoUserFocusComputedStoreEvents__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __63__ATXUserFocusComputedMode_lastTwoUserFocusComputedStoreEvents__block_invoke_cold_1(v3);
  }
  else
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count");
    __atxlog_handle_modes();
    v4 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v5 == 2)
    {
      if (v6)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "eventBody");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectAtIndexedSubscript:", 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "eventBody");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = v8;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_1D2C00000, v4, OS_LOG_TYPE_DEFAULT, "BMUserFocusComputedModeStream: done fetching the last two mode events \nFirst Event:%@\nSecond Event:%@", (uint8_t *)&v13, 0x16u);

      }
    }
    else if (v6)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "eventBody");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_1D2C00000, v4, OS_LOG_TYPE_DEFAULT, "BMUserFocusComputedModeStream: done fetching the last two mode events First Event:%{public}@", (uint8_t *)&v13, 0xCu);

    }
  }

}

uint64_t __63__ATXUserFocusComputedMode_lastTwoUserFocusComputedStoreEvents__block_invoke_16(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

- (id)currrentModeEventAtGivenTime:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D82448B0]();
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__13;
  v19 = __Block_byref_object_dispose__13;
  v20 = 0;
  __atxlog_handle_modes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "-[ATXUserFocusComputedMode currrentModeEventAtGivenTime:]";
    v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_1D2C00000, v6, OS_LOG_TYPE_DEFAULT, "%s: Searching for active mode at time: %@", buf, 0x16u);
  }

  -[BMStream atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:](self->_stream, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v4, 0, &unk_1E943D398, 0, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__ATXUserFocusComputedMode_currrentModeEventAtGivenTime___block_invoke_18;
  v12[3] = &unk_1E942EB60;
  v8 = v4;
  v13 = v8;
  v14 = &v15;
  v9 = (id)objc_msgSend(v7, "sinkWithCompletion:shouldContinue:", &__block_literal_global_17_0, v12);

  v10 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  objc_autoreleasePoolPop(v5);
  return v10;
}

void __57__ATXUserFocusComputedMode_currrentModeEventAtGivenTime___block_invoke(uint64_t a1, void *a2)
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
      __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_cold_1(v2);

  }
}

uint64_t __57__ATXUserFocusComputedMode_currrentModeEventAtGivenTime___block_invoke_18(uint64_t a1, void *a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  __atxlog_handle_modes();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modeSemanticTypeAsString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 136315394;
    v16 = "-[ATXUserFocusComputedMode currrentModeEventAtGivenTime:]_block_invoke";
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_1D2C00000, v5, OS_LOG_TYPE_DEFAULT, "%s: Got mode: %@", (uint8_t *)&v15, 0x16u);

  }
  objc_msgSend(v4, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "starting");

  if (v9)
  {
    __atxlog_handle_modes();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *(void **)(a1 + 32);
      objc_msgSend(v4, "eventBody");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "modeSemanticTypeAsString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315650;
      v16 = "-[ATXUserFocusComputedMode currrentModeEventAtGivenTime:]_block_invoke";
      v17 = 2112;
      v18 = v11;
      v19 = 2112;
      v20 = v13;
      _os_log_impl(&dword_1D2C00000, v10, OS_LOG_TYPE_DEFAULT, "%s: Active mode at time %@ was %@", (uint8_t *)&v15, 0x20u);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  }

  return 0;
}

+ (id)currentModeSemanticType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1D82448B0](a1, a2);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "currentModeSemanticType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
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

+ (id)currentModeUUID
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1D82448B0](a1, a2);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "currentModeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

+ (id)currrentModeEventAtGivenTime:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D82448B0]();
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "currrentModeEventAtGivenTime:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

void __51__ATXUserFocusComputedMode_currentModeSemanticType__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D2C00000, v2, v3, "Could not obtain current Focus from Biome: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

void __63__ATXUserFocusComputedMode_lastTwoUserFocusComputedStoreEvents__block_invoke_cold_1(void *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_1D2C00000, v2, v3, "BMUserFocusComputedModeStream: error fetching last two mode events: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

@end
