@implementation SignpostSupportMachTimeTranslator

- (SignpostSupportMachTimeTranslator)init
{
  SignpostSupportMachTimeTranslator *v2;
  uint64_t v3;
  NSMutableArray *translationRanges;
  uint64_t v5;
  NSMutableArray *startMachAbsoluteTimes;
  uint64_t v7;
  NSMutableArray *startMachContinuousTimes;
  dispatch_queue_t v9;
  OS_dispatch_queue *synchronizationQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SignpostSupportMachTimeTranslator;
  v2 = -[SignpostSupportMachTimeTranslator init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    translationRanges = v2->_translationRanges;
    v2->_translationRanges = (NSMutableArray *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    startMachAbsoluteTimes = v2->_startMachAbsoluteTimes;
    v2->_startMachAbsoluteTimes = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    startMachContinuousTimes = v2->_startMachContinuousTimes;
    v2->_startMachContinuousTimes = (NSMutableArray *)v7;

    v9 = dispatch_queue_create("SignpostSupportMachTimeTranslator synchronization queue", 0);
    synchronizationQueue = v2->_synchronizationQueue;
    v2->_synchronizationQueue = (OS_dispatch_queue *)v9;

  }
  return v2;
}

- (BOOL)containsContinuousTimeJumps
{
  void *v2;
  BOOL v3;

  -[SignpostSupportMachTimeTranslator translationRanges](self, "translationRanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (unint64_t)objc_msgSend(v2, "count") > 1;

  return v3;
}

- (id)dataRepresentation
{
  void *v2;
  void *v3;

  -[SignpostSupportMachTimeTranslator serializableDictionaryRepresentation](self, "serializableDictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 200, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (SignpostSupportMachTimeTranslator)initWithDataRepresentation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SignpostSupportMachTimeTranslator *v7;
  NSObject *v8;
  id v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  v6 = v5;
  if (v4)
  {
    self = -[SignpostSupportMachTimeTranslator initWithDictionaryRepresentation:](self, "initWithDictionaryRepresentation:", v4);
    v7 = self;
  }
  else
  {
    if (v5)
    {
      _timeTranslatorDebugLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[SignpostSupportMachTimeTranslator initWithDataRepresentation:].cold.1(v6, v8);

    }
    v7 = 0;
  }

  return v7;
}

- (SignpostSupportMachTimeTranslator)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  char v6;
  NSObject *v7;
  NSObject *v8;
  SignpostSupportMachTimeTranslator *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  SignpostSupportMachTimeTranslationRange *v15;
  void *v16;
  SignpostSupportMachTimeTranslator *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SignpostSupportMachTimeTranslatorTypeKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(CFSTR("SignpostSupportMachTimeTranslator"), "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    _timeTranslatorDebugLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[SignpostSupportMachTimeTranslator initWithDictionaryRepresentation:].cold.2(v8, v18, v19, v20, v21, v22, v23, v24);
    goto LABEL_19;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SignpostSupportMachTimeTranslatorVersionKey"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7 || (-[NSObject isEqualToNumber:](v7, "isEqualToNumber:", &unk_1E462E8E8) & 1) == 0)
  {
    _timeTranslatorDebugLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[SignpostSupportMachTimeTranslator initWithDictionaryRepresentation:].cold.1(v25, v26, v27, v28, v29, v30, v31, v32);

LABEL_19:
    v17 = 0;
    goto LABEL_20;
  }
  v9 = -[SignpostSupportMachTimeTranslator init](self, "init");
  if (v9)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("TranslationRanges"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v35;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v35 != v13)
            objc_enumerationMutation(v10);
          v15 = -[SignpostSupportMachTimeTranslationRange initWithArrayRepresentation:]([SignpostSupportMachTimeTranslationRange alloc], "initWithArrayRepresentation:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v14));
          -[SignpostSupportMachTimeTranslator translationRanges](v9, "translationRanges");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v15);

          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v12);
    }

  }
  self = v9;
  v17 = self;
LABEL_20:

  return v17;
}

- (id)serializableDictionaryRepresentation
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1;
  v11 = __Block_byref_object_dispose__1;
  v12 = 0;
  -[SignpostSupportMachTimeTranslator synchronizationQueue](self, "synchronizationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __73__SignpostSupportMachTimeTranslator_serializableDictionaryRepresentation__block_invoke;
  v6[3] = &unk_1E46013F0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __73__SignpostSupportMachTimeTranslator_serializableDictionaryRepresentation__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "translationRanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v7), "serializableArrayRepresentation");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", CFSTR("SignpostSupportMachTimeTranslator"), CFSTR("SignpostSupportMachTimeTranslatorTypeKey"), &unk_1E462E8E8, CFSTR("SignpostSupportMachTimeTranslatorVersionKey"), v2, CFSTR("TranslationRanges"), 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

}

- (void)addTimestampPairWithMachAbsoluteTime:(unint64_t)a3 machContinuousTime:(unint64_t)a4
{
  NSObject *v7;
  _QWORD block[7];

  -[SignpostSupportMachTimeTranslator synchronizationQueue](self, "synchronizationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__SignpostSupportMachTimeTranslator_addTimestampPairWithMachAbsoluteTime_machContinuousTime___block_invoke;
  block[3] = &unk_1E46014A0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_sync(v7, block);

}

void __93__SignpostSupportMachTimeTranslator_addTimestampPairWithMachAbsoluteTime_machContinuousTime___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  unint64_t v4;
  SignpostSupportMachTimeTranslationRange *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  SignpostSupportMachTimeTranslationRange *v25;

  objc_msgSend(*(id *)(a1 + 32), "translationRanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    v25 = -[SignpostSupportMachTimeTranslationRange initWithStartMachAbsoluteTime:startContinuousTime:]([SignpostSupportMachTimeTranslationRange alloc], "initWithStartMachAbsoluteTime:startContinuousTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "translationRanges");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addObject:", v25);

    objc_msgSend(*(id *)(a1 + 32), "startMachAbsoluteTimes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObject:", v24);

    objc_msgSend(*(id *)(a1 + 32), "startMachContinuousTimes");
    v5 = (SignpostSupportMachTimeTranslationRange *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SignpostSupportMachTimeTranslationRange addObject:](v5, "addObject:", v21);
    goto LABEL_11;
  }
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "translationRanges");
  v25 = (SignpostSupportMachTimeTranslationRange *)objc_claimAutoreleasedReturnValue();
  -[SignpostSupportMachTimeTranslationRange firstObject](v25, "firstObject");
  v5 = (SignpostSupportMachTimeTranslationRange *)objc_claimAutoreleasedReturnValue();
  if (v4 < -[SignpostSupportMachTimeTranslationRange startMachAbsoluteTime](v5, "startMachAbsoluteTime"))
  {
LABEL_12:

    goto LABEL_13;
  }
  v6 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "translationRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "startMachContinuousTime");

  if (v6 > v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "translationRanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "lastObject");
    v25 = (SignpostSupportMachTimeTranslationRange *)objc_claimAutoreleasedReturnValue();

    if (-[SignpostSupportMachTimeTranslationRange setEndMachAbsoluteTimestamp:endMachContinuousTime:](v25, "setEndMachAbsoluteTimestamp:endMachContinuousTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
    {
LABEL_13:

      return;
    }
    if (-[SignpostSupportMachTimeTranslationRange endMachContinuousTime](v25, "endMachContinuousTime") != -1
      && -[SignpostSupportMachTimeTranslationRange endMachContinuousTime](v25, "endMachContinuousTime") >= *(_QWORD *)(a1 + 48))
    {
      __93__SignpostSupportMachTimeTranslator_addTimestampPairWithMachAbsoluteTime_machContinuousTime___block_invoke_cold_1();
    }
    v5 = -[SignpostSupportMachTimeTranslationRange initWithStartMachAbsoluteTime:startContinuousTime:]([SignpostSupportMachTimeTranslationRange alloc], "initWithStartMachAbsoluteTime:startContinuousTime:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 32), "translationRanges");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v5);

    objc_msgSend(*(id *)(a1 + 32), "startMachAbsoluteTimes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v13);

    objc_msgSend(*(id *)(a1 + 32), "startMachContinuousTimes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    if (objc_msgSend(*(id *)(a1 + 32), "maxEntries"))
    {
      objc_msgSend(*(id *)(a1 + 32), "translationRanges");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      v18 = objc_msgSend(*(id *)(a1 + 32), "maxEntries");

      if (v17 > v18)
      {
        objc_msgSend(*(id *)(a1 + 32), "translationRanges");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeObjectAtIndex:", 0);

        objc_msgSend(*(id *)(a1 + 32), "startMachAbsoluteTimes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "removeObjectAtIndex:", 0);

        objc_msgSend(*(id *)(a1 + 32), "startMachContinuousTimes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObjectAtIndex:", 0);
LABEL_11:

        goto LABEL_12;
      }
    }
    goto LABEL_12;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[SignpostSupportMachTimeTranslator translationRanges](self, "translationRanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "translationRanges");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToArray:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)machAbsoluteTimeForMachContinuousTime:(unint64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SignpostSupportMachTimeTranslator synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SignpostSupportMachTimeTranslator_machAbsoluteTimeForMachContinuousTime___block_invoke;
  block[3] = &unk_1E46014E8;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __75__SignpostSupportMachTimeTranslator_machAbsoluteTimeForMachContinuousTime___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "translationRanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 32), "translationRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = *(void **)(a1 + 32);
  if (v5 != 1)
  {
    objc_msgSend(v6, "startMachContinuousTimes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "startMachContinuousTimes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, objc_msgSend(v11, "count"), 1024, &__block_literal_global_19);

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "translationRanges");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v12 - 1);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_8:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;
    return;
  }
  objc_msgSend(v6, "translationRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v13 = (id)v8;

  if ((objc_msgSend(v13, "containsMachContinuousTime:", *(_QWORD *)(a1 + 48)) & 1) != 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v13, "machAbsoluteTimeForMachContinuousTime:", *(_QWORD *)(a1 + 48));
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;

}

uint64_t __75__SignpostSupportMachTimeTranslator_machAbsoluteTimeForMachContinuousTime___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (unint64_t)machContinuousTimeForMachAbsoluteTime:(unint64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[SignpostSupportMachTimeTranslator synchronizationQueue](self, "synchronizationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SignpostSupportMachTimeTranslator_machContinuousTimeForMachAbsoluteTime___block_invoke;
  block[3] = &unk_1E46014E8;
  block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(v5, block);

  v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

void __75__SignpostSupportMachTimeTranslator_machContinuousTimeForMachAbsoluteTime___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "translationRanges");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
    goto LABEL_8;
  objc_msgSend(*(id *)(a1 + 32), "translationRanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  v6 = *(void **)(a1 + 32);
  if (v5 != 1)
  {
    objc_msgSend(v6, "startMachAbsoluteTimes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "startMachAbsoluteTimes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "indexOfObject:inSortedRange:options:usingComparator:", v10, 0, objc_msgSend(v11, "count"), 1024, &__block_literal_global_68);

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "translationRanges");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndexedSubscript:", v12 - 1);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_8:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;
    return;
  }
  objc_msgSend(v6, "translationRanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v13 = (id)v8;

  if ((objc_msgSend(v13, "containsMachAbsoluteTime:", *(_QWORD *)(a1 + 48)) & 1) != 0)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v13, "machContinuousTimeForMachAbsoluteTime:", *(_QWORD *)(a1 + 48));
  else
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -1;

}

uint64_t __75__SignpostSupportMachTimeTranslator_machContinuousTimeForMachAbsoluteTime___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (NSMutableArray)translationRanges
{
  return self->_translationRanges;
}

- (NSMutableArray)startMachAbsoluteTimes
{
  return self->_startMachAbsoluteTimes;
}

- (NSMutableArray)startMachContinuousTimes
{
  return self->_startMachContinuousTimes;
}

- (unint64_t)maxEntries
{
  return self->_maxEntries;
}

- (void)setMaxEntries:(unint64_t)a3
{
  self->_maxEntries = a3;
}

- (OS_dispatch_queue)synchronizationQueue
{
  return self->_synchronizationQueue;
}

- (void)setSynchronizationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_synchronizationQueue, a3);
}

- (BOOL)isMonitoringSleepWake
{
  return self->_isMonitoringSleepWake;
}

- (void)setIsMonitoringSleepWake:(BOOL)a3
{
  self->_isMonitoringSleepWake = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synchronizationQueue, 0);
  objc_storeStrong((id *)&self->_startMachContinuousTimes, 0);
  objc_storeStrong((id *)&self->_startMachAbsoluteTimes, 0);
  objc_storeStrong((id *)&self->_translationRanges, 0);
}

- (void)initWithDataRepresentation:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_debug_impl(&dword_1A1A28000, a2, OS_LOG_TYPE_DEBUG, "Could not deserialize time translator: %@", (uint8_t *)&v4, 0xCu);

}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A1A28000, a1, a3, "Invalid version key", a5, a6, a7, a8, 0);
}

- (void)initWithDictionaryRepresentation:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1A1A28000, a1, a3, "Missing type key", a5, a6, a7, a8, 0);
}

void __93__SignpostSupportMachTimeTranslator_addTimestampPairWithMachAbsoluteTime_machContinuousTime___block_invoke_cold_1()
{
  __assert_rtn("-[SignpostSupportMachTimeTranslator addTimestampPairWithMachAbsoluteTime:machContinuousTime:]_block_invoke", "SignpostSupportMachTimeTranslator.m", 251, "lastRange.endMachContinuousTime < machContinuousTime");
}

@end
