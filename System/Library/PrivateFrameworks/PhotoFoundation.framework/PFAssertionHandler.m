@implementation PFAssertionHandler

- (PFAssertionHandler)init
{
  PFAssertionHandler *v2;
  uint64_t v3;
  PFAssertionPolicyHandler *policy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFAssertionHandler;
  v2 = -[PFAssertionHandler init](&v6, sel_init);
  -[PFAssertionHandler defaultPolicy](v2, "defaultPolicy");
  v3 = objc_claimAutoreleasedReturnValue();
  policy = v2->_policy;
  v2->_policy = (PFAssertionPolicyHandler *)v3;

  return v2;
}

- (id)defaultPolicy
{
  PFAssertionPolicyUnique *v3;
  PFAssertionPolicyLog *v4;
  PFAssertionPolicyDebuggerWarning *v5;
  PFAssertionPolicyDebuggerFatal *v6;
  PFAssertionPolicyCrashReport *v7;
  PFAssertionPolicyAbort *v8;

  if (+[PFAssertionHandler runningUnitTests](PFAssertionHandler, "runningUnitTests"))
  {
    -[PFAssertionHandler defaultTestingPolicy](self, "defaultTestingPolicy");
    v3 = (PFAssertionPolicyUnique *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = objc_alloc_init(PFAssertionPolicyUnique);
    v4 = objc_alloc_init(PFAssertionPolicyLog);
    -[PFAssertionPolicyComposite addPolicy:](v3, "addPolicy:", v4);

    v5 = objc_alloc_init(PFAssertionPolicyDebuggerWarning);
    -[PFAssertionPolicyComposite addPolicy:](v3, "addPolicy:", v5);

    v6 = objc_alloc_init(PFAssertionPolicyDebuggerFatal);
    -[PFAssertionPolicyComposite addPolicy:](v3, "addPolicy:", v6);

    v7 = objc_alloc_init(PFAssertionPolicyCrashReport);
    -[PFAssertionPolicyComposite addPolicy:](v3, "addPolicy:", v7);

    v8 = objc_alloc_init(PFAssertionPolicyAbort);
    -[PFAssertionPolicyComposite addPolicy:](v3, "addPolicy:", v8);

  }
  return v3;
}

- (id)defaultTestingPolicy
{
  PFAssertionPolicyComposite *v2;
  PFAssertionPolicyLog *v3;
  PFAssertionPolicyUnitTest *v4;

  v2 = objc_alloc_init(PFAssertionPolicyComposite);
  v3 = objc_alloc_init(PFAssertionPolicyLog);
  -[PFAssertionPolicyComposite addPolicy:](v2, "addPolicy:", v3);

  v4 = objc_alloc_init(PFAssertionPolicyUnitTest);
  -[PFAssertionPolicyComposite addPolicy:](v2, "addPolicy:", v4);

  return v2;
}

- (void)_install
{
  objc_class *v2;
  objc_method *ClassMethod;
  objc_class *v4;
  objc_method *v5;
  void (*Implementation)(void);

  v2 = (objc_class *)objc_opt_class();
  ClassMethod = class_getClassMethod(v2, sel_currentHandler);
  v4 = (objc_class *)objc_opt_class();
  v5 = class_getClassMethod(v4, sel_currentHandler);
  Implementation = method_getImplementation(v5);
  method_setImplementation(ClassMethod, Implementation);
}

- (id)newAssertionInfoInMethod:(SEL)a3 object:(id)a4 function:(id)a5 file:(id)a6 lineNumber:(int64_t)a7 description:(id)a8 arguments:(char *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  PFAssertionInfo *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;

  v14 = a8;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = objc_alloc_init(PFAssertionInfo);
  -[PFAssertionInfo setSelector:](v18, "setSelector:", a3);
  -[PFAssertionInfo setObjectClass:](v18, "setObjectClass:", objc_opt_class());
  -[PFAssertionInfo setFunctionName:](v18, "setFunctionName:", v16);

  v19 = objc_opt_class() == (_QWORD)v17;
  -[PFAssertionInfo setIsClassMethod:](v18, "setIsClassMethod:", v19);
  -[PFAssertionInfo setFileName:](v18, "setFileName:", v15);

  -[PFAssertionInfo setLineNumber:](v18, "setLineNumber:", a7);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v14, a9);

  -[PFAssertionInfo setMessage:](v18, "setMessage:", v20);
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "subarrayWithRange:", 0, objc_msgSend(v21, "count") - 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFAssertionInfo setBacktrace:](v18, "setBacktrace:", v22);

  return v18;
}

- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6 arguments:(char *)a7
{
  id v8;
  void *v9;

  v8 = -[PFAssertionHandler newAssertionInfoInMethod:object:function:file:lineNumber:description:arguments:](self, "newAssertionInfoInMethod:object:function:file:lineNumber:description:arguments:", 0, 0, a3, a4, a5, a6, a7);
  objc_msgSend(v8, "setIsFatal:", 1);
  -[PFAssertionHandler policy](self, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notifyAssertion:", v8);

  abort();
}

- (void)continueAfterAssertInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6 arguments:(char *)a7
{
  void *v8;
  id v9;

  v9 = -[PFAssertionHandler newAssertionInfoInMethod:object:function:file:lineNumber:description:arguments:](self, "newAssertionInfoInMethod:object:function:file:lineNumber:description:arguments:", 0, 0, a3, a4, a5, a6, a7);
  objc_msgSend(v9, "setIsFatal:", 0);
  -[PFAssertionHandler policy](self, "policy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notifyAssertion:", v9);

}

- (void)handleFailureInMethod:(SEL)a3 object:(id)a4 file:(id)a5 lineNumber:(int64_t)a6 description:(id)a7
{
  id v8;
  void *v9;
  uint64_t v10;

  v8 = -[PFAssertionHandler newAssertionInfoInMethod:object:function:file:lineNumber:description:arguments:](self, "newAssertionInfoInMethod:object:function:file:lineNumber:description:arguments:", a3, a4, 0, a5, a6, a7, &v10, &v10);
  objc_msgSend(v8, "setIsFatal:", 1);
  -[PFAssertionHandler policy](self, "policy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "notifyAssertion:", v8);

  abort();
}

- (void)handleFailureInFunction:(id)a3 file:(id)a4 lineNumber:(int64_t)a5 description:(id)a6
{
  id v7;
  void *v8;
  uint64_t v9;

  v7 = -[PFAssertionHandler newAssertionInfoInMethod:object:function:file:lineNumber:description:arguments:](self, "newAssertionInfoInMethod:object:function:file:lineNumber:description:arguments:", 0, 0, a3, a4, a5, a6, &v9, &v9);
  objc_msgSend(v7, "setIsFatal:", 1);
  -[PFAssertionHandler policy](self, "policy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "notifyAssertion:", v7);

  abort();
}

- (PFAssertionPolicyHandler)policy
{
  return (PFAssertionPolicyHandler *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPolicy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_policy, 0);
}

+ (id)currentHandler
{
  if (currentHandler_onceToken != -1)
    dispatch_once(&currentHandler_onceToken, &__block_literal_global_34);
  return (id)currentHandler_handler;
}

+ (void)install
{
  id v2;

  v2 = (id)objc_msgSend(a1, "currentHandler");
}

+ (BOOL)runningUnitTests
{
  if (PFProcessIsLaunchedToExecuteTests_predicate != -1)
    dispatch_once(&PFProcessIsLaunchedToExecuteTests_predicate, &__block_literal_global_18);
  return PFProcessIsLaunchedToExecuteTests_isLaunchedToExecuteTests;
}

+ (BOOL)runningUnderDebugger
{
  if (runningUnderDebugger_onceToken != -1)
    dispatch_once(&runningUnderDebugger_onceToken, &__block_literal_global_1);
  return runningUnderDebugger_runningUnderDebugger;
}

uint64_t __42__PFAssertionHandler_runningUnderDebugger__block_invoke()
{
  uint64_t result;
  size_t v1;
  _OWORD v2[2];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33[2];
  int v34;
  pid_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v3 = 0u;
  v4 = 0u;
  memset(v2, 0, sizeof(v2));
  LODWORD(v3) = 0;
  *(_QWORD *)v33 = 0xE00000001;
  v34 = 1;
  v35 = getpid();
  v1 = 648;
  result = sysctl(v33, 4u, v2, &v1, 0, 0);
  runningUnderDebugger_runningUnderDebugger = (v3 & 0x800) != 0;
  return result;
}

uint64_t __36__PFAssertionHandler_currentHandler__block_invoke()
{
  PFAssertionHandler *v0;
  void *v1;

  v0 = objc_alloc_init(PFAssertionHandler);
  v1 = (void *)currentHandler_handler;
  currentHandler_handler = (uint64_t)v0;

  return objc_msgSend((id)currentHandler_handler, "_install");
}

@end
