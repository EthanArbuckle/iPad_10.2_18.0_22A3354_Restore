@implementation SBIdleTimerDescriptor

uint64_t __33__SBIdleTimerDescriptor_isEqual___block_invoke(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
}

double __33__SBIdleTimerDescriptor_isEqual___block_invoke_5(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 32);
}

double __33__SBIdleTimerDescriptor_isEqual___block_invoke_4(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 24);
}

double __33__SBIdleTimerDescriptor_isEqual___block_invoke_3(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 40);
}

double __33__SBIdleTimerDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  return *(double *)(*(_QWORD *)(a1 + 32) + 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalAuditChangeEntry, 0);
  objc_storeStrong((id *)&self->_auditEntries, 0);
}

- (int64_t)timerMode
{
  return self->_timerMode;
}

- (SBIdleTimerDescriptor)initWithTimerMode:(int64_t)a3 warnInterval:(double)a4 totalInterval:(double)a5
{
  SBIdleTimerDescriptor *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBIdleTimerDescriptor;
  result = -[SBIdleTimerDescriptor init](&v9, sel_init);
  if (result)
  {
    result->_timerMode = a3;
    result->_sampleInterval = 1.79769313e308;
    result->_warnInterval = a4;
    result->_totalInterval = a5;
  }
  return result;
}

- (double)totalInterval
{
  return self->_totalInterval;
}

- (SBIdleTimerDescriptor)_copyWithoutAuditEntries
{
  SBIdleTimerDescriptor *v2;

  if (!a1)
    return 0;
  v2 = objc_alloc_init(SBIdleTimerDescriptor);
  -[SBIdleTimerDescriptor setTimerMode:](v2, "setTimerMode:", *(_QWORD *)(a1 + 8));
  -[SBIdleTimerDescriptor setWarnInterval:](v2, "setWarnInterval:", *(double *)(a1 + 24));
  -[SBIdleTimerDescriptor setQuickUnwarnInterval:](v2, "setQuickUnwarnInterval:", *(double *)(a1 + 40));
  -[SBIdleTimerDescriptor setSampleInterval:](v2, "setSampleInterval:", *(double *)(a1 + 16));
  -[SBIdleTimerDescriptor setTotalInterval:](v2, "setTotalInterval:", *(double *)(a1 + 32));
  return v2;
}

- (void)setTimerMode:(int64_t)a3
{
  self->_timerMode = a3;
}

- (void)setTotalInterval:(double)a3
{
  self->_totalInterval = a3;
}

- (void)setWarnInterval:(double)a3
{
  self->_warnInterval = a3;
}

- (void)setSampleInterval:(double)a3
{
  self->_sampleInterval = a3;
}

- (void)setQuickUnwarnInterval:(double)a3
{
  self->_quickUnwarnInterval = a3;
}

- (void)addAuditReason:(id)a3
{
  objc_class *v4;
  __CFString *v5;
  __CFString *v6;
  NSMutableArray *v7;
  NSMutableArray *auditEntries;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  char v18;

  v17[3] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB37A0];
  v5 = (__CFString *)a3;
  v6 = (__CFString *)objc_alloc_init(v4);
  CFStringAppendFormatAndArguments(v6, 0, v5, &v18);

  if (!self->_auditEntries)
  {
    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    auditEntries = self->_auditEntries;
    self->_auditEntries = v7;

  }
  v9 = (void *)-[SBIdleTimerDescriptor copy](self, "copy");
  objc_msgSend(v9, "setAuditEntries:", 0);
  -[NSMutableArray lastObject](self->_auditEntries, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqual:", v9);
  v13 = v12;
  v14 = v12 ^ 1u;

  v17[0] = v6;
  v17[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v13 & 1) == 0)
    objc_storeStrong((id *)&self->_finalAuditChangeEntry, v16);
  -[NSMutableArray addObject:](self->_auditEntries, "addObject:", v16);

}

- (void)setAuditEntries:(id)a3
{
  objc_storeStrong((id *)&self->_auditEntries, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  SBIdleTimerDescriptor *v4;
  void *v5;

  v4 = -[SBIdleTimerDescriptor _copyWithoutAuditEntries]((uint64_t)self);
  v5 = (void *)-[NSMutableArray copy](self->_auditEntries, "copy");
  -[SBIdleTimerDescriptor setAuditEntries:](v4, "setAuditEntries:", v5);

  -[SBIdleTimerDescriptor setFinalAuditChangeEntry:](v4, "setFinalAuditChangeEntry:", self->_finalAuditChangeEntry);
  return v4;
}

- (void)setFinalAuditChangeEntry:(id)a3
{
  objc_storeStrong((id *)&self->_finalAuditChangeEntry, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t timerMode;
  uint64_t v8;
  id v9;
  id v10;
  double sampleInterval;
  id v12;
  id v13;
  double quickUnwarnInterval;
  id v15;
  id v16;
  double warnInterval;
  id v18;
  id v19;
  double totalInterval;
  id v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  timerMode = self->_timerMode;
  v8 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __33__SBIdleTimerDescriptor_isEqual___block_invoke;
  v32[3] = &unk_1E8EA3AB0;
  v9 = v6;
  v33 = v9;
  v10 = (id)objc_msgSend(v5, "appendInteger:counterpart:", timerMode, v32);
  sampleInterval = self->_sampleInterval;
  v30[0] = v8;
  v30[1] = 3221225472;
  v30[2] = __33__SBIdleTimerDescriptor_isEqual___block_invoke_2;
  v30[3] = &unk_1E8EA8460;
  v12 = v9;
  v31 = v12;
  v13 = (id)objc_msgSend(v5, "appendDouble:counterpart:", v30, sampleInterval);
  quickUnwarnInterval = self->_quickUnwarnInterval;
  v28[0] = v8;
  v28[1] = 3221225472;
  v28[2] = __33__SBIdleTimerDescriptor_isEqual___block_invoke_3;
  v28[3] = &unk_1E8EA8460;
  v15 = v12;
  v29 = v15;
  v16 = (id)objc_msgSend(v5, "appendDouble:counterpart:", v28, quickUnwarnInterval);
  warnInterval = self->_warnInterval;
  v26[0] = v8;
  v26[1] = 3221225472;
  v26[2] = __33__SBIdleTimerDescriptor_isEqual___block_invoke_4;
  v26[3] = &unk_1E8EA8460;
  v18 = v15;
  v27 = v18;
  v19 = (id)objc_msgSend(v5, "appendDouble:counterpart:", v26, warnInterval);
  totalInterval = self->_totalInterval;
  v24[0] = v8;
  v24[1] = 3221225472;
  v24[2] = __33__SBIdleTimerDescriptor_isEqual___block_invoke_5;
  v24[3] = &unk_1E8EA8460;
  v25 = v18;
  v21 = v18;
  v22 = (id)objc_msgSend(v5, "appendDouble:counterpart:", v24, totalInterval);
  LOBYTE(v18) = objc_msgSend(v5, "isEqual");

  return (char)v18;
}

- (BOOL)shouldWarn
{
  if ((BSFloatIsZero() & 1) != 0)
    return 0;
  else
    return BSFloatEqualToFloat() ^ 1;
}

- (double)warnInterval
{
  return self->_warnInterval;
}

void __54__SBIdleTimerDescriptor_appendDescriptionToFormatter___block_invoke(uint64_t a1)
{
  -[SBIdleTimerDescriptor appendDescriptionSansProemToFormatter:](*(double **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__SBIdleTimerDescriptor_appendDescriptionToFormatter___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  objc_msgSend(v5, "appendProem:block:", self, v6);

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (void)appendDescriptionSansProemToFormatter:(double *)a1
{
  void *v3;
  id v4;

  if (a1)
  {
    v4 = a2;
    objc_msgSend(a1, "timerMode");
    NSStringFromSBFIdleTimerMode();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:withName:", v3, CFSTR("mode"));

    _SBAppendTimeIntervalToFormatter(v4, CFSTR("sample"), a1[2]);
    _SBAppendTimeIntervalToFormatter(v4, CFSTR("quickUnwarn"), a1[5]);
    _SBAppendTimeIntervalToFormatter(v4, CFSTR("warn"), a1[3]);
    _SBAppendTimeIntervalToFormatter(v4, CFSTR("total"), a1[4]);

  }
}

- (BOOL)shouldExpireAfterWarn
{
  if ((BSFloatIsZero() & 1) != 0 || (BSFloatEqualToFloat() & 1) != 0 || (BSFloatIsZero() & 1) != 0)
    return 0;
  else
    return BSFloatEqualToFloat() ^ 1;
}

- (void)auditAllReasons:(uint64_t)a1
{
  void (**v3)(id, void *, void *);
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = *(id *)(a1 + 48);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
          objc_msgSend(v9, "objectAtIndex:", 0, (_QWORD)v12);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectAtIndex:", 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v3[2](v3, v10, v11);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
}

- (void)auditValueChangesOnly:(uint64_t)a1
{
  void (**v3)(id, void *, void *, BOOL);
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    obj = *(id *)(a1 + 48);
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = *(_QWORD *)v16;
      do
      {
        v8 = 0;
        v9 = v6;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
          objc_msgSend(v10, "objectAtIndex:", 1);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectAtIndexedSubscript:", 2);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "BOOLValue");

          if (v12)
          {
            objc_msgSend(v10, "objectAtIndex:", 0);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v3[2](v3, v13, v6, v10 == *(void **)(a1 + 56));

          }
          ++v8;
          v9 = v6;
        }
        while (v5 != v8);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v5);

    }
  }

}

- (void)logAuditReasons:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  SBIdleTimerDescriptor *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint8_t buf[4];
  SBIdleTimerDescriptor *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__SBIdleTimerDescriptor_logAuditReasons___block_invoke;
  v8[3] = &unk_1E8EB5280;
  v5 = v4;
  v9 = v5;
  v10 = self;
  v11 = &v12;
  -[SBIdleTimerDescriptor auditValueChangesOnly:]((uint64_t)self, v8);
  if (!*((_BYTE *)v13 + 24))
  {
    v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[SBIdleTimerDescriptor succinctDescription](self, "succinctDescription");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v17 = self;
      v18 = 2114;
      v19 = v7;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "-> dsc:%p %{public}@ final", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v12, 8);
}

void __41__SBIdleTimerDescriptor_logAuditReasons___block_invoke(_QWORD *a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a1[4];
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (a4)
  {
    if (v10)
    {
      v11 = a1[5];
      v12 = v9;
      objc_msgSend(v8, "succinctDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 134218498;
      v17 = v11;
      v18 = 2114;
      v19 = v13;
      v20 = 2114;
      v21 = v7;
      v14 = "-> dsc:%p %{public}@ reason:%{public}@";
LABEL_6:
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v16, 0x20u);

    }
  }
  else if (v10)
  {
    v15 = a1[5];
    v12 = v9;
    objc_msgSend(v8, "succinctDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 134218498;
    v17 = v15;
    v18 = 2114;
    v19 = v13;
    v20 = 2114;
    v21 = v7;
    v14 = "dsc:%p %{public}@ reason:%{public}@";
    goto LABEL_6;
  }
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;

}

- (id)auditReasonsForStateCapture
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52__SBIdleTimerDescriptor_auditReasonsForStateCapture__block_invoke;
  v9[3] = &unk_1E8EB52A8;
  v4 = v3;
  v10 = v4;
  v11 = &v12;
  -[SBIdleTimerDescriptor auditValueChangesOnly:]((uint64_t)self, v9);
  if (!*((_BYTE *)v13 + 24))
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[SBIdleTimerDescriptor succinctDescription](self, "succinctDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("-> %@ final"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  _Block_object_dispose(&v12, 8);
  return v4;
}

void __52__SBIdleTimerDescriptor_auditReasonsForStateCapture__block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  v7 = *(void **)(a1 + 32);
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = a2;
  objc_msgSend(a3, "succinctDescription");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (a4)
    v12 = CFSTR("-> %@ reason:%@");
  else
    v12 = CFSTR("%@ reason:%@");
  objc_msgSend(v8, "stringWithFormat:", v12, v10, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v13);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_timerMode);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_warnInterval);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_totalInterval);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)succinctDescription
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  SBIdleTimerDescriptor *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __44__SBIdleTimerDescriptor_succinctDescription__block_invoke;
  v10 = &unk_1E8E9E820;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", 0, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __44__SBIdleTimerDescriptor_succinctDescription__block_invoke(uint64_t a1)
{
  -[SBIdleTimerDescriptor appendDescriptionSansProemToFormatter:](*(double **)(a1 + 32), *(void **)(a1 + 40));
}

- (id)succinctDescriptionBuilder
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIdleTimerDescriptor appendDescriptionSansProemToFormatter:]((double *)self, v3);
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBIdleTimerDescriptor descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (double)sampleInterval
{
  return self->_sampleInterval;
}

- (double)quickUnwarnInterval
{
  return self->_quickUnwarnInterval;
}

- (NSMutableArray)auditEntries
{
  return self->_auditEntries;
}

- (NSArray)finalAuditChangeEntry
{
  return self->_finalAuditChangeEntry;
}

@end
