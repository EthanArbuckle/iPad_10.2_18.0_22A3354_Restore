@implementation _PSFTZKWTrialWrapper

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38___PSFTZKWTrialWrapper_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance__pasOnceToken6 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6, block);
  return (id)sharedInstance__pasExprOnceResult_0;
}

+ (void)runWithData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runWithData:", v4);

}

+ (void)runIfUpdated:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "runIfUpdated:", v4);

}

- (_PSFTZKWTrialWrapper)init
{
  _PSFTZKWTrialWrapper *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  TRIClient *triClient;
  id v8;
  void *v9;
  uint64_t v10;
  _PASLock *lock;
  id v12;
  void *v13;
  uint64_t v14;
  _PASLock *updateLock;
  TRIClient *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  objc_super v21;
  id location[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;

  v21.receiver = self;
  v21.super_class = (Class)_PSFTZKWTrialWrapper;
  v2 = -[_PSFTZKWTrialWrapper init](&v21, sel_init);
  if (v2)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x2050000000;
    v3 = (void *)getTRIClientClass_softClass_1;
    v26 = getTRIClientClass_softClass_1;
    v4 = MEMORY[0x1E0C809B0];
    if (!getTRIClientClass_softClass_1)
    {
      location[0] = (id)MEMORY[0x1E0C809B0];
      location[1] = (id)3221225472;
      location[2] = __getTRIClientClass_block_invoke_1;
      location[3] = &unk_1E43FEA00;
      location[4] = &v23;
      __getTRIClientClass_block_invoke_1((uint64_t)location);
      v3 = (void *)v24[3];
    }
    v5 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v23, 8);
    objc_msgSend(v5, "clientWithIdentifier:", 210);
    v6 = objc_claimAutoreleasedReturnValue();
    triClient = v2->_triClient;
    v2->_triClient = (TRIClient *)v6;

    v8 = objc_alloc(MEMORY[0x1E0D815F0]);
    v9 = (void *)objc_opt_new();
    v10 = objc_msgSend(v8, "initWithGuardedData:", v9);
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v10;

    v12 = objc_alloc(MEMORY[0x1E0D815F0]);
    v13 = (void *)objc_opt_new();
    v14 = objc_msgSend(v12, "initWithGuardedData:", v13);
    updateLock = v2->_updateLock;
    v2->_updateLock = (_PASLock *)v14;

    -[_PSFTZKWTrialWrapper loadFactors](v2, "loadFactors");
    -[_PSFTZKWTrialWrapper flagAsSame](v2, "flagAsSame");
    objc_initWeak(location, v2);
    v16 = v2->_triClient;
    v19[0] = v4;
    v19[1] = 3221225472;
    v19[2] = __28___PSFTZKWTrialWrapper_init__block_invoke;
    v19[3] = &unk_1E43FEE38;
    objc_copyWeak(&v20, location);
    v17 = (id)-[TRIClient addUpdateHandlerForNamespaceName:usingBlock:](v16, "addUpdateHandlerForNamespaceName:usingBlock:", CFSTR("COREML_SYSTEMS_FACETIME_CONTACT_PREDICTION"), v19);
    objc_destroyWeak(&v20);
    objc_destroyWeak(location);
  }
  return v2;
}

- (void)refresh
{
  -[TRIClient refresh](self->_triClient, "refresh");
  -[_PSFTZKWTrialWrapper loadFactors](self, "loadFactors");
}

- (void)flagAsUpdated
{
  -[_PASLock runWithLockAcquired:](self->_updateLock, "runWithLockAcquired:", &__block_literal_global_36);
}

- (void)flagAsSame
{
  -[_PASLock runWithLockAcquired:](self->_updateLock, "runWithLockAcquired:", &__block_literal_global_123);
}

- (BOOL)loadLevelAsBooleanFromFactor:(id)a3 withDefault:(BOOL)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v4 = a4;
  v6 = a3;
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", v6, CFSTR("COREML_SYSTEMS_FACETIME_CONTACT_PREDICTION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    LOBYTE(v4) = objc_msgSend(v7, "BOOLeanValue");
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_PSFTZKWTrialWrapper loadLevelAsBooleanFromFactor:withDefault:].cold.1((uint64_t)v6, v4, v9);

  }
  return v4;
}

- (int64_t)loadLevelAsConfidenceCategoryFromFactor:(id)a3 withDefault:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", v6, CFSTR("COREML_SYSTEMS_FACETIME_CONTACT_PREDICTION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "longValue") & 0x8000000000000000) == 0 && objc_msgSend(v8, "longValue") < 5)
    {
      a4 = objc_msgSend(v8, "longValue");
      goto LABEL_9;
    }
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_PSFTZKWTrialWrapper loadLevelAsConfidenceCategoryFromFactor:withDefault:].cold.2();
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_PSFTZKWTrialWrapper loadLevelAsConfidenceCategoryFromFactor:withDefault:].cold.1();
  }

LABEL_9:
  return a4;
}

- (int64_t)loadLevelAsInteractionModelTypeFromFactor:(id)a3 withDefault:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  -[TRIClient levelForFactor:withNamespaceName:](self->_triClient, "levelForFactor:withNamespaceName:", v6, CFSTR("COREML_SYSTEMS_FACETIME_CONTACT_PREDICTION"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if ((objc_msgSend(v7, "longValue") & 0x8000000000000000) == 0 && objc_msgSend(v8, "longValue") < 3)
    {
      a4 = objc_msgSend(v8, "longValue");
      goto LABEL_9;
    }
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_PSFTZKWTrialWrapper loadLevelAsInteractionModelTypeFromFactor:withDefault:].cold.2();
  }
  else
  {
    +[_PSLogging generalChannel](_PSLogging, "generalChannel");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_PSFTZKWTrialWrapper loadLevelAsConfidenceCategoryFromFactor:withDefault:].cold.1();
  }

LABEL_9:
  return a4;
}

- (void)loadFactors
{
  NSObject *v3;
  _PASLock *lock;
  NSObject *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v3, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: (Re)-Loading Trial factors.", buf, 2u);
  }

  lock = self->_lock;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __35___PSFTZKWTrialWrapper_loadFactors__block_invoke;
  v6[3] = &unk_1E43FEE88;
  v6[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v6);
  +[_PSLogging generalChannel](_PSLogging, "generalChannel");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A07F4000, v5, OS_LOG_TYPE_DEFAULT, "_PSFTZKWTrialWrapper: Finished (re)-loading Trial factors.", buf, 2u);
  }

}

- (void)runWithData:(id)a3
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
  v7[2] = __36___PSFTZKWTrialWrapper_runWithData___block_invoke;
  v7[3] = &unk_1E4401B20;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (void)runIfUpdated:(id)a3
{
  id v4;
  _PASLock *updateLock;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  updateLock = self->_updateLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37___PSFTZKWTrialWrapper_runIfUpdated___block_invoke;
  v7[3] = &unk_1E4401B48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](updateLock, "runWithLockAcquired:", v7);

}

- (TRIClient)triClient
{
  return self->_triClient;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triClient, 0);
  objc_storeStrong((id *)&self->_updateLock, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

- (void)loadLevelAsBooleanFromFactor:(NSObject *)a3 withDefault:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  const __CFString *v3;
  _BYTE v4[24];

  v3 = CFSTR("YES");
  if ((a2 & 1) == 0)
    v3 = CFSTR("NO");
  *(_DWORD *)v4 = 138412546;
  *(_QWORD *)&v4[4] = a1;
  *(_WORD *)&v4[12] = 2112;
  *(_QWORD *)&v4[14] = v3;
  OUTLINED_FUNCTION_4(&dword_1A07F4000, a2, a3, "_PSFTZKWTrialWrapper: TRILevel is nil for %@. Using default of %@", *(_QWORD *)v4, *(_QWORD *)&v4[8], *(_QWORD *)&v4[16]);
  OUTLINED_FUNCTION_1();
}

- (void)loadLevelAsConfidenceCategoryFromFactor:withDefault:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4(&dword_1A07F4000, v0, v1, "_PSFTZKWTrialWrapper: TRILevel is nil for %@. Using default of %ld");
  OUTLINED_FUNCTION_1();
}

- (void)loadLevelAsConfidenceCategoryFromFactor:withDefault:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4(&dword_1A07F4000, v0, v1, "_PSFTZKWTrialWrapper: TRILevel is out-of-range for ATXProactiveSuggestionConfidenceCategory: %@. Using default of %ld");
  OUTLINED_FUNCTION_1();
}

- (void)loadLevelAsInteractionModelTypeFromFactor:withDefault:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_4(&dword_1A07F4000, v0, v1, "_PSFTZKWTrialWrapper: TRILevel is out-of-range for _PSInteractionModelType: %@. Using default of %ld");
  OUTLINED_FUNCTION_1();
}

@end
