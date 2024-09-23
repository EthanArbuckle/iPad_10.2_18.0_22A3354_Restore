@implementation PAAccessPublisherPipelines

+ (id)accessPublisherWithoutHiddenOrMissingApps:(id)a3
{
  return (id)objc_msgSend(a1, "accessPublisherWithoutHiddenOrMissingApps:withBundleLookup:", a3, &__block_literal_global_7);
}

id __72__PAAccessPublisherPipelines_accessPublisherWithoutHiddenOrMissingApps___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v2 = (void *)MEMORY[0x1E0CA5898];
  objc_msgSend(a2, "bundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v2, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v3, 0, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)accessPublisherWithoutHiddenOrMissingApps:(id)a3 withBundleLookup:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  _QWORD aBlock[4];
  id v18;
  id v19;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PAAccessPublisherPipelines_accessPublisherWithoutHiddenOrMissingApps_withBundleLookup___block_invoke;
  aBlock[3] = &unk_1E4FA5230;
  v18 = v8;
  v19 = v5;
  v10 = v5;
  v11 = v8;
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __89__PAAccessPublisherPipelines_accessPublisherWithoutHiddenOrMissingApps_withBundleLookup___block_invoke_2;
  v15[3] = &unk_1E4FA5258;
  v16 = _Block_copy(aBlock);
  v12 = v16;
  objc_msgSend(v7, "filterWithIsIncluded:", v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t __89__PAAccessPublisherPipelines_accessPublisherWithoutHiddenOrMissingApps_withBundleLookup___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t IsVisibleApplication;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "bundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    IsVisibleApplication = objc_msgSend(v6, "BOOLValue");
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      IsVisibleApplication = PABundleRecordIsVisibleApplication(v8);
    else
      IsVisibleApplication = 0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", IsVisibleApplication);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 32);
    objc_msgSend(v3, "bundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  }
  return IsVisibleApplication;
}

uint64_t __89__PAAccessPublisherPipelines_accessPublisherWithoutHiddenOrMissingApps_withBundleLookup___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = (void *)MEMORY[0x1A85B5DA4]();
  objc_msgSend(v3, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && !objc_msgSend(v6, "identifierType"))
    v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    v7 = 1;

  objc_autoreleasePoolPop(v4);
  return v7;
}

+ (id)accessPublisherWithoutOutOfProcessPickerAccesses:(id)a3
{
  return (id)objc_msgSend(a3, "filterWithIsIncluded:", &__block_literal_global_16);
}

BOOL __79__PAAccessPublisherPipelines_accessPublisherWithoutOutOfProcessPickerAccesses___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  char isKindOfClass;

  v2 = a2;
  v3 = (void *)MEMORY[0x1A85B5DA4]();
  objc_msgSend(v2, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  objc_autoreleasePoolPop(v3);
  return (isKindOfClass & 1) == 0;
}

+ (id)accessPublisherWithoutUnknownCategoryAccesses:(id)a3
{
  return (id)objc_msgSend(a3, "filterWithIsIncluded:", &__block_literal_global_18);
}

uint64_t __76__PAAccessPublisherPipelines_accessPublisherWithoutUnknownCategoryAccesses___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = a2;
  v3 = (void *)MEMORY[0x1A85B5DA4]();
  objc_msgSend(v2, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", CFSTR("unknown")) ^ 1;

  objc_autoreleasePoolPop(v3);
  return v6;
}

+ (id)accessRecordsFromPublisher:(id)a3
{
  return (id)objc_msgSend(a1, "accessRecordsFromPublisher:reversed:", a3, 0);
}

+ (id)accessRecordsFromPublisher:(id)a3 reversed:(BOOL)a4
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  BOOL v9;

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__PAAccessPublisherPipelines_accessRecordsFromPublisher_reversed___block_invoke;
  v8[3] = &__block_descriptor_33_e79___PAAccessRecordAccumulator_24__0__PAAccessRecordAccumulator_8__BMStoreEvent_16l;
  v9 = a4;
  objc_msgSend(a3, "scanWithInitial:nextPartialResult:", 0, v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filterWithIsIncluded:", &__block_literal_global_27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapWithTransform:", &__block_literal_global_29);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __66__PAAccessPublisherPipelines_accessRecordsFromPublisher_reversed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void (**v19)(_QWORD);
  void *v20;
  uint64_t v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  PACompleteAccessRecord *v30;
  void *v31;
  PACompleteAccessRecord *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD aBlock[4];
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A85B5DA4]();
  if (!v5)
    v5 = (id)objc_opt_new();
  objc_msgSend(v6, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setRecord:", 0);
  if (v8)
  {
    objc_msgSend(v6, "timestamp");
    v10 = v9;
    objc_msgSend(v6, "eventBody");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timestampAdjustment");
    v13 = v12;

    v42 = 0;
    v43 = &v42;
    v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__3;
    v46 = __Block_byref_object_dispose__3;
    objc_msgSend(v5, "ongoingIntervals");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eventBody");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v16);
    v47 = (id)objc_claimAutoreleasedReturnValue();

    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PAAccessPublisherPipelines_accessRecordsFromPublisher_reversed___block_invoke_20;
    aBlock[3] = &unk_1E4FA52E0;
    v41 = &v42;
    v17 = v6;
    v39 = v17;
    v18 = v5;
    v40 = v18;
    v19 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v17, "eventBody");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "kind");

    v22 = v10 + v13;
    switch(v21)
    {
      case 1:
        objc_msgSend(v18, "seenEvents");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "eventBody");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v23, "containsObject:", v25);

        if ((v26 & 1) != 0)
          goto LABEL_13;
        objc_msgSend(v18, "seenEvents");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "eventBody");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "identifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "addObject:", v29);

        v30 = [PACompleteAccessRecord alloc];
        objc_msgSend(v17, "eventBody");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = -[PACompleteAccessRecord initWithAccess:startTime:endTime:](v30, "initWithAccess:startTime:endTime:", v31, v22, v22);
        objc_msgSend(v18, "setRecord:", v32);
        goto LABEL_12;
      case 2:
        v19[2](v19);
        objc_msgSend((id)v43[5], "setStartTime:", v22);
        if (*(_BYTE *)(a1 + 32))
          goto LABEL_11;
        goto LABEL_13;
      case 3:
        v19[2](v19);
        objc_msgSend((id)v43[5], "setEndTime:", v22);
        if (!*(_BYTE *)(a1 + 32))
        {
LABEL_11:
          objc_msgSend((id)v43[5], "asSealedRecord");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setRecord:", v34);

          objc_msgSend(v18, "ongoingIntervals");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "eventBody");
          v32 = (PACompleteAccessRecord *)objc_claimAutoreleasedReturnValue();
          -[PACompleteAccessRecord identifier](v32, "identifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, v35);

LABEL_12:
        }
        goto LABEL_13;
      case 4:
LABEL_13:
        v36 = v18;
        break;
      default:
        break;
    }

    _Block_object_dispose(&v42, 8);
  }
  else
  {
    v33 = v5;
  }
  objc_autoreleasePoolPop(v7);

  return v5;
}

void __66__PAAccessPublisherPipelines_accessRecordsFromPublisher_reversed___block_invoke_20(uint64_t a1)
{
  PAWorkInProgressAccessInterval *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v2 = objc_alloc_init(PAWorkInProgressAccessInterval);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_msgSend(*(id *)(a1 + 32), "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "asIntervalEventWithAssetIdentifiers:visibilityState:accessEventCount:", v6, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setAccess:", v7);

    v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(*(id *)(a1 + 40), "ongoingIntervals");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, v10);

  }
}

BOOL __66__PAAccessPublisherPipelines_accessRecordsFromPublisher_reversed___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "record");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __66__PAAccessPublisherPipelines_accessRecordsFromPublisher_reversed___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "record");
}

+ (id)ongoingAccessRecordsFromPublisher:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0C99E08];
  v4 = a3;
  objc_msgSend(v3, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reduceWithInitial:nextPartialResult:", v5, &__block_literal_global_31);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "flatMapWithTransform:", &__block_literal_global_33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __64__PAAccessPublisherPipelines_ongoingAccessRecordsFromPublisher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1A85B5DA4]();
  objc_msgSend(v5, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "kind");

  if (v8 == 3)
  {
    objc_msgSend(v5, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v4;
    v12 = 0;
    goto LABEL_5;
  }
  if (v8 == 2)
  {
    objc_msgSend(v5, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v4;
    v12 = v5;
LABEL_5:
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, v10);

  }
  v13 = v4;
  objc_autoreleasePoolPop(v6);

  return v13;
}

id __64__PAAccessPublisherPipelines_ongoingAccessRecordsFromPublisher___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  PAOngoingAccessRecord *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  PAOngoingAccessRecord *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v2, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v8);
        v10 = [PAOngoingAccessRecord alloc];
        objc_msgSend(v9, "eventBody");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timestamp");
        v13 = v12;
        objc_msgSend(v9, "eventBody");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timestampAdjustment");
        v16 = -[PAOngoingAccessRecord initWithAccess:startTime:](v10, "initWithAccess:startTime:", v11, v13 + v15);
        objc_msgSend(v3, "addObject:", v16);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D02478]), "initWithSequence:", v3);
  return v17;
}

+ (id)coalesceAccessRecordsFromPublisher:(id)a3 withCoalescingWindowDuration:(double)a4 reversed:(BOOL)a5
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  double v20;
  BOOL v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0C99E38];
  v8 = a3;
  objc_msgSend(v7, "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0D02478]);
  v22[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithSequence:", v11);
  objc_msgSend(v8, "mergeWithOther:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __103__PAAccessPublisherPipelines_coalesceAccessRecordsFromPublisher_withCoalescingWindowDuration_reversed___block_invoke;
  v18[3] = &unk_1E4FA5408;
  v19 = v9;
  v21 = a5;
  v20 = a4;
  v14 = v9;
  objc_msgSend(v13, "scanWithInitial:nextPartialResult:", 0, v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "flatMapWithTransform:", &__block_literal_global_98);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

PAAccessRecordCoalescingInWindowState *__103__PAAccessPublisherPipelines_coalesceAccessRecordsFromPublisher_withCoalescingWindowDuration_reversed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  double v10;
  PAAccessRecordCoalescingIncompleteRecordState *v11;
  PAAccessRecordCoalescingInWindowState *v12;
  unint64_t v13;
  int v14;
  PAAccessRecordCoalescingInWindowState *v15;
  uint64_t v16;
  unint64_t v17;
  PAAccessRecordCoalescingInWindowState *v18;
  PAAccessRecordCoalescingInWindowState *v19;

  v5 = a2;
  v6 = a3;
  if (!v5)
    v5 = (id)objc_opt_new();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "previousState");
    v7 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v7;
  }
  if (*(id *)(a1 + 32) == v6)
  {
    v11 = -[PAAccessRecordCoalescingDoneState initByEndingLastWindow:reversed:]([PAAccessRecordCoalescingDoneState alloc], "initByEndingLastWindow:reversed:", v5, *(unsigned __int8 *)(a1 + 48));
LABEL_11:
    v12 = (PAAccessRecordCoalescingInWindowState *)v11;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = -[PAAccessRecordCoalescingIncompleteRecordState initWithPreviousState:recordToRepublish:]([PAAccessRecordCoalescingIncompleteRecordState alloc], "initWithPreviousState:recordToRepublish:", v5, v6);
    goto LABEL_11;
  }
  v8 = v6;
  v9 = v8;
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(v8, "startTime");
  else
    objc_msgSend(v8, "endTime");
  v13 = llround(v10 / *(double *)(a1 + 40));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = -[PAAccessRecordCoalescingInWindowState initWithFirstAccessRecord:forEpoch:]([PAAccessRecordCoalescingInWindowState alloc], "initWithFirstAccessRecord:forEpoch:", v9, v13);
  }
  else
  {
    v14 = objc_msgSend(v5, "conformsToProtocol:", &unk_1EE80D260);
    v15 = (PAAccessRecordCoalescingInWindowState *)v5;
    v12 = v15;
    if (v14)
    {
      v16 = -[PAAccessRecordCoalescingInWindowState epoch](v15, "epoch");
      v17 = v13 - v16;
      if ((uint64_t)(v13 - v16) < 0)
        v17 = v16 - v13;
      if (v17 < 2)
        v18 = -[PAAccessRecordCoalescingInWindowState initByContinuingWindow:withAccessRecord:]([PAAccessRecordCoalescingInWindowState alloc], "initByContinuingWindow:withAccessRecord:", v12, v9);
      else
        v18 = -[PAAccessRecordCoalescingWindowRolledOverState initByEndingPreviousWindow:reversed:withInitialAccessRecord:forNewEpoch:]([PAAccessRecordCoalescingWindowRolledOverState alloc], "initByEndingPreviousWindow:reversed:withInitialAccessRecord:forNewEpoch:", v12, *(unsigned __int8 *)(a1 + 48), v9, v13);
      v19 = v18;

      v12 = v19;
    }
  }

LABEL_23:
  return v12;
}

id __103__PAAccessPublisherPipelines_coalesceAccessRecordsFromPublisher_withCoalescingWindowDuration_reversed___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0D02478];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "recordsToRepublish");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithSequence:", v5);
  return v6;
}

+ (id)completeAccessRecordFromPartialAccessRecord:(id)a3 nextAccessPublisher:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __94__PAAccessPublisherPipelines_completeAccessRecordFromPartialAccessRecord_nextAccessPublisher___block_invoke;
  v10[3] = &unk_1E4FA5470;
  v11 = v6;
  v12 = a1;
  v7 = v6;
  objc_msgSend(a1, "completeAccessRecordFromPartialAccessRecord:nextStartTime:accessPublisher:", v7, v10, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __94__PAAccessPublisherPipelines_completeAccessRecordFromPartialAccessRecord_nextAccessPublisher___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "endTime");
  return objc_msgSend(v1, "nextStartTimeForEndTime:iteration:");
}

+ (id)completeAccessRecordFromPartialAccessRecord:(id)a3 nextStartTime:(id)a4 accessPublisher:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "endTime");
  objc_msgSend(a1, "findBeginningForPartialAccessRecord:iteration:nextStartTime:endTime:accessPublisher:", v8, v10, v9, 0.0, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __104__PAAccessPublisherPipelines_completeAccessRecordFromPartialAccessRecord_nextStartTime_accessPublisher___block_invoke;
  v16[3] = &unk_1E4FA5498;
  v17 = v8;
  v13 = v8;
  objc_msgSend(v12, "mapWithTransform:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

PACompleteAccessRecord *__104__PAAccessPublisherPipelines_completeAccessRecordFromPartialAccessRecord_nextStartTime_accessPublisher___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PACompleteAccessRecord *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  PACompleteAccessRecord *v12;

  v3 = a2;
  v4 = [PACompleteAccessRecord alloc];
  objc_msgSend(*(id *)(a1 + 32), "access");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timestamp");
  v7 = v6;
  objc_msgSend(v3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "timestampAdjustment");
  v10 = v7 + v9;
  objc_msgSend(*(id *)(a1 + 32), "endTime");
  v12 = -[PACompleteAccessRecord initWithAccess:startTime:endTime:](v4, "initWithAccess:startTime:endTime:", v5, v10, v11);

  return v12;
}

+ (id)findBeginningForPartialAccessRecord:(id)a3 iteration:(double)a4 nextStartTime:(id)a5 endTime:(double)a6 accessPublisher:(id)a7
{
  id v12;
  double (**v13)(_QWORD, double);
  void (**v14)(_QWORD);
  double v15;
  double v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;
  double (**v29)(_QWORD, double);
  void (**v30)(_QWORD);
  id v31;
  double v32;
  double v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[6];

  v12 = a3;
  v13 = (double (**)(_QWORD, double))a5;
  v14 = (void (**)(_QWORD))a7;
  v15 = v13[2](v13, a4);
  if (v15 == a6 || (v16 = v15, v14[2](v14), (v17 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v25 = objc_alloc(MEMORY[0x1E0D02478]);
    v24 = (void *)objc_msgSend(v25, "initWithSequence:", MEMORY[0x1E0C9AA60]);
  }
  else
  {
    v18 = v17;
    v19 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __114__PAAccessPublisherPipelines_findBeginningForPartialAccessRecord_iteration_nextStartTime_endTime_accessPublisher___block_invoke;
    v36[3] = &__block_descriptor_40_e22_B16__0__BMStoreEvent_8l;
    *(double *)&v36[4] = a6;
    objc_msgSend(v17, "filterWithIsIncluded:", v36);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v19;
    v34[1] = 3221225472;
    v34[2] = __114__PAAccessPublisherPipelines_findBeginningForPartialAccessRecord_iteration_nextStartTime_endTime_accessPublisher___block_invoke_2;
    v34[3] = &unk_1E4FA54E0;
    v22 = v12;
    v35 = v22;
    objc_msgSend(v20, "reduceWithInitial:nextPartialResult:", v21, v34);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v19;
    v27[1] = 3221225472;
    v27[2] = __114__PAAccessPublisherPipelines_findBeginningForPartialAccessRecord_iteration_nextStartTime_endTime_accessPublisher___block_invoke_3;
    v27[3] = &unk_1E4FA5508;
    v31 = a1;
    v28 = v22;
    v32 = a4;
    v29 = v13;
    v33 = v16;
    v30 = v14;
    objc_msgSend(v23, "flatMapWithTransform:", v27);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v24;
}

BOOL __114__PAAccessPublisherPipelines_findBeginningForPartialAccessRecord_iteration_nextStartTime_endTime_accessPublisher___block_invoke(uint64_t a1, void *a2)
{
  double v3;

  objc_msgSend(a2, "timestamp");
  return v3 < *(double *)(a1 + 32);
}

id __114__PAAccessPublisherPipelines_findBeginningForPartialAccessRecord_iteration_nextStartTime_endTime_accessPublisher___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1A85B5DA4]();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v5)
  {
    objc_msgSend(v6, "eventBody");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v6, "eventBody");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "kind") == 2)
      {
        objc_msgSend(v6, "eventBody");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "access");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "identifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v15, "isEqual:", v17);

        if (v18)
        {
          v9 = v6;
          goto LABEL_3;
        }
      }
      else
      {

      }
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
  }
  v9 = v5;
LABEL_3:
  v10 = v9;
  objc_autoreleasePoolPop(v7);

  return v10;
}

id __114__PAAccessPublisherPipelines_findBeginningForPartialAccessRecord_iteration_nextStartTime_endTime_accessPublisher___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    objc_msgSend(*(id *)(a1 + 56), "findBeginningForPartialAccessRecord:iteration:nextStartTime:endTime:accessPublisher:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 64) + 1.0, *(double *)(a1 + 72));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (objc_class *)MEMORY[0x1E0D02478];
    v6 = v3;
    v7 = [v5 alloc];
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)objc_msgSend(v7, "initWithSequence:", v8);
  }

  return v9;
}

+ (double)nextStartTimeForEndTime:(double)a3 iteration:(double)a4
{
  double v6;
  double v7;

  if (a4 <= 4.0)
  {
    v6 = exp2(a4);
    v7 = -5.0;
  }
  else
  {
    if (a4 > 10.0)
      return 0.0;
    v6 = exp2(a4 + -5.0) * 3.0;
    v7 = -60.0;
  }
  return a3 + v6 * v7 * 60.0;
}

@end
