@implementation SSVFairPlaySAPContext

- (SSVFairPlaySAPContext)initWithSAPVersion:(int64_t)a3
{
  SSVFairPlaySAPContext *v4;
  SSVFairPlaySAPContext *v5;
  int v6;
  int v7;
  int v8;
  void *v9;
  int v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  int v16;
  int v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v27;
  objc_super v28;
  int v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)SSVFairPlaySAPContext;
  v4 = -[SSVFairPlaySAPContext init](&v28, sel_init);
  v5 = v4;
  if (v4)
  {
    if (SSVFairPlayGetHardwareInfo(&v4->_hardwareInfo.IDLength))
    {
      cp2g1b9ro((uint64_t)&v5->_context, (uint64_t)&v5->_hardwareInfo);
      if (!v6 || (cp2g1b9ro((uint64_t)&v5->_context, (uint64_t)&v5->_hardwareInfo), (v8 = v7) == 0))
      {
        if (v5->_context)
        {
LABEL_29:
          v5->_version = a3;
          return v5;
        }
        v8 = 0;
      }
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v10 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v11 = v10 | 2;
      else
        v11 = v10;
      objc_msgSend(v9, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        v11 &= 2u;
      if (!v11)
        goto LABEL_27;
      v13 = (void *)objc_opt_class();
      v29 = 138543618;
      v30 = v13;
      v31 = 2048;
      v32 = v8;
      v14 = v13;
      LODWORD(v27) = 22;
      v15 = (void *)_os_log_send_and_compose_impl();

    }
    else
    {
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v16 = objc_msgSend(v9, "shouldLog");
      if (objc_msgSend(v9, "shouldLogToDisk"))
        v17 = v16 | 2;
      else
        v17 = v16;
      objc_msgSend(v9, "OSLogObject");
      v12 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        v17 &= 2u;
      if (!v17)
        goto LABEL_27;
      v18 = (void *)objc_opt_class();
      v29 = 138543362;
      v30 = v18;
      v19 = v18;
      LODWORD(v27) = 12;
      v15 = (void *)_os_log_send_and_compose_impl();

    }
    if (!v15)
    {
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v15, 4, &v29, v27);
    v12 = objc_claimAutoreleasedReturnValue();
    free(v15);
    SSFileLog(v9, CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v12);
LABEL_27:

    goto LABEL_28;
  }
  return v5;
}

- (void)dealloc
{
  FPSAPContextOpaque_ *context;
  objc_super v4;

  context = self->_context;
  if (context)
    IPaI1oem5iL((uint64_t)context);
  v4.receiver = self;
  v4.super_class = (Class)SSVFairPlaySAPContext;
  -[SSVFairPlaySAPContext dealloc](&v4, sel_dealloc);
}

- (id)exchangeData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *context;
  uint64_t v9;
  id v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  int v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v28;
  char v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  context = self->_context;
  if (context)
  {
    v31 = 0;
    v30 = 0;
    v29 = -1;
    if (self->_version == 1)
      v9 = 210;
    else
      v9 = 200;
    v10 = objc_retainAutorelease(v6);
    Mib5yocT(v9, (uint64_t)&self->_hardwareInfo, (uint64_t)context, objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), (uint64_t)&v31, (uint64_t)&v30, (uint64_t)&v29);
    if (!v11)
    {
      self->_complete = v29 == 0;
      context = (void *)SSVCreateDataWithFairPlayBytes(v31, v30);
LABEL_21:
      v26 = 0;
      if (!a4)
        goto LABEL_24;
      goto LABEL_22;
    }
    v12 = v11;
    +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
    {
      +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = objc_msgSend(v13, "shouldLog");
    if (objc_msgSend(v13, "shouldLogToDisk"))
      v15 = v14 | 2;
    else
      v15 = v14;
    objc_msgSend(v13, "OSLogObject");
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      v15 &= 2u;
    if (v15)
    {
      v17 = (void *)objc_opt_class();
      v32 = 138412546;
      v33 = v17;
      v34 = 2048;
      v35 = v12;
      v18 = v17;
      LODWORD(v28) = 22;
      v19 = (void *)_os_log_send_and_compose_impl();

      if (!v19)
      {
LABEL_17:

        context = 0;
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, &v32, v28);
      v16 = objc_claimAutoreleasedReturnValue();
      free(v19);
      SSFileLog(v13, CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v16);
    }

    goto LABEL_17;
  }
  SSError((uint64_t)CFSTR("SSErrorDomain"), 122, 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
    goto LABEL_24;
LABEL_22:
  if (!context)
    *a4 = objc_retainAutorelease(v26);
LABEL_24:

  return context;
}

- (id)primingSignatureForData:(id)a3 error:(id *)a4
{
  FPSAPContextOpaque_ *context;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  int v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0;
  v27 = 0;
  context = self->_context;
  v6 = objc_retainAutorelease(a3);
  v7 = objc_msgSend(v6, "bytes");
  v8 = objc_msgSend(v6, "length");

  jfkdDAjba3jd((uint64_t)context, 100, v7, v8, &v28, &v27);
  if (!v9)
  {
    v24 = (void *)SSVCreateDataWithFairPlayBytes(v28, v27);
    if (!a4)
      return v24;
    goto LABEL_16;
  }
  v10 = v9;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = objc_msgSend(v11, "shouldLog");
  if (objc_msgSend(v11, "shouldLogToDisk"))
    v13 = v12 | 2;
  else
    v13 = v12;
  objc_msgSend(v11, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    v13 &= 2u;
  if (v13)
  {
    v15 = (void *)objc_opt_class();
    v29 = 138412546;
    v30 = v15;
    v31 = 2048;
    v32 = v10;
    v16 = v15;
    LODWORD(v26) = 22;
    v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17)
      goto LABEL_13;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v17, 4, &v29, v26);
    v14 = objc_claimAutoreleasedReturnValue();
    free(v17);
    SSFileLog(v11, CFSTR("%@"), v18, v19, v20, v21, v22, v23, (uint64_t)v14);
  }

LABEL_13:
  v24 = 0;
  if (!a4)
    return v24;
LABEL_16:
  if (!v24)
    *a4 = 0;
  return v24;
}

- (id)signData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *context;
  id v9;
  int v10;
  int v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  uint64_t v29;
  unsigned int v30;
  uint64_t v31;
  int v32;
  void *v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  context = self->_context;
  if (context)
  {
    v31 = 0;
    v30 = 0;
    v9 = objc_retainAutorelease(v6);
    Fc3vhtJDvr((uint64_t)context, objc_msgSend(v9, "bytes"), objc_msgSend(v9, "length"), (uint64_t)&v31, (uint64_t)&v30);
    if (v10)
    {
      v11 = v10;
      +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v13 = objc_msgSend(v12, "shouldLog");
      if (objc_msgSend(v12, "shouldLogToDisk"))
        v14 = v13 | 2;
      else
        v14 = v13;
      objc_msgSend(v12, "OSLogObject");
      v15 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        v14 &= 2u;
      if (v14)
      {
        v16 = (void *)objc_opt_class();
        v32 = 138412546;
        v33 = v16;
        v34 = 2048;
        v35 = v11;
        v17 = v16;
        LODWORD(v29) = 22;
        v18 = (void *)_os_log_send_and_compose_impl();

        if (!v18)
        {
LABEL_14:

          if (v11 == -42186)
          {
            v25 = CFSTR("Bad SAP session for signing");
            v26 = 148;
          }
          else
          {
            v25 = CFSTR("Bad SAP signature");
            v26 = 122;
          }
          SSError((uint64_t)CFSTR("SSErrorDomain"), v26, (uint64_t)v25, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          context = 0;
          goto LABEL_20;
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v18, 4, &v32, v29);
        v15 = objc_claimAutoreleasedReturnValue();
        free(v18);
        SSFileLog(v12, CFSTR("%@"), v19, v20, v21, v22, v23, v24, (uint64_t)v15);
      }

      goto LABEL_14;
    }
    context = (void *)SSVCreateDataWithFairPlayBytes(v31, v30);
    v27 = 0;
  }
  else
  {
    SSError((uint64_t)CFSTR("SSErrorDomain"), 122, (uint64_t)CFSTR("No SAP context for signing"), 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_20:
  if (a4 && !context)
    *a4 = objc_retainAutorelease(v27);

  return context;
}

- (BOOL)verifyPrimeSignature:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  BOOL v24;
  uint64_t v26;
  _BYTE v27[24];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (!self->_context)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SSErrorDomain"), 122, 0);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
      goto LABEL_15;
LABEL_17:
    v24 = 0;
    goto LABEL_19;
  }
  v8 = objc_retainAutorelease(v6);
  objc_msgSend(v8, "bytes");
  objc_msgSend(v8, "length");
  gLg1CWr7p();
  if (!v9)
  {
    v23 = 0;
    v24 = 1;
    goto LABEL_19;
  }
  v10 = v9;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = objc_msgSend(v11, "shouldLog");
  if (objc_msgSend(v11, "shouldLogToDisk"))
    v13 = v12 | 2;
  else
    v13 = v12;
  objc_msgSend(v11, "OSLogObject");
  v14 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    v13 &= 2u;
  if (v13)
  {
    *(_DWORD *)v27 = 138412546;
    *(_QWORD *)&v27[4] = objc_opt_class();
    *(_WORD *)&v27[12] = 2048;
    *(_QWORD *)&v27[14] = v10;
    v15 = *(id *)&v27[4];
    LODWORD(v26) = 22;
    v16 = (void *)_os_log_send_and_compose_impl();

    if (!v16)
      goto LABEL_14;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v16, 4, v27, v26, *(_OWORD *)v27, *(_QWORD *)&v27[16], v28);
    v14 = objc_claimAutoreleasedReturnValue();
    free(v16);
    SSFileLog(v11, CFSTR("%@"), v17, v18, v19, v20, v21, v22, (uint64_t)v14);
  }

LABEL_14:
  -[SSVFairPlaySAPContext _teardownSession](self, "_teardownSession");
  v23 = 0;
  if (!a4)
    goto LABEL_17;
LABEL_15:
  v23 = objc_retainAutorelease(v23);
  v24 = 0;
  *a4 = v23;
LABEL_19:

  return v24;
}

- (BOOL)verifySignature:(id)a3 forData:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  int v13;
  void *v14;
  int v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;
  uint64_t v27;
  id v28;
  BOOL v29;
  uint64_t v31;
  _BYTE v32[24];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!self->_context)
  {
    v26 = CFSTR("No SAP context for signature verification");
    goto LABEL_19;
  }
  v10 = objc_retainAutorelease(v8);
  objc_msgSend(v10, "bytes");
  objc_msgSend(v10, "length");
  v11 = objc_retainAutorelease(v9);
  objc_msgSend(v11, "mutableBytes");
  objc_msgSend(v11, "length");
  gLg1CWr7p();
  if (!v12)
  {
    v28 = 0;
    v29 = 1;
    goto LABEL_23;
  }
  v13 = v12;
  +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = objc_msgSend(v14, "shouldLog");
  if (objc_msgSend(v14, "shouldLogToDisk"))
    v16 = v15 | 2;
  else
    v16 = v15;
  objc_msgSend(v14, "OSLogObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    v16 &= 2u;
  if (!v16)
    goto LABEL_13;
  *(_DWORD *)v32 = 138412546;
  *(_QWORD *)&v32[4] = objc_opt_class();
  *(_WORD *)&v32[12] = 2048;
  *(_QWORD *)&v32[14] = v13;
  v18 = *(id *)&v32[4];
  LODWORD(v31) = 22;
  v19 = (void *)_os_log_send_and_compose_impl();

  if (v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v19, 4, v32, v31, *(_OWORD *)v32, *(_QWORD *)&v32[16], v33);
    v17 = objc_claimAutoreleasedReturnValue();
    free(v19);
    SSFileLog(v14, CFSTR("%@"), v20, v21, v22, v23, v24, v25, (uint64_t)v17);
LABEL_13:

  }
  if (v13 == -42186)
  {
    v26 = CFSTR("Bad SAP session for signature verification");
    v27 = 148;
    goto LABEL_20;
  }
  v26 = CFSTR("Bad SAP signature verification");
LABEL_19:
  v27 = 122;
LABEL_20:
  SSError((uint64_t)CFSTR("SSErrorDomain"), v27, (uint64_t)v26, 0);
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (a5)
  {
    v28 = objc_retainAutorelease(v28);
    v29 = 0;
    *a5 = v28;
  }
  else
  {
    v29 = 0;
  }
LABEL_23:

  return v29;
}

- (void)_teardownSession
{
  FPSAPContextOpaque_ *context;

  context = self->_context;
  if (context)
  {
    IPaI1oem5iL((uint64_t)context);
    self->_context = 0;
  }
  self->_complete = 0;
}

- (BOOL)isComplete
{
  return self->_complete;
}

@end
