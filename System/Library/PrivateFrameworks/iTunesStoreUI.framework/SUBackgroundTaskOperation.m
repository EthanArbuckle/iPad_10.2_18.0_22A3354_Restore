@implementation SUBackgroundTaskOperation

- (SUBackgroundTaskOperation)initWithOperation:(id)a3 identifier:(id)a4
{
  SUBackgroundTaskOperation *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUBackgroundTaskOperation;
  v6 = -[SUBackgroundTaskOperation init](&v8, sel_init);
  if (v6)
  {
    v6->_operation = (ISOperation *)a3;
    v6->_permissionIdentifier = (NSString *)a4;
    v6->_taskIdentifier = *MEMORY[0x24BDF7608];
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUBackgroundTaskOperation;
  -[SUBackgroundTaskOperation dealloc](&v3, sel_dealloc);
}

- (ISOperation)operation
{
  return self->_operation;
}

- (NSString)permissionIdentifier
{
  return self->_permissionIdentifier;
}

- (void)run
{
  uint64_t v3;

  objc_msgSend((id)-[SUBackgroundTaskOperation blockingMainThreadProxy](self, "blockingMainThreadProxy"), "_takeBackgroundAssertion");
  v3 = 0;
  -[SUBackgroundTaskOperation setSuccess:](self, "setSuccess:", -[SUBackgroundTaskOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", self->_operation, &v3));
  -[SUBackgroundTaskOperation setError:](self, "setError:", v3);
  objc_msgSend((id)-[SUBackgroundTaskOperation blockingMainThreadProxy](self, "blockingMainThreadProxy"), "_removeBackgroundAssertion");
}

- (void)_cancelBackgroundAssertion
{
  -[SUBackgroundTaskOperation cancel](self, "cancel");
  -[SUBackgroundTaskOperation _removeBackgroundAssertion](self, "_removeBackgroundAssertion");
}

- (void)_removeBackgroundAssertion
{
  unint64_t v2;
  void *v4;
  int v5;
  int v6;
  uint64_t v7;
  NSString *permissionIdentifier;
  ISOperation *operation;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  ISOperation *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDF7608];
  if (self->_taskIdentifier != *MEMORY[0x24BDF7608])
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v5 = objc_msgSend(v4, "shouldLog");
    if (objc_msgSend(v4, "shouldLogToDisk"))
      v6 = v5 | 2;
    else
      v6 = v5;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v4, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
      v6 &= 2u;
    if (v6)
    {
      v7 = objc_opt_class();
      permissionIdentifier = self->_permissionIdentifier;
      operation = self->_operation;
      v15 = 138412802;
      v16 = v7;
      v17 = 2112;
      v18 = permissionIdentifier;
      v19 = 2112;
      v20 = operation;
      LODWORD(v14) = 32;
      v13 = &v15;
      v10 = _os_log_send_and_compose_impl();
      if (v10)
      {
        v11 = (void *)v10;
        v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v15, v14);
        free(v11);
        v13 = (int *)v12;
        SSFileLog();
      }
    }
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", v13), "endBackgroundTask:", self->_taskIdentifier);
    self->_taskIdentifier = v2;
  }
}

- (void)_takeBackgroundAssertion
{
  void *v3;
  int v4;
  int v5;
  uint64_t v6;
  NSString *permissionIdentifier;
  ISOperation *operation;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int *v13;
  uint64_t v14;
  _QWORD v15[5];
  int v16;
  uint64_t v17;
  __int16 v18;
  NSString *v19;
  __int16 v20;
  ISOperation *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v4 = objc_msgSend(v3, "shouldLog");
  if (objc_msgSend(v3, "shouldLogToDisk"))
    v5 = v4 | 2;
  else
    v5 = v4;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v3, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v5 &= 2u;
  if (v5)
  {
    v6 = objc_opt_class();
    permissionIdentifier = self->_permissionIdentifier;
    operation = self->_operation;
    v16 = 138412802;
    v17 = v6;
    v18 = 2112;
    v19 = permissionIdentifier;
    v20 = 2112;
    v21 = operation;
    LODWORD(v14) = 32;
    v13 = &v16;
    v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v9, 4, &v16, v14);
      free(v10);
      v13 = (int *)v11;
      SSFileLog();
    }
  }
  v12 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication", v13);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __53__SUBackgroundTaskOperation__takeBackgroundAssertion__block_invoke;
  v15[3] = &unk_24DE7AF90;
  v15[4] = self;
  self->_taskIdentifier = objc_msgSend(v12, "beginBackgroundTaskWithExpirationHandler:", v15);
}

uint64_t __53__SUBackgroundTaskOperation__takeBackgroundAssertion__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelBackgroundAssertion");
}

@end
