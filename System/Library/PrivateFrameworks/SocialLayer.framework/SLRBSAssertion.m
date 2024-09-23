@implementation SLRBSAssertion

+ (id)assertionNameForType:(int64_t)a3
{
  if (a3)
    return 0;
  else
    return CFSTR("CollaborationHandshake");
}

+ (id)assertionWithType:(int64_t)a3 pid:(int)a4 error:(id *)a5
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:pid:error:", a3, *(_QWORD *)&a4, a5);
}

- (SLRBSAssertion)initWithType:(int64_t)a3 pid:(int)a4 error:(id *)a5
{
  uint64_t v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  SLRBSAssertion *v15;
  id *p_isa;
  NSObject *v17;
  SLRBSAssertion *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  objc_super v25;
  uint64_t v26;
  const __CFString *v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  void *v36;
  uint64_t v37;
  _QWORD v38[2];

  v6 = *(_QWORD *)&a4;
  v38[1] = *MEMORY[0x1E0C80C00];
  +[SLRBSAssertion assertionNameForType:](SLRBSAssertion, "assertionNameForType:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SLRBSAssertion for pid: %i"), v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87DF8], "targetWithPid:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.sociallayer"), v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc(MEMORY[0x1E0D87C98]);
    v36 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v12, "initWithExplanation:target:attributes:", v9, v10, v13);

    if ((objc_msgSend(v14, "acquireWithError:", a5) & 1) != 0)
    {
      v25.receiver = self;
      v25.super_class = (Class)SLRBSAssertion;
      v15 = -[SLRBSAssertion init](&v25, sel_init);
      if (v15)
      {
        p_isa = (id *)&v15->super.isa;
        SLDaemonLogHandle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          v29 = "-[SLRBSAssertion initWithType:pid:error:]";
          v30 = 2048;
          v31 = v14;
          v32 = 2112;
          v33 = v8;
          v34 = 1024;
          v35 = v6;
          _os_log_impl(&dword_199EFF000, v17, OS_LOG_TYPE_DEFAULT, "%s acquired assertion: <RBSAssertion: %p> name: '%@' for pid: %i", buf, 0x26u);
        }

        objc_storeStrong(p_isa + 1, v14);
        self = p_isa;
        v18 = self;
        goto LABEL_17;
      }
      if (a5)
      {
        v21 = (void *)MEMORY[0x1E0CB35C8];
        v26 = *MEMORY[0x1E0CB2938];
        v27 = CFSTR("SLRBSAssertion init failed");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLRBSAssertion"), 0, v22);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
      SLDaemonLogHandle();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        -[SLRBSAssertion initWithType:pid:error:].cold.1(v23);

      objc_msgSend(v14, "invalidate");
      self = 0;
    }
    else
    {
      SLDaemonLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[SLRBSAssertion initWithType:pid:error:].cold.2((uint64_t *)a5, v6, v20);

    }
    v18 = 0;
LABEL_17:

    goto LABEL_18;
  }
  v19 = (void *)MEMORY[0x1E0CB35C8];
  v37 = *MEMORY[0x1E0CB2938];
  v38[0] = CFSTR("SLRBSAssertion: invalid assertion type");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.sociallayerd.SLRBSAssertion"), 0, v9);
  v18 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

  return v18;
}

- (BOOL)isValid
{
  void *v2;
  char v3;

  -[SLRBSAssertion assertion](self, "assertion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isValid");

  return v3;
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (-[SLRBSAssertion isValid](self, "isValid"))
  {
    SLDaemonLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[SLRBSAssertion assertion](self, "assertion");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 136315394;
      v7 = "-[SLRBSAssertion invalidate]";
      v8 = 2048;
      v9 = v4;
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "%s invalidating assertion: <RBSAssertion: %p>", (uint8_t *)&v6, 0x16u);

    }
    -[SLRBSAssertion assertion](self, "assertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

  }
}

- (void)dealloc
{
  NSObject *v3;
  void *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[SLRBSAssertion isValid](self, "isValid"))
  {
    SLDaemonLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      -[SLRBSAssertion assertion](self, "assertion");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v8 = "-[SLRBSAssertion dealloc]";
      v9 = 2048;
      v10 = v4;
      _os_log_impl(&dword_199EFF000, v3, OS_LOG_TYPE_DEFAULT, "%s invalidating assertion: <RBSAssertion: %p>", buf, 0x16u);

    }
    -[SLRBSAssertion assertion](self, "assertion");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invalidate");

  }
  v6.receiver = self;
  v6.super_class = (Class)SLRBSAssertion;
  -[SLRBSAssertion dealloc](&v6, sel_dealloc);
}

- (RBSAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
}

- (void)initWithType:(os_log_t)log pid:error:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "-[SLRBSAssertion initWithType:pid:error:]";
  _os_log_error_impl(&dword_199EFF000, log, OS_LOG_TYPE_ERROR, "%s initialization failed, but we acquired the assertion. Invalidating it and returning nil", (uint8_t *)&v1, 0xCu);
}

- (void)initWithType:(uint64_t *)a1 pid:(int)a2 error:(os_log_t)log .cold.2(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 136315650;
  v5 = "-[SLRBSAssertion initWithType:pid:error:]";
  v6 = 1024;
  v7 = a2;
  v8 = 2112;
  v9 = v3;
  _os_log_error_impl(&dword_199EFF000, log, OS_LOG_TYPE_ERROR, "%s Unable to acquire assertion for pid: %i error: %@", (uint8_t *)&v4, 0x1Cu);
}

@end
