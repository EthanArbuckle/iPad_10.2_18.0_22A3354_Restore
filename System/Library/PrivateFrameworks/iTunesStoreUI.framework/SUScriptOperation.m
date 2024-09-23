@implementation SUScriptOperation

- (SUScriptOperation)initWithOperation:(id)a3 options:(id)a4
{
  SUScriptOperation *v6;
  ISOperation *v7;

  v6 = -[SUScriptOperation init](self, "init");
  if (v6)
  {
    v6->_options = a4;
    v7 = (ISOperation *)a3;
    v6->_wrappedOperation = v7;
    -[ISOperation setScriptOptions:](v7, "setScriptOptions:", v6->_options);
  }
  return v6;
}

- (SUScriptOperation)initWithOperation:(id)a3 callback:(id)a4
{
  SUScriptOperation *v5;

  v5 = -[SUScriptOperation initWithOperation:options:](self, "initWithOperation:options:", a3, 0);
  if (v5)
    v5->_callbackFunction = (WebScriptObject *)a4;
  return v5;
}

- (SUScriptOperation)initWithPostType:(id)a3 options:(id)a4
{
  objc_class *v7;
  id v8;
  SUScriptOperation *v9;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = (objc_class *)objc_msgSend((id)objc_opt_class(), "postOperationClassForType:", a3);
  if (v7)
  {
    v8 = objc_alloc_init(v7);
    v9 = -[SUScriptOperation initWithOperation:options:](self, "initWithOperation:options:", v8, a4);

    return v9;
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v13 &= 2u;
    if (v13)
    {
      v17 = 138412546;
      v18 = objc_opt_class();
      v19 = 2112;
      v20 = a3;
      LODWORD(v16) = 22;
      v14 = _os_log_send_and_compose_impl();
      if (v14)
      {
        v15 = (void *)v14;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v14, 4, &v17, v16);
        free(v15);
        SSFileLog();
      }
    }

    return 0;
  }
}

- (void)dealloc
{
  objc_super v3;

  self->_options = 0;
  self->_wrappedOperation = 0;

  self->_callbackFunction = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptOperation;
  -[SUScriptOperation dealloc](&v3, sel_dealloc);
}

+ (Class)postOperationClassForType:(id)a3
{
  objc_class *v4;

  _os_nospin_lock_lock();
  v4 = (objc_class *)(id)objc_msgSend((id)__OperationClasses, "objectForKey:", a3);
  _os_nospin_lock_unlock();
  return v4;
}

+ (void)registerPostOperationClass:(Class)a3 forType:(id)a4
{
  id v6;

  _os_nospin_lock_lock();
  v6 = (id)__OperationClasses;
  if (!__OperationClasses)
  {
    v6 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    __OperationClasses = (uint64_t)v6;
    if (a3)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(v6, "removeObjectForKey:", a4);
    goto LABEL_6;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v6, "setObject:forKey:", a3, a4);
LABEL_6:
  _os_nospin_lock_unlock();
}

- (void)run
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  ISOperation *wrappedOperation;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int *v18;
  int *v19;
  uint64_t v20;
  ISOperation *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  ISOperation *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v5 &= 2u;
  if (v5)
  {
    v6 = objc_opt_class();
    wrappedOperation = self->_wrappedOperation;
    v22 = 138412546;
    v23 = v6;
    v24 = 2112;
    v25 = wrappedOperation;
    LODWORD(v20) = 22;
    v18 = &v22;
    v8 = _os_log_send_and_compose_impl();
    if (v8)
    {
      v9 = (void *)v8;
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v22, v20);
      free(v9);
      v18 = (int *)v10;
      SSFileLog();
    }
  }
  v21 = 0;
  if (-[SUScriptOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", self->_wrappedOperation, &v21, v18))
  {
    -[SUScriptOperation setSuccess:](self, "setSuccess:", 1);
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v13 &= 2u;
    if (v13)
    {
      v14 = objc_opt_class();
      v22 = 138412546;
      v23 = v14;
      v24 = 2112;
      v25 = v21;
      LODWORD(v20) = 22;
      v19 = &v22;
      v15 = _os_log_send_and_compose_impl();
      if (v15)
      {
        v16 = (void *)v15;
        v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v15, 4, &v22, v20);
        free(v16);
        v19 = (int *)v17;
        SSFileLog();
      }
    }
    -[SUScriptOperation setError:](self, "setError:", v21, v19);
  }
  -[SUScriptOperation performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__sendCompletionCallback, 0, 1);
}

- (void)setScriptOptions:(id)a3
{
  id options;

  -[SUScriptOperation lock](self, "lock");
  options = self->_options;
  if (options != a3)
  {

    self->_options = a3;
  }
  -[SUScriptOperation unlock](self, "unlock");
}

- (id)_scriptOptions
{
  id v3;

  -[SUScriptOperation lock](self, "lock");
  v3 = self->_options;
  -[SUScriptOperation unlock](self, "unlock");
  return v3;
}

- (void)_sendCompletionCallback
{
  id v3;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  char isKindOfClass;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  SUScriptOperation *wrappedOperation;
  uint64_t v20;
  void *v21;
  int v22;
  int v23;
  uint64_t v24;
  void *v25;
  _BYTE *v26;
  uint64_t v27;
  _BYTE v28[18];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = -[SUScriptOperation _scriptOptions](self, "_scriptOptions");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (!self->_callbackFunction)
    {
      v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v5 = objc_msgSend(v4, "shouldLog");
      if (objc_msgSend(v4, "shouldLogToDisk"))
        v6 = v5 | 2;
      else
        v6 = v5;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEBUG))
        v6 &= 2u;
      if (v6)
      {
        *(_DWORD *)v28 = 138412290;
        *(_QWORD *)&v28[4] = objc_opt_class();
        LODWORD(v27) = 12;
        v26 = v28;
        v7 = _os_log_send_and_compose_impl();
        if (v7)
        {
          v8 = (void *)v7;
          v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v7, 4, v28, v27);
          free(v8);
          v26 = (_BYTE *)v9;
          SSFileLog();
        }
      }
      self->_callbackFunction = (WebScriptObject *)(id)objc_msgSend(v3, "safeValueForKey:", CFSTR("completionCallback"), v26);
    }
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v12 = objc_msgSend(v11, "shouldLog");
    if (objc_msgSend(v11, "shouldLogToDisk"))
      v13 = v12 | 2;
    else
      v13 = v12;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v11, "OSLogObject"), OS_LOG_TYPE_DEBUG))
      v13 &= 2u;
    if ((isKindOfClass & 1) != 0)
    {
      if (v13)
      {
        v14 = objc_opt_class();
        v15 = -[SUScriptOperation success](self, "success");
        *(_DWORD *)v28 = 138412546;
        *(_QWORD *)&v28[4] = v14;
        *(_WORD *)&v28[12] = 1024;
        *(_DWORD *)&v28[14] = v15;
        LODWORD(v27) = 18;
        v26 = v28;
        v16 = _os_log_send_and_compose_impl();
        if (v16)
        {
          v17 = (void *)v16;
          v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v16, 4, v28, v27);
          free(v17);
          v26 = (_BYTE *)v18;
          SSFileLog();
        }
      }
      wrappedOperation = (SUScriptOperation *)self->_wrappedOperation;
      if (!wrappedOperation)
        wrappedOperation = self;
      -[ISOperation sendCompletionCallback:](wrappedOperation, "sendCompletionCallback:", self->_callbackFunction, v26);
      return;
    }
    if (!v13)
      return;
    v20 = objc_opt_class();
    *(_DWORD *)v28 = 138412290;
    *(_QWORD *)&v28[4] = v20;
    LODWORD(v27) = 12;
    goto LABEL_34;
  }
  v21 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v22 = objc_msgSend(v21, "shouldLog");
  if (objc_msgSend(v21, "shouldLogToDisk"))
    v23 = v22 | 2;
  else
    v23 = v22;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v21, "OSLogObject"), OS_LOG_TYPE_DEBUG))
    v23 &= 2u;
  if (v23)
  {
    *(_DWORD *)v28 = 138412290;
    *(_QWORD *)&v28[4] = objc_opt_class();
    LODWORD(v27) = 12;
LABEL_34:
    v24 = _os_log_send_and_compose_impl();
    if (v24)
    {
      v25 = (void *)v24;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v24, 4, v28, v27, *(_OWORD *)v28);
      free(v25);
      SSFileLog();
    }
  }
}

@end
