@implementation PPEventStorage

- (PPEventStorage)init
{
  return -[PPEventStorage initWithEventStorePurgerGetter:](self, "initWithEventStorePurgerGetter:", &__block_literal_global_22_16024);
}

- (PPEventStorage)initWithEventStorePurger:(id)a3
{
  id v4;
  id v5;
  PPEventStorage *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__PPEventStorage_initWithEventStorePurger___block_invoke;
  v8[3] = &unk_1E7E1BD58;
  v9 = v4;
  v5 = v4;
  v6 = -[PPEventStorage initWithEventStorePurgerGetter:](self, "initWithEventStorePurgerGetter:", v8);

  return v6;
}

- (PPEventStorage)initWithEventStorePurgerGetter:(id)a3
{
  id v4;
  PPEventStorage *v5;
  _QWORD *v6;
  uint64_t v7;
  id purgerGetter;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _PASLock *lock;
  uint64_t v14;
  OS_dispatch_queue *serialQueue;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PPEventStorage;
  v5 = -[PPEventStorage init](&v17, sel_init);
  if (v5)
  {
    v6 = (_QWORD *)objc_opt_new();
    v7 = objc_msgSend(v4, "copy");
    purgerGetter = v5->_purgerGetter;
    v5->_purgerGetter = (id)v7;

    v9 = (void *)MEMORY[0x1C3BD6630]();
    (*((void (**)(void))v5->_purgerGetter + 2))();
    v10 = objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v9);
    v11 = (void *)v6[1];
    v6[1] = v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v6);
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v12;

    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:qosClass:", "com.apple.proactive.PPEventStorage.serialQueue", 9);
    v14 = objc_claimAutoreleasedReturnValue();
    serialQueue = v5->_serialQueue;
    v5->_serialQueue = (OS_dispatch_queue *)v14;

  }
  return v5;
}

- (BOOL)attemptToPurgeImmediately
{
  _PASLock *lock;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __43__PPEventStorage_attemptToPurgeImmediately__block_invoke;
  v5[3] = &unk_1E7E1BDE0;
  v5[4] = self;
  v5[5] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)runBlockWithPurgerDisabled:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(void);

  v6 = (void (**)(void))a3;
  v4 = (void *)os_transaction_create();
  v5 = (void *)MEMORY[0x1C3BD6630](-[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_30));
  v6[2]();
  objc_autoreleasePoolPop(v5);
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_31);

}

- (id)eventWithIdentifier:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__15965;
  v16 = __Block_byref_object_dispose__15966;
  v17 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__PPEventStorage_eventWithIdentifier___block_invoke;
  v9[3] = &unk_1E7E1BDE0;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)eventsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;
  NSUInteger v13;
  NSUInteger v14;

  length = a3.length;
  location = a3.location;
  v6 = (void *)objc_opt_new();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __32__PPEventStorage_eventsInRange___block_invoke;
  v11[3] = &unk_1E7E1D288;
  v11[4] = self;
  v13 = location;
  v14 = length;
  v7 = v6;
  v12 = v7;
  -[PPEventStorage runBlockWithPurgerDisabled:](self, "runBlockWithPurgerDisabled:", v11);
  v8 = v12;
  v9 = v7;

  return v9;
}

- (void)enumerateEventsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  id v18;
  _QWORD v19[6];
  id v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[8];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];
  uint64_t v39;

  length = a3.length;
  location = a3.location;
  v39 = *MEMORY[0x1E0C80C00];
  v18 = a4;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__15965;
  v36 = __Block_byref_object_dispose__15966;
  v37 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke;
  v31[3] = &unk_1E7E1BE70;
  v31[6] = location;
  v31[7] = length;
  v31[4] = self;
  v31[5] = &v32;
  -[PPEventStorage runBlockWithPurgerDisabled:](self, "runBlockWithPurgerDisabled:", v31);
  -[PPEventStorage attemptToPurgeImmediately](self, "attemptToPurgeImmediately");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)location);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v7, (double)length);

  v17 = objc_msgSend((id)v33[5], "count");
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = (id)v33[5];
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v28;
LABEL_3:
    v12 = 0;
    v13 = v17;
    v17 -= v10;
    while (1)
    {
      if (*(_QWORD *)v28 != v11)
        objc_enumerationMutation(v9);
      v14 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12);
      v15 = (void *)MEMORY[0x1C3BD6630]();
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 0;
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_3;
      v19[3] = &unk_1E7E1BEC0;
      v19[4] = self;
      v19[5] = v14;
      v20 = v8;
      v21 = v18;
      v22 = &v23;
      -[PPEventStorage runBlockWithPurgerDisabled:](self, "runBlockWithPurgerDisabled:", v19);
      if (!(v13 % 0xA))
        -[PPEventStorage attemptToPurgeImmediately](self, "attemptToPurgeImmediately");
      v16 = *((unsigned __int8 *)v24 + 24);

      _Block_object_dispose(&v23, 8);
      objc_autoreleasePoolPop(v15);
      if (v16)
        break;
      ++v12;
      --v13;
      if (v10 == v12)
      {
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  _Block_object_dispose(&v32, 8);
}

- (id)suggestedEventsInRange:(_NSRange)a3 ekStore:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  _QWORD v21[5];
  id v22;
  _QWORD v23[4];
  id v24;
  NSUInteger v25;
  NSUInteger v26;
  uint8_t buf[4];
  NSUInteger v28;
  __int16 v29;
  NSUInteger v30;
  uint64_t v31;

  length = a3.length;
  location = a3.location;
  v31 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)objc_opt_new();
  pp_events_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (length < 0x127501)
  {
    if (v10)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPEventStorage: suggestedEventsInRange: short query, using date range predicate", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)location);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(location + length));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateForEventsWithStartDate:endDate:calendars:", v12, v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __49__PPEventStorage_suggestedEventsInRange_ekStore___block_invoke_41;
      v21[3] = &unk_1E7E1BF10;
      v21[4] = self;
      v22 = v8;
      objc_msgSend(v7, "enumerateEventsMatchingPredicate:usingBlock:", v15, v21);

      goto LABEL_10;
    }
    pp_events_log_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v28 = location;
      v29 = 2048;
      v30 = length;
      _os_log_error_impl(&dword_1C392E000, v19, OS_LOG_TYPE_ERROR, "PPEventStorage: EventKit returned a nil predicate for Events range: (%tu, %tu)", buf, 0x16u);
    }

LABEL_18:
    v18 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_19;
  }
  if (v10)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEFAULT, "PPEventStorage: suggestedEventsInRange: large query, using suggested event predicate", buf, 2u);
  }

  objc_msgSend(v7, "predicateForEventsCreatedFromSuggestion");
  v11 = objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    pp_events_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1C392E000, v12, OS_LOG_TYPE_ERROR, "PPEventStorage: EventKit returned a nil predicate for predicateForEventsCreatedFromSuggestion", buf, 2u);
    }
    goto LABEL_18;
  }
  v12 = v11;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __49__PPEventStorage_suggestedEventsInRange_ekStore___block_invoke;
  v23[3] = &unk_1E7E1BEE8;
  v25 = location;
  v26 = length;
  v24 = v8;
  objc_msgSend(v7, "enumerateEventsMatchingPredicate:usingBlock:", v12, v23);
  v13 = v24;
LABEL_10:

  objc_msgSend(v8, "sortedArrayUsingSelector:", sel_compareStartDateWithEvent_);
  v16 = objc_claimAutoreleasedReturnValue();
  v12 = v16;
  v17 = (void *)MEMORY[0x1E0C9AA60];
  if (v16)
    v17 = (void *)v16;
  v18 = v17;
LABEL_19:

  return v18;
}

- (id)nlEventsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _PASLock *lock;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  length = a3.length;
  location = a3.location;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__15965;
  v17 = __Block_byref_object_dispose__15966;
  v18 = 0;
  v18 = (id)objc_opt_new();
  lock = self->_lock;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __34__PPEventStorage_nlEventsInRange___block_invoke;
  v12[3] = &unk_1E7E1BF60;
  v12[5] = location;
  v12[6] = length;
  v12[4] = &v13;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v12);
  objc_msgSend((id)v14[5], "sortedArrayUsingSelector:", sel_compareStartDateWithEvent_);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x1E0C9AA60];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;

  _Block_object_dispose(&v13, 8);
  return v10;
}

- (void)iterateEventsFrom:(id)a3 to:(id)a4 inChunks:(int)a5 withBlock:(id)a6
{
  id v11;
  id v12;
  id v13;
  _PASLock *lock;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  PPEventStorage *v22;
  id v23;
  int v24;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  if (!a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPEventStorage.m"), 313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfChunks"));

  }
  lock = self->_lock;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __58__PPEventStorage_iterateEventsFrom_to_inChunks_withBlock___block_invoke;
  v19[3] = &unk_1E7E1BFD8;
  v20 = v12;
  v21 = v11;
  v24 = a5;
  v22 = self;
  v23 = v13;
  v15 = v13;
  v16 = v11;
  v18 = v12;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v19);

}

- (id)resolveEventFromEKChange:(id)a3
{
  id v4;
  void *v5;
  _PASLock *lock;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__15965;
    v16 = __Block_byref_object_dispose__15966;
    v17 = 0;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __43__PPEventStorage_resolveEventFromEKChange___block_invoke;
    v9[3] = &unk_1E7E1BDE0;
    v10 = v4;
    v11 = &v12;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)enumerateEventsFromEKObjectIDs:(id)a3 expandingRecurrencesInRange:(id)a4 usingBlock:(id)a5
{
  -[PPEventStorage enumerateEventsFromEKObjectIDs:expandingRecurrencesInRange:withFiltering:usingBlock:]((uint64_t)self, a3, a4, 1, a5);
}

- (id)eventWithExternalID:(id)a3
{
  id v4;
  void *v5;
  _PASLock *lock;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__15965;
    v16 = __Block_byref_object_dispose__15966;
    v17 = 0;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__PPEventStorage_eventWithExternalID___block_invoke;
    v9[3] = &unk_1E7E1BDE0;
    v10 = v4;
    v11 = &v12;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)eventKitChangeIsEvent:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  objc_opt_class();
  v4 = (objc_opt_isKindOfClass() & 1) == 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    || objc_msgSend(v3, "entityType") == 2;

  return v4;
}

- (BOOL)shouldIngestEvent:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__PPEventStorage_shouldIngestEvent___block_invoke;
  v8[3] = &unk_1E7E1C068;
  v8[4] = self;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LOBYTE(lock) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)lock;
}

- (BOOL)shouldIgnoreEventsOnCalendarWithObjectID:(id)a3
{
  id v4;
  void *v5;
  _PASLock *lock;
  BOOL v7;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __59__PPEventStorage_shouldIgnoreEventsOnCalendarWithObjectID___block_invoke;
    v9[3] = &unk_1E7E1C068;
    v9[4] = self;
    v11 = &v12;
    v10 = v4;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
    v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)clearCaches
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_63_15963);
}

- (void)setInvisibleCalendarIdentifiers:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PPEventStorage_setInvisibleCalendarIdentifiers___block_invoke;
  v7[3] = &unk_1E7E1C0B0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_purgerGetter, 0);
}

void __50__PPEventStorage_setInvisibleCalendarIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  _QWORD *v4;
  uint64_t v5;
  id v6;

  v3 = (objc_class *)MEMORY[0x1E0C99E60];
  v4 = a2;
  v5 = objc_msgSend([v3 alloc], "initWithArray:", *(_QWORD *)(a1 + 32));
  v6 = (id)v4[3];
  v4[3] = v5;

}

void __29__PPEventStorage_clearCaches__block_invoke(uint64_t a1, _QWORD *a2)
{
  void *v2;
  _QWORD *v3;
  id v4;

  v2 = (void *)a2[2];
  a2[2] = 0;
  v3 = a2;

  v4 = (id)v3[4];
  v3[4] = 0;

}

uint64_t __59__PPEventStorage_shouldIgnoreEventsOnCalendarWithObjectID___block_invoke(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v5;
  _QWORD *v6;
  id v7;
  uint64_t result;

  v3 = (void *)a2[4];
  if (!v3)
  {
    v5 = (void *)a1[4];
    v6 = a2;
    v7 = -[PPEventStorage _loadCalendars](v5);
    v3 = (void *)a2[4];

  }
  result = objc_msgSend(v3, "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result ^ 1;
  return result;
}

- (id)_loadCalendars
{
  id v1;
  _QWORD v3[7];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  if (!a1)
    return 0;
  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__15965;
  v8 = __Block_byref_object_dispose__15966;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__PPEventStorage__loadCalendars__block_invoke;
  v3[3] = &unk_1E7E1C1A8;
  v3[5] = &v4;
  v3[6] = sel__loadCalendars;
  v3[4] = a1;
  objc_msgSend(a1, "runBlockWithPurgerDisabled:", v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

uint64_t __32__PPEventStorage__loadCalendars__block_invoke(uint64_t a1)
{
  __int128 v1;
  void *v2;
  _QWORD v4[4];
  __int128 v5;
  uint64_t v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __32__PPEventStorage__loadCalendars__block_invoke_2;
  v4[3] = &unk_1E7E1C180;
  v6 = *(_QWORD *)(a1 + 48);
  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  v5 = v1;
  return objc_msgSend(v2, "runWithLockAcquired:", v4);
}

void __32__PPEventStorage__loadCalendars__block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  pp_events_log_handle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C392E000, v4, OS_LOG_TYPE_DEFAULT, "PPEventStorage: loading calendars", buf, 2u);
  }

  v5 = (void *)objc_msgSend(v3, "ekStore");
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("PPEventStorage.m"), 583, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[guardedData ekStore]"));

  }
  v6 = (void *)objc_msgSend(v3, "ekStore");
  objc_msgSend(v6, "calendarsForEntityType:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __32__PPEventStorage__loadCalendars__block_invoke_68;
  v24[3] = &unk_1E7E1C0D8;
  v8 = v3;
  v25 = v8;
  objc_msgSend(v7, "_pas_filteredArrayWithTest:", v24);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1[5] + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "_pas_mappedArrayWithTransform:", &__block_literal_global_72_15973);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "initWithArray:", v13);
  v15 = (void *)v8[2];
  v8[2] = v14;

  v16 = objc_alloc(MEMORY[0x1E0C99E60]);
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "_pas_mappedArrayWithTransform:", &__block_literal_global_74);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "initWithArray:", v17);
  v19 = (void *)v8[4];
  v8[4] = v18;

  pp_events_log_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "count");
    v22 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    *(_DWORD *)buf = 134218243;
    v27 = v21;
    v28 = 2113;
    v29 = v22;
    _os_log_impl(&dword_1C392E000, v20, OS_LOG_TYPE_DEFAULT, "PPEventStorage: will use %tu calendars: %{private}@", buf, 0x16u);
  }

}

uint64_t __32__PPEventStorage__loadCalendars__block_invoke_68(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v8;
  void *v9;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 3
    || (objc_msgSend(v3, "isSubscribed") & 1) != 0
    || (objc_msgSend(v3, "source"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isDelegate"),
        v4,
        (v5 & 1) != 0)
    || objc_msgSend(v3, "type") == 4)
  {
    v6 = 0;
  }
  else
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    objc_msgSend(v3, "calendarIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v8) = objc_msgSend(v8, "containsObject:", v9);

    v6 = v8 ^ 1;
  }

  return v6;
}

uint64_t __32__PPEventStorage__loadCalendars__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "objectID");
}

id __32__PPEventStorage__loadCalendars__block_invoke_2_70(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "calendarIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return v3;
}

void __36__PPEventStorage_shouldIngestEvent___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  char v7;
  _BOOL4 v8;
  uint64_t v9;
  _QWORD *v10;

  v10 = a2;
  v3 = (void *)v10[2];
  if (!v3)
  {
    v4 = -[PPEventStorage _loadCalendars](*(void **)(a1 + 32));
    v3 = (void *)v10[2];
  }
  objc_msgSend(*(id *)(a1 + 40), "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendarIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "containsObject:", v6);

  if ((v7 & 1) == 0)
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    goto LABEL_7;
  }
  v8 = -[PPEventStorage _isAllDayOrMultiDayEvent:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40));
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v8)
  {
LABEL_7:
    *(_BYTE *)(v9 + 24) = 0;
    goto LABEL_8;
  }
  *(_BYTE *)(v9 + 24) = 1;
LABEL_8:

}

- (BOOL)_isAllDayOrMultiDayEvent:(_BOOL8)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if ((objc_msgSend(v3, "isAllDay") & 1) != 0)
    {
      a1 = 1;
    }
    else
    {
      objc_msgSend(v4, "endDate");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startDate");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "timeIntervalSinceDate:", v6);
      a1 = v7 >= 86400.0;

    }
  }

  return a1;
}

void __38__PPEventStorage_eventWithExternalID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(a2, "ekStore");
  objc_msgSend(v3, "calendarItemsWithExternalIdentifier:", *(_QWORD *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v10);
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)enumerateEventsFromEKObjectIDs:(void *)a3 expandingRecurrencesInRange:(char)a4 withFiltering:(void *)a5 usingBlock:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  char v21;

  v14 = a2;
  v9 = a3;
  v10 = a5;
  if (a1 && objc_msgSend(v14, "count"))
  {
    v11 = (void *)objc_opt_new();
    v12 = *(void **)(a1 + 16);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __102__PPEventStorage_enumerateEventsFromEKObjectIDs_expandingRecurrencesInRange_withFiltering_usingBlock___block_invoke;
    v15[3] = &unk_1E7E1C040;
    v21 = a4;
    v16 = v14;
    v17 = a1;
    v18 = v9;
    v19 = v11;
    v20 = v10;
    v13 = v11;
    objc_msgSend(v12, "runWithLockAcquired:", v15);

  }
}

void __102__PPEventStorage_enumerateEventsFromEKObjectIDs_expandingRecurrencesInRange_withFiltering_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  BOOL v38;
  char v39;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  unint64_t v43;
  unint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  char v48;
  void *v49;
  void *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  void *v61;
  unint64_t v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *context;
  void *contexta;
  void *contextb;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id obj;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  char v84;
  uint8_t buf[4];
  uint64_t v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v84 = 0;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = *(id *)(a1 + 32);
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v81;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v81 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * v7);
        v9 = (void *)MEMORY[0x1C3BD6630]();
        v10 = (void *)MEMORY[0x1C3BD6630]();
        v11 = (void *)objc_msgSend(v3, "ekStore");
        objc_msgSend(v11, "publicObjectWithObjectID:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v10);
        if (!v12)
        {
          pp_default_log_handle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v8;
            v23 = v22;
            v24 = "PPEventStorage: objectID %@ no longer exists, probably deleted";
            goto LABEL_35;
          }
          goto LABEL_25;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          pp_default_log_handle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412547;
            v86 = v8;
            v87 = 2117;
            v88 = v12;
            _os_log_fault_impl(&dword_1C392E000, v22, OS_LOG_TYPE_FAULT, "PPEventStorage: saw non-ekevent: %@ %{sensitive}@", buf, 0x16u);
          }
LABEL_25:

          goto LABEL_26;
        }
        objc_msgSend(v12, "startDate");
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13
          || (v14 = (void *)v13,
              objc_msgSend(v12, "endDate"),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v15,
              v14,
              !v15))
        {
          pp_default_log_handle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v86 = v8;
            v23 = v22;
            v24 = "PPEventStorage: objectID %@ has no startDate and/or endDate, probably deleted";
LABEL_35:
            _os_log_debug_impl(&dword_1C392E000, v23, OS_LOG_TYPE_DEBUG, v24, buf, 0xCu);
          }
          goto LABEL_25;
        }
        if (*(_BYTE *)(a1 + 72) && (objc_msgSend(*(id *)(a1 + 40), "shouldIngestEvent:", v12) & 1) == 0)
        {
          pp_default_log_handle();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "startDate");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "title");
            v77 = a1;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412803;
            v86 = v8;
            v87 = 2113;
            v88 = v27;
            v89 = 2117;
            v90 = v28;
            _os_log_debug_impl(&dword_1C392E000, v22, OS_LOG_TYPE_DEBUG, "PPEventStorage: enumerateEventsFromEKObjectIDs skipping objectID %@ because shouldIngestEvent returned NO: %{private}@ %{sensitive}@", buf, 0x20u);

            a1 = v77;
          }
          goto LABEL_25;
        }
        if (!*(_QWORD *)(a1 + 48)
          || (objc_msgSend(v12, "isDetached") & 1) != 0
          || (objc_msgSend(v12, "hasRecurrenceRules") & 1) == 0)
        {
          v25 = (void *)MEMORY[0x1C3BD6630]();
          pp_default_log_handle();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v12, "startDate");
            contextb = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "title");
            v78 = a1;
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412803;
            v86 = v8;
            v87 = 2113;
            v88 = contextb;
            v89 = 2117;
            v90 = v54;
            _os_log_debug_impl(&dword_1C392E000, v26, OS_LOG_TYPE_DEBUG, "PPEventStorage: enumerateEventsFromEKObjectIDs calling block for objectID %@ without recurrence expansion: %{private}@ %{sensitive}@", buf, 0x20u);

            a1 = v78;
          }

          (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
          objc_autoreleasePoolPop(v25);
LABEL_26:
          if (v84)
            goto LABEL_73;
          goto LABEL_27;
        }
        v61 = (void *)MEMORY[0x1C3BD6630]();
        pp_default_log_handle();
        v16 = objc_claimAutoreleasedReturnValue();
        v76 = a1;
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v12, "startDate");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "title");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412803;
          v86 = v8;
          v87 = 2113;
          v88 = v56;
          v89 = 2117;
          v90 = v57;
          _os_log_debug_impl(&dword_1C392E000, v16, OS_LOG_TYPE_DEBUG, "PPEventStorage: enumerateEventsFromEKObjectIDs will expand recurrences for objectID %@: %{private}@ %{sensitive}@", buf, 0x20u);

          a1 = v76;
        }

        v17 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
        if (v84)
        {
          objc_autoreleasePoolPop(v61);
LABEL_73:

          objc_autoreleasePoolPop(v9);
          goto LABEL_74;
        }
        v18 = (void *)MEMORY[0x1C3BD6630](v17);
        objc_msgSend(v12, "exceptionDates");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v19;
        if (v19)
        {
          v21 = v19;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v21 = (id)objc_claimAutoreleasedReturnValue();
        }
        v71 = v21;

        objc_autoreleasePoolPop(v18);
        context = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v12, "detachedItems");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_pas_mappedSetWithTransform:", &__block_literal_global_58);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30;
        if (v30)
        {
          v32 = v30;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99E60], "set");
          v32 = (id)objc_claimAutoreleasedReturnValue();
        }
        v33 = v32;

        objc_autoreleasePoolPop(context);
        v34 = (void *)MEMORY[0x1C3BD6630]();
        objc_msgSend(v71, "setByAddingObjectsFromSet:", v33);
        contexta = (void *)objc_claimAutoreleasedReturnValue();
        objc_autoreleasePoolPop(v34);

        objc_msgSend(v12, "startCalendarDate");
        v35 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "recurrenceRules");
        v36 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "persistentObject");
        v37 = objc_claimAutoreleasedReturnValue();
        v70 = (void *)v36;
        v72 = (void *)v35;
        v69 = (void *)v37;
        if (v36)
          v38 = v37 == 0;
        else
          v38 = 1;
        v39 = v38;
        v60 = v39;
        if (v38)
        {
          pp_default_log_handle();
          v40 = objc_claimAutoreleasedReturnValue();
          a1 = v76;
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            goto LABEL_66;
          *(_DWORD *)buf = 138412290;
          v86 = v8;
          v41 = v40;
          v42 = "PPEventStorage: objectID %@ has lost its recurrenceRules and/or persistentObject, probably deleted";
LABEL_64:
          _os_log_debug_impl(&dword_1C392E000, v41, OS_LOG_TYPE_DEBUG, v42, buf, 0xCu);
          goto LABEL_66;
        }
        a1 = v76;
        if (!v35)
        {
          pp_default_log_handle();
          v40 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            goto LABEL_66;
          *(_DWORD *)buf = 138412290;
          v86 = v8;
          v41 = v40;
          v42 = "PPEventStorage: enumerateEventsFromEKObjectIDs cancelled expanding recurrences for objectID %@ (startCal"
                "endarDate was nil)";
          goto LABEL_64;
        }
        objc_msgSend(*(id *)(v76 + 48), "startDate");
        v40 = objc_claimAutoreleasedReturnValue();
        if (!v84)
        {
          v43 = 0;
          v59 = v6;
          while (1)
          {
            v64 = v40;
            v44 = v43;
            v68 = (void *)MEMORY[0x1C3BD6630]();
            v63 = *(void **)(a1 + 56);
            v45 = (void *)MEMORY[0x1E0D0C420];
            objc_msgSend(MEMORY[0x1E0C99E80], "calendarTimeZone");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "calendarDateWithDate:timeZone:", v40, v66);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = v44;
            objc_msgSend(v63, "nextOccurrenceDateWithEKRecurrences:forCalendarItem:exceptionDates:initialDate:afterDate:inclusive:", v70, v12, contexta, v72, v46, v44 == 0);
            v40 = objc_claimAutoreleasedReturnValue();

            if (!v40 || !objc_msgSend(*(id *)(a1 + 48), "containsDate:", v40))
              break;
            objc_msgSend(v12, "startDate");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = -[NSObject isEqual:](v40, "isEqual:", v47);

            v6 = v59;
            if ((v48 & 1) == 0)
            {
              v49 = (void *)MEMORY[0x1C3BD6630]();
              v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA060]), "initWithPersistentObject:occurrenceDate:", v69, v40);
              objc_autoreleasePoolPop(v49);
              pp_default_log_handle();
              v51 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
              {
                objc_msgSend(v50, "startDate");
                v67 = v40;
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v50, "title");
                v65 = v50;
                v53 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412803;
                v86 = v8;
                v87 = 2113;
                v88 = v52;
                v89 = 2117;
                v90 = v53;
                _os_log_debug_impl(&dword_1C392E000, v51, OS_LOG_TYPE_DEBUG, "PPEventStorage: enumerateEventsFromEKObjectIDs object ID %@ calling block for occurrence: %{private}@ %{sensitive}@", buf, 0x20u);

                v50 = v65;
                v40 = v67;
              }

              (*(void (**)(void))(*(_QWORD *)(v76 + 64) + 16))();
            }
            objc_autoreleasePoolPop(v68);
            a1 = v76;
            if (v62 <= 0x12)
            {
              v43 = v62 + 1;
              if (!v84)
                continue;
            }
            goto LABEL_66;
          }
          v6 = v59;
          objc_autoreleasePoolPop(v68);
        }
LABEL_66:

        objc_autoreleasePoolPop(v61);
        v55 = v60;
        if (!v84)
          v55 = 1;
        if ((v55 & 1) == 0)
          goto LABEL_73;
LABEL_27:

        objc_autoreleasePoolPop(v9);
        ++v7;
      }
      while (v7 != v5);
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v80, v91, 16);
      v5 = v58;
    }
    while (v58);
  }
LABEL_74:

}

uint64_t __102__PPEventStorage_enumerateEventsFromEKObjectIDs_expandingRecurrencesInRange_withFiltering_usingBlock___block_invoke_56(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "recurrenceDate");
}

void __43__PPEventStorage_resolveEventFromEKChange___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "entityType") == 2)
  {
    v3 = (void *)objc_msgSend(v7, "ekStore");
    objc_msgSend(v3, "publicObjectWithObjectID:", *(_QWORD *)(a1 + 32));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
}

void __58__PPEventStorage_iterateEventsFrom_to_inChunks_withBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  int v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v21 = a2;
  v3 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceDate:", *(_QWORD *)(a1 + 40));
  v5 = v4;
  v6 = *(_DWORD *)(a1 + 64);
  -[PPEventStorage _loadCalendars](*(void **)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(int *)(a1 + 64) >= 1)
  {
    v8 = 0;
    v9 = v5 / (double)v6;
    v10 = 0.0;
    do
    {
      v11 = (void *)MEMORY[0x1C3BD6630]();
      if (v8)
        objc_msgSend(*(id *)(a1 + 48), "attemptToPurgeImmediately");
      objc_msgSend(*(id *)(a1 + 40), "dateByAddingTimeInterval:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "dateByAddingTimeInterval:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceReferenceDate");
      v15 = v14;
      objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
      if (v15 >= v16)
      {
        v17 = *(id *)(a1 + 32);

        v13 = v17;
      }
      v18 = *(void **)(a1 + 48);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __58__PPEventStorage_iterateEventsFrom_to_inChunks_withBlock___block_invoke_2;
      v22[3] = &unk_1E7E1BFB0;
      v23 = v21;
      v24 = v12;
      v25 = v13;
      v26 = v7;
      v27 = v3;
      v28 = *(id *)(a1 + 56);
      v19 = v13;
      v20 = v12;
      objc_msgSend(v18, "runBlockWithPurgerDisabled:", v22);
      v10 = v9 + v10;

      objc_autoreleasePoolPop(v11);
      ++v8;
    }
    while (v8 < *(_DWORD *)(a1 + 64));
  }

}

void __58__PPEventStorage_iterateEventsFrom_to_inChunks_withBlock___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "ekStore");
  objc_msgSend(v2, "predicateForEventsWithStartDate:endDate:calendars:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __58__PPEventStorage_iterateEventsFrom_to_inChunks_withBlock___block_invoke_3;
  v4[3] = &unk_1E7E1BF88;
  v5 = *(id *)(a1 + 64);
  v6 = *(id *)(a1 + 72);
  objc_msgSend(v2, "enumerateEventsMatchingPredicate:usingBlock:", v3, v4);

}

void __58__PPEventStorage_iterateEventsFrom_to_inChunks_withBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)MEMORY[0x1C3BD6630]();
  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "hash"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((v4 & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "hash"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

  }
  objc_autoreleasePoolPop(v3);

}

void __34__PPEventStorage_nlEventsInRange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  __int128 v9;

  v3 = a2;
  v4 = (void *)objc_msgSend(v3, "ekStore");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", (double)*(unint64_t *)(a1 + 40));
  objc_msgSend(v4, "predicateForNaturalLanguageSuggestedEventsWithSearchString:startDate:", 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v3, "ekStore");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __34__PPEventStorage_nlEventsInRange___block_invoke_2;
  v8[3] = &unk_1E7E1BF38;
  v9 = *(_OWORD *)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "enumerateEventsMatchingPredicate:usingBlock:", v6, v8);

}

void __34__PPEventStorage_nlEventsInRange___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  v6 = a1[5];
  if (v5 > (double)v6 && v5 < (double)(a1[6] + v6))
    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "addObject:", v7);

}

void __49__PPEventStorage_suggestedEventsInRange_ekStore___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  unint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  v6 = *(_QWORD *)(a1 + 40);
  if (v5 > (double)v6 && v5 < (double)(*(_QWORD *)(a1 + 48) + v6))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

}

void __49__PPEventStorage_suggestedEventsInRange_ekStore___block_invoke_41(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v7, "customObjectForKey:", CFSTR("SGEventMetadataKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v5);
    if (v6)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
  }
  else
  {

  }
}

void __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  _QWORD v28[5];
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  char v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  if (!v2)
    goto LABEL_4;
  v3 = a1[6];
  v4 = a1[7];
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__15965;
  v33 = __Block_byref_object_dispose__15966;
  v34 = 0;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", (double)(v3 + v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(v2 + 16);
  v8 = MEMORY[0x1E0C809B0];
  *(_QWORD *)buf = MEMORY[0x1E0C809B0];
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = __59__PPEventStorage__predicateForRange_loadDefaultProperties___block_invoke;
  v36 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E7E1C1D0;
  v40 = &v29;
  v9 = v5;
  v37 = v9;
  v10 = v6;
  v38 = v10;
  v39 = v2;
  v41 = 0;
  objc_msgSend(v7, "runWithLockAcquired:", buf);
  v11 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  if (v11)
  {
    v12 = (void *)objc_opt_new();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v36 = __Block_byref_object_copy__15965;
    v37 = __Block_byref_object_dispose__15966;
    v38 = 0;
    v13 = *(void **)(a1[4] + 16);
    v28[0] = v8;
    v28[1] = 3221225472;
    v28[2] = __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_37;
    v28[3] = &unk_1E7E1BE48;
    v28[4] = buf;
    objc_msgSend(v13, "runWithLockAcquired:", v28);
    v14 = *(id *)(*(_QWORD *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);

    v23 = v8;
    v24 = 3221225472;
    v25 = __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_2;
    v26 = &unk_1E7E1F5D0;
    v27 = v12;
    v15 = v12;
    objc_msgSend(v14, "enumerateEventsMatchingPredicate:usingBlock:", v11, &v23);

    objc_msgSend(v15, "array", v23, v24, v25, v26);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(a1[5] + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  else
  {
LABEL_4:
    pp_events_log_handle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = a1[6];
      v22 = a1[7];
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v21;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v22;
      _os_log_error_impl(&dword_1C392E000, v19, OS_LOG_TYPE_ERROR, "PPEventStorage: EventKit returned a nil predicate for Events range: (%tu, %tu)", buf, 0x16u);
    }

    v11 = 0;
    v20 = *(_QWORD *)(a1[5] + 8);
    v15 = *(id *)(v20 + 40);
    *(_QWORD *)(v20 + 40) = MEMORY[0x1E0C9AA60];
  }

}

void __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v14[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 48);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_4;
  v9[3] = &unk_1E7E1BE98;
  v5 = v4;
  v6 = *(_QWORD *)(a1 + 32);
  v10 = v5;
  v11 = v6;
  v7 = *(id *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v12 = v7;
  v13 = v8;
  -[PPEventStorage enumerateEventsFromEKObjectIDs:expandingRecurrencesInRange:withFiltering:usingBlock:](v2, v3, v5, 0, v9);

}

void __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_4(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v5 && v6 && objc_msgSend(v5, "compare:", v6) != 1)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v7);
    if (objc_msgSend(v8, "intersectsDateInterval:", a1[4]))
    {
      if (-[PPEventStorage _isAllDayOrMultiDayEvent:](a1[5], v9))
      {
        *a3 = 1;
      }
      else
      {
        (*(void (**)(void))(a1[6] + 16))();
        *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = *a3;
      }
    }

  }
}

void __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_37(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = objc_msgSend(a2, "ekStore");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __52__PPEventStorage_enumerateEventsInRange_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "objectID");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __59__PPEventStorage__predicateForRange_loadDefaultProperties___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = (void *)MEMORY[0x1C3BD6630]();
  v4 = (void *)objc_msgSend(v11, "ekStore");
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  -[PPEventStorage _loadCalendars](*(void **)(a1 + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateForEventsWithStartDate:endDate:calendars:loadDefaultProperties:", v5, v6, v7, *(unsigned __int8 *)(a1 + 64));
  v8 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

void __32__PPEventStorage_eventsInRange___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__PPEventStorage_eventsInRange___block_invoke_2;
  v3[3] = &unk_1E7E1F5D0;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateEventsInRange:usingBlock:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), v3);

}

void __32__PPEventStorage_eventsInRange___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "startDate");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    objc_msgSend(v6, "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(*(id *)(a1 + 32), "insertObject:atIndex:", v6, objc_msgSend(*(id *)(a1 + 32), "indexOfObject:inSortedRange:options:usingComparator:", v6, 0, objc_msgSend(*(id *)(a1 + 32), "count"), 1024, &__block_literal_global_34_16016));
  }

}

uint64_t __32__PPEventStorage_eventsInRange___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareStartDateWithEvent:");
}

void __38__PPEventStorage_eventWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v3 = (void *)MEMORY[0x1C3BD6630]();
  v4 = (void *)objc_msgSend(v8, "ekStore");
  objc_msgSend(v4, "eventWithIdentifier:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

uint64_t __45__PPEventStorage_runBlockWithPurgerDisabled___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a2 + 40) - 1;
  *(_QWORD *)(a2 + 40) = v2;
  if (!v2)
    return objc_msgSend(*(id *)(a2 + 8), "setPurgingAllowed:", 1);
  return result;
}

uint64_t __45__PPEventStorage_runBlockWithPurgerDisabled___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = v2 + 1;
  if (!v2)
    return objc_msgSend(*(id *)(a2 + 8), "setPurgingAllowed:", 0);
  return result;
}

void __43__PPEventStorage_attemptToPurgeImmediately__block_invoke(uint64_t a1, void *a2)
{
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id *v11;

  v3 = a2;
  if (v3[5])
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    v11 = v3;
    v4 = (void *)MEMORY[0x1C3BD6630]();
    v5 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(v11[1], "acquireCachedEventStoreOrCreate:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "connection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "disconnect");

    }
    objc_autoreleasePoolPop(v5);
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16))();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v11[1];
    v11[1] = (id)v9;

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    objc_autoreleasePoolPop(v4);
    v3 = v11;
  }

}

id __43__PPEventStorage_initWithEventStorePurger___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __22__PPEventStorage_init__block_invoke()
{
  void *v0;

  objc_opt_self();
  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setTimeout:", 0.5);
  objc_msgSend(v0, "setPurgingAllowed:", 1);
  objc_msgSend(v0, "setCreationBlock:", &__block_literal_global_20_16027);
  return v0;
}

id __31__PPEventStorage_ekStorePurger__block_invoke()
{
  void *v0;
  void *v1;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  PPNewEKEventStore();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v0);
  return v1;
}

+ (id)defaultStorage
{
  if (defaultStorage__pasOnceToken6 != -1)
    dispatch_once(&defaultStorage__pasOnceToken6, &__block_literal_global_16030);
  return (id)defaultStorage__pasExprOnceResult;
}

void __32__PPEventStorage_defaultStorage__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_opt_new();
  v2 = (void *)defaultStorage__pasExprOnceResult;
  defaultStorage__pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

@end
