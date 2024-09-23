@implementation PLActivity

- (void)didChangeCriterion:(id)a3
{
  id v4;
  PLActivity *v5;
  _BOOL4 v6;
  NSObject *v7;
  PLActivity *v8;
  uint64_t v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = -[PLActivity enabled](v5, "enabled");
  objc_sync_exit(v5);

  if (v6)
  {
    PLLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[PLActivity didChangeCriterion:].cold.1(v4, v5, v7);

    if (-[PLActivity state](v5, "state") || !objc_msgSend(v4, "satisfied"))
    {
      if (-[PLActivity state](v5, "state") == 1 && (objc_msgSend(v4, "satisfied") & 1) == 0)
      {
        -[PLActivity setState:](v5, "setState:", 3);
        -[PLActivity interruptActivity](v5, "interruptActivity");
      }
    }
    else
    {
      if (-[PLActivity mustRunCriterionSatisfied](v5, "mustRunCriterionSatisfied"))
      {
        v8 = v5;
        v9 = 2;
LABEL_13:
        -[PLActivity setState:](v8, "setState:", v9);
        -[PLActivity runActivity](v5, "runActivity");
        goto LABEL_14;
      }
      if (-[PLActivity allCriteriaSatisfied](v5, "allCriteriaSatisfied"))
      {
        v8 = v5;
        v9 = 1;
        goto LABEL_13;
      }
    }
  }
LABEL_14:

}

- (int64_t)state
{
  PLActivity *v2;
  int64_t state;

  v2 = self;
  objc_sync_enter(v2);
  state = v2->_state;
  objc_sync_exit(v2);

  return state;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (NSDate)lastCompletedDate
{
  return (NSDate *)objc_getProperty(self, a2, 80, 1);
}

void __34__PLActivity_allCriteriaSatisfied__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;

  v5 = a2;
  PLLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __34__PLActivity_allCriteriaSatisfied__block_invoke_cold_1(v5, v6);

  if ((objc_msgSend(v5, "satisfied") & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }

}

uint64_t __25__PLActivity_runActivity__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  _QWORD v16[5];

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __25__PLActivity_runActivity__block_invoke_cold_4();

  objc_msgSend(*(id *)(a1 + 32), "activityBlock");
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastCompletedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *, void *))v4)[2](v4, v5, v6);

  PLLogCommon();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    __25__PLActivity_runActivity__block_invoke_cold_3();

  objc_autoreleasePoolPop(v2);
  if (objc_msgSend(*(id *)(a1 + 32), "state") == 3)
  {
    PLLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __25__PLActivity_runActivity__block_invoke_cold_1();

    v9 = *(void **)(a1 + 32);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __25__PLActivity_runActivity__block_invoke_15;
    v16[3] = &unk_1E6A557B8;
    v16[4] = v9;
    objc_msgSend(v9, "enumerateCriteriaWithBlock:", v16);
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "state") == 1 || objc_msgSend(*(id *)(a1 + 32), "state") == 2)
  {
    PLLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __25__PLActivity_runActivity__block_invoke_cold_2();

    objc_msgSend(*(id *)(a1 + 32), "setState:", 4);
    objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastCompletedDate:", v11);

    v12 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __25__PLActivity_runActivity__block_invoke_16;
    v15[3] = &unk_1E6A557B8;
    v15[4] = v12;
    objc_msgSend(v12, "enumerateCriteriaWithBlock:", v15);
    objc_msgSend(*(id *)(a1 + 32), "mustRunCriterion");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "didCompleteActivity:", *(_QWORD *)(a1 + 32));

  }
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 0);
}

- (void)setState:(int64_t)a3
{
  int64_t state;
  void *v5;
  PLActivity *obj;

  obj = self;
  objc_sync_enter(obj);
  state = obj->_state;
  if (state == a3 || a3 && state == -1)
    goto LABEL_4;
  if (state == 2)
  {
    if ((a3 | 4) == 4)
      goto LABEL_15;
    goto LABEL_4;
  }
  if (state == 1)
  {
    if ((unint64_t)a3 > 4 || ((1 << a3) & 0x19) == 0)
      goto LABEL_4;
    goto LABEL_15;
  }
  if (state)
  {
    if (a3 && state == 3)
      goto LABEL_4;
    if (state != 3)
    {
LABEL_21:
      if (a3 && state == 4)
        goto LABEL_4;
      goto LABEL_15;
    }
    -[PLActivity interruptBlock](obj, "interruptBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      state = obj->_state;
      goto LABEL_21;
    }
LABEL_4:
    objc_sync_exit(obj);

    return;
  }
  if ((unint64_t)(a3 + 1) > 3 || !a3)
    goto LABEL_4;
LABEL_15:
  obj->_state = a3;
  objc_sync_exit(obj);

  -[PLActivity logEntry](obj, "logEntry");
}

- (void)setLastCompletedDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)runActivity
{
  NSObject *v3;
  _QWORD block[5];

  -[PLActivity queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__PLActivity_runActivity__block_invoke;
  block[3] = &unk_1E6A52050;
  block[4] = self;
  dispatch_async(v3, block);

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (PLActivityCriterion)mustRunCriterion
{
  return (PLActivityCriterion *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)mustRunCriterionSatisfied
{
  void *v3;
  void *v4;
  char v5;

  -[PLActivity mustRunCriterion](self, "mustRunCriterion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLActivity mustRunCriterion](self, "mustRunCriterion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "satisfied");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)logEntry
{
  PLEntry *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PLEntry *v13;

  v3 = [PLEntry alloc];
  objc_msgSend((id)objc_opt_class(), "activityStatesEntryKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[PLEntry initWithEntryKey:](v3, "initWithEntryKey:", v4);

  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[PLActivity activityEntry](self, "activityEntry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithLongLong:", objc_msgSend(v6, "entryID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntry setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v7, CFSTR("ActivityID"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PLActivity state](self, "state"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLEntry setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v8, CFSTR("State"));

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "storage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "blockingWriteEntry:withCompletionBlock:", v13, &__block_literal_global_17);

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "storage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "flushCachesWithReason:", CFSTR("ActivityStatesEntry"));

}

- (void)enumerateCriteriaWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, char *))a3;
  if (v4)
  {
    -[PLActivity criteria](self, "criteria");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v5);
    v14 = 0;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[PLActivity criteria](self, "criteria", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v11;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
        if (v14)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

    objc_sync_exit(v5);
  }

}

- (NSArray)criteria
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)allCriteriaSatisfied
{
  NSObject *v3;
  NSObject *v4;
  char v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    -[PLActivity allCriteriaSatisfied].cold.2();

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 1;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__PLActivity_allCriteriaSatisfied__block_invoke;
  v7[3] = &unk_1E6A557E0;
  v7[4] = &v8;
  -[PLActivity enumerateCriteriaWithBlock:](self, "enumerateCriteriaWithBlock:", v7);
  PLLogCommon();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[PLActivity allCriteriaSatisfied].cold.1();

  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (PLEntry)activityEntry
{
  return (PLEntry *)objc_getProperty(self, a2, 72, 1);
}

- (id)activityBlock
{
  return objc_getProperty(self, a2, 40, 1);
}

+ (id)activityStatesEntryKey
{
  return +[PLOperator entryKeyForType:andName:](PLStorageOperator, "entryKeyForType:andName:", CFSTR("EventForward"), CFSTR("ActivityStates"));
}

- (PLActivity)initWithIdentifier:(id)a3 withCriteria:(id)a4 withMustRunCriterion:(id)a5 withQueue:(id)a6 withInterruptBlock:(id)a7 withActivityBlock:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  PLActivity *v19;
  uint64_t v20;
  PLActivity *v21;
  PLActivity *v22;
  uint64_t v23;
  id activityBlock;
  uint64_t v25;
  id interruptBlock;
  id v28;
  id v29;
  objc_super v30;

  v15 = a3;
  v16 = a4;
  v28 = a5;
  v17 = a6;
  v29 = a7;
  v18 = a8;
  v19 = 0;
  if (v15)
  {
    if (v16)
    {
      v20 = objc_msgSend(v16, "count", v28);
      v19 = 0;
      if (v18)
      {
        if (v17 && v20)
        {
          v30.receiver = self;
          v30.super_class = (Class)PLActivity;
          v21 = -[PLActivity init](&v30, sel_init);
          v22 = v21;
          if (v21)
          {
            objc_storeStrong((id *)&v21->_identifier, a3);
            objc_storeStrong((id *)&v22->_criteria, a4);
            objc_storeStrong((id *)&v22->_mustRunCriterion, a5);
            objc_storeStrong((id *)&v22->_queue, a6);
            v23 = objc_msgSend(v18, "copy");
            activityBlock = v22->_activityBlock;
            v22->_activityBlock = (id)v23;

            v25 = objc_msgSend(v29, "copy");
            interruptBlock = v22->_interruptBlock;
            v22->_interruptBlock = (id)v25;

            v22->_state = -1;
            v22->_enabled = 0;
            -[PLActivity syncWithDB](v22, "syncWithDB");
          }
          self = v22;
          v19 = self;
        }
      }
    }
  }

  return v19;
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  PLActivity *obj;

  v3 = a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_enabled == v3)
  {
    objc_sync_exit(obj);

  }
  else
  {
    obj->_enabled = v3;
    objc_sync_exit(obj);

    if (v3)
      -[PLActivity enable](obj, "enable");
    else
      -[PLActivity disable](obj, "disable");
  }
}

+ (id)workQueue
{
  return +[PLUtilities workQueueForClass:](PLUtilities, "workQueueForClass:", objc_opt_class());
}

+ (id)activityEntryKey
{
  return +[PLOperator entryKeyForType:andName:](PLStorageOperator, "entryKeyForType:andName:", CFSTR("EventNone"), CFSTR("Activity"));
}

- (void)syncWithDB
{
  OUTLINED_FUNCTION_0_0(&dword_1B6AB6000, a2, a3, "PLActivity::syncWithDB: _activityEntry=%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __24__PLActivity_syncWithDB__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "activityEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v2, CFSTR("Criteria"));

  objc_msgSend(*(id *)(a1 + 32), "mustRunCriterionString");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activityEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, CFSTR("MustRunCriterion"));

}

- (void)enable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLActivity::enable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

uint64_t __20__PLActivity_enable__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didEnableActivity:", *(_QWORD *)(a1 + 32));
}

- (void)disable
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLActivity::disable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

uint64_t __21__PLActivity_disable__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didDisableActivity:", *(_QWORD *)(a1 + 32));
}

uint64_t __25__PLActivity_runActivity__block_invoke_15(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didInterruptActivity:", *(_QWORD *)(a1 + 32));
}

uint64_t __25__PLActivity_runActivity__block_invoke_16(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didCompleteActivity:", *(_QWORD *)(a1 + 32));
}

- (void)interruptActivity
{
  uint64_t v3;
  void *v4;
  int64_t v5;
  NSObject *v6;
  _QWORD block[5];

  -[PLActivity interruptBlock](self, "interruptBlock");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    v5 = -[PLActivity state](self, "state");

    if (v5 == 3)
    {
      dispatch_get_global_queue(2, 0);
      v6 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __31__PLActivity_interruptActivity__block_invoke;
      block[3] = &unk_1E6A52050;
      block[4] = self;
      dispatch_async(v6, block);

    }
  }
}

void __31__PLActivity_interruptActivity__block_invoke(uint64_t a1)
{
  void *v1;
  void (**v2)(id, void *);

  objc_msgSend(*(id *)(a1 + 32), "interruptBlock");
  v2 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2[2](v2, v1);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLActivity criteriaString](self, "criteriaString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLActivity mustRunCriterionString](self, "mustRunCriterionString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{%@, %@}"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (id)criteriaString
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__15;
  v12 = __Block_byref_object_dispose__15;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__PLActivity_criteriaString__block_invoke;
  v7[3] = &unk_1E6A557E0;
  v7[4] = &v8;
  -[PLActivity enumerateCriteriaWithBlock:](self, "enumerateCriteriaWithBlock:", v7);
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)v9[5], "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v8, 8);
  return v5;
}

void __28__PLActivity_criteriaString__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "description");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

- (id)mustRunCriterionString
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[PLActivity mustRunCriterion](self, "mustRunCriterion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLActivity mustRunCriterion](self, "mustRunCriterion");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = &stru_1E6A56538;
  }

  return v5;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setActivityBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (id)interruptBlock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setInterruptBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (void)setCriteria:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setMustRunCriterion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setActivityEntry:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastCompletedDate, 0);
  objc_storeStrong((id *)&self->_activityEntry, 0);
  objc_storeStrong((id *)&self->_mustRunCriterion, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong(&self->_interruptBlock, 0);
  objc_storeStrong(&self->_activityBlock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)didChangeCriterion:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  int v4;
  id v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = 138412802;
  v5 = a1;
  v6 = 2048;
  v7 = objc_msgSend(a2, "state");
  v8 = 1024;
  v9 = objc_msgSend(v5, "satisfied");
  _os_log_debug_impl(&dword_1B6AB6000, a3, OS_LOG_TYPE_DEBUG, "PLActivity::didChangeCriterion:%@, state=%lu, satisfied=%i", (uint8_t *)&v4, 0x1Cu);
}

void __25__PLActivity_runActivity__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLActivity::runActivity: activity block interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __25__PLActivity_runActivity__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLActivity::runActivity: activity block completed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __25__PLActivity_runActivity__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLActivity::runActivity: activity block end", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __25__PLActivity_runActivity__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLActivity::runActivity: activity block begin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)allCriteriaSatisfied
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_1B6AB6000, v0, v1, "PLActivity::allCriteriaSatisfied: begin", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __34__PLActivity_allCriteriaSatisfied__block_invoke_cold_1(void *a1, NSObject *a2)
{
  int v3;
  void *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = objc_msgSend(a1, "satisfied");
  _os_log_debug_impl(&dword_1B6AB6000, a2, OS_LOG_TYPE_DEBUG, "PLActivity::allCriteriaSatisfied criterion=%@, satisfied=%i", (uint8_t *)&v3, 0x12u);
}

@end
