@implementation SSSilentEnrollment

- (SSSilentEnrollment)initWithSilentEnrollmentContext:(id)a3
{
  id v5;
  SSSilentEnrollment *v6;
  SSSilentEnrollment *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SSSilentEnrollment;
  v6 = -[SSRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_context, a3);

  return v7;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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

  v3 = xpc_dictionary_create(0, 0, 0);
  -[SSSilentEnrollment context](self, "context");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accountIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "0", v5);

  -[SSSilentEnrollment context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "headerADSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "1", v7);

  -[SSSilentEnrollment context](self, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "headerGSToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "2", v9);

  -[SSSilentEnrollment context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "headerGuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "3", v11);

  -[SSSilentEnrollment context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "headerMMeClientInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "4", v13);

  -[SSSilentEnrollment context](self, "context");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "headerMMeDeviceId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "5", v15);

  -[SSSilentEnrollment context](self, "context");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "parameters");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "7", v17);

  -[SSSilentEnrollment context](self, "context");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "URLString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  SSXPCDictionarySetObject(v3, "6", v19);

  return v3;
}

- (SSSilentEnrollment)initWithXPCEncoding:(id)a3
{
  id v4;
  void *v5;
  SSSilentEnrollment *v6;
  SSSilentEnrollmentContext *v8;
  SSSilentEnrollmentContext *context;
  SSSilentEnrollmentContext *v10;
  uint64_t v11;
  void *v12;
  SSSilentEnrollmentContext *v13;
  uint64_t v14;
  void *v15;
  SSSilentEnrollmentContext *v16;
  uint64_t v17;
  void *v18;
  SSSilentEnrollmentContext *v19;
  uint64_t v20;
  void *v21;
  SSSilentEnrollmentContext *v22;
  uint64_t v23;
  void *v24;
  SSSilentEnrollmentContext *v25;
  uint64_t v26;
  void *v27;
  SSSilentEnrollmentContext *v28;
  uint64_t v29;
  void *v30;
  SSSilentEnrollmentContext *v31;
  uint64_t v32;

  v4 = a3;
  v5 = v4;
  if (v4 && MEMORY[0x1A85863E4](v4) == MEMORY[0x1E0C812F8])
  {
    v6 = -[SSRequest init](self, "init");
    if (!v6)
      goto LABEL_5;
    v8 = objc_alloc_init(SSSilentEnrollmentContext);
    context = v6->_context;
    v6->_context = v8;

    v10 = v6->_context;
    v11 = objc_opt_class();
    v12 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "0", v11);
    -[SSSilentEnrollmentContext setAccountIdentifier:](v10, "setAccountIdentifier:", v12);

    v13 = v6->_context;
    v14 = objc_opt_class();
    v15 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "1", v14);
    -[SSSilentEnrollmentContext setHeaderADSID:](v13, "setHeaderADSID:", v15);

    v16 = v6->_context;
    v17 = objc_opt_class();
    v18 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "2", v17);
    -[SSSilentEnrollmentContext setHeaderGSToken:](v16, "setHeaderGSToken:", v18);

    v19 = v6->_context;
    v20 = objc_opt_class();
    v21 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "3", v20);
    -[SSSilentEnrollmentContext setHeaderGuid:](v19, "setHeaderGuid:", v21);

    v22 = v6->_context;
    v23 = objc_opt_class();
    v24 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "4", v23);
    -[SSSilentEnrollmentContext setHeaderMMeClientInfo:](v22, "setHeaderMMeClientInfo:", v24);

    v25 = v6->_context;
    v26 = objc_opt_class();
    v27 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "5", v26);
    -[SSSilentEnrollmentContext setHeaderMMeDeviceId:](v25, "setHeaderMMeDeviceId:", v27);

    v28 = v6->_context;
    v29 = objc_opt_class();
    v30 = (void *)SSXPCDictionaryCopyObjectWithClass(v5, "7", v29);
    -[SSSilentEnrollmentContext setParameters:](v28, "setParameters:", v30);

    v31 = v6->_context;
    v32 = objc_opt_class();
    self = (SSSilentEnrollment *)SSXPCDictionaryCopyObjectWithClass(v5, "6", v32);
    -[SSSilentEnrollmentContext setURLString:](v31, "setURLString:", self);
  }
  else
  {
    v6 = 0;
  }

LABEL_5:
  return v6;
}

- (SSSilentEnrollmentContext)context
{
  return (SSSilentEnrollmentContext *)objc_getProperty(self, a2, 96, 1);
}

- (void)setContext:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

@end
