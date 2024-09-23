@implementation ATXModeDuetHelper

- (id)modeStreamFrom:(id)a3 to:(id)a4 limit:(unint64_t)a5
{
  return -[ATXModeDuetHelper modeStreamFrom:to:ascending:limit:](self, "modeStreamFrom:to:ascending:limit:", a3, a4, 1, a5);
}

- (id)modeStreamFrom:(id)a3 to:(id)a4 ascending:(BOOL)a5 limit:(unint64_t)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  ATXModeDuetHelper *v25;
  _QWORD v26[4];
  BOOL v27;
  _QWORD v28[4];
  id v29;
  id v30;

  v6 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_opt_new();
  v25 = self;
  -[ATXModeDuetHelper _duetStreamShim](self, "_duetStreamShim");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "UserFocus");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "InferredMode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "atx_publisherWithStartDate:endDate:maxEvents:lastN:reversed:", v10, v9, 0, 0, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "filterWithIsIncluded:", &__block_literal_global_15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke_3;
  v28[3] = &unk_1E942EC90;
  v29 = v12;
  v19 = v11;
  v30 = v19;
  v20 = v12;
  v21 = (id)objc_msgSend(v17, "sinkWithCompletion:receiveInput:", &__block_literal_global_5_0, v28);

  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke_4;
  v26[3] = &__block_descriptor_33_e31_q24__0___DKEvent_8___DKEvent_16l;
  v27 = v6;
  objc_msgSend(v19, "sortUsingComparator:", v26);
  if (v6)
  {
    -[ATXModeDuetHelper _updateModeStreamEndDates:to:](v25, "_updateModeStreamEndDates:to:", v19, v9);
    v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = v19;
  }
  v23 = v22;

  return v23;
}

uint64_t __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "eventBody");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStart");

  return v3;
}

void __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  int v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v22[5] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "modeType");

  objc_msgSend(v3, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "absoluteTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "origin");
  v10 = v9;
  if (v9 >= 0x12)
  {
    __atxlog_handle_modes();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke_3_cold_1(v10, v12);

    v11 = CFSTR("Unknown");
  }
  else
  {
    v11 = off_1E942ECD0[v9];
  }

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%ld"), v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x1E0D159F8];
    v15 = *(_QWORD *)(a1 + 32);
    v22[0] = v13;
    v21[0] = CFSTR("mode");
    v21[1] = CFSTR("start");
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "timeIntervalSince1970");
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%lld"), (uint64_t)v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v18;
    v22[2] = v11;
    v21[2] = CFSTR("modeOrigin");
    v21[3] = CFSTR("contextVector");
    v21[4] = CFSTR("process");
    v22[3] = &stru_1E942FC10;
    v22[4] = CFSTR("contextstored");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "eventWithStream:startDate:endDate:identifierStringValue:metadata:", v15, v7, v7, v13, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v20);
  }

}

uint64_t __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v5 = a3;
  v6 = a2;
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "earlierDate:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 1;
  if (*(_BYTE *)(a1 + 32))
    v11 = -1;
  v12 = -1;
  if (*(_BYTE *)(a1 + 32))
    v12 = 1;
  if (v9 == v10)
    return v11;
  else
    return v12;
}

- (id)_updateModeStreamEndDates:(id)a3 to:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v27;
  void *v28;
  void *v29;
  void *v30;

  v6 = a3;
  v27 = a4;
  v7 = (void *)objc_opt_new();
  -[ATXModeDuetHelper _duetStreamShim](self, "_duetStreamShim");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v8 = 0;
    v9 = 0x1E0D15000uLL;
    do
    {
      v10 = (void *)MEMORY[0x1D82448B0]();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 == objc_msgSend(v6, "count") - 1)
      {
        v12 = *(void **)(v9 + 2552);
        objc_msgSend(v11, "startDate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "metadata");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "eventWithStream:startDate:endDate:value:metadata:", v30, v13, v27, v14, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "addObject:", v16);
        ++v8;
      }
      else
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", ++v8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = *(void **)(v9 + 2552);
        objc_msgSend(v11, "startDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "startDate");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "value");
        v29 = v10;
        v20 = v7;
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "metadata");
        v22 = v6;
        v23 = v9;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "eventWithStream:startDate:endDate:value:metadata:", v30, v18, v19, v21, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v23;
        v6 = v22;

        v7 = v20;
        v10 = v29;

        objc_msgSend(v7, "addObject:", v25);
      }

      objc_autoreleasePoolPop(v10);
    }
    while (v8 < objc_msgSend(v6, "count"));
  }

  return v7;
}

- (id)_duetStreamShim
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D15A18];
  objc_msgSend(MEMORY[0x1E0D15980], "type");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventStreamWithName:valueType:", CFSTR("pap/internal"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void __55__ATXModeDuetHelper_modeStreamFrom_to_ascending_limit___block_invoke_3_cold_1(int a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1D2C00000, a2, OS_LOG_TYPE_FAULT, "BMUserFocusInferredModeOrigin: %lu not handled in switch statement", (uint8_t *)&v2, 0xCu);
}

@end
