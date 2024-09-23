@implementation SSProtocolCondition

+ (id)newConditionWithDictionary:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  id result;
  id v7;
  int v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(a3, "objectForKey:", CFSTR("condition-key"));
  v5 = 0;
  while ((-[__CFString isEqualToString:](__ConditionClassMapping[v5], "isEqualToString:", v4) & 1) == 0)
  {
    v5 += 2;
    if (v5 == 16)
      goto LABEL_6;
  }
  result = (id)objc_msgSend(objc_alloc(NSClassFromString(&__ConditionClassMapping[v5 + 1]->isa)), "initWithDictionary:", a3);
  if (result)
    return result;
LABEL_6:
  v7 = +[SSLogConfig sharedStoreServicesConfig](SSLogConfig, "sharedStoreServicesConfig");
  if (!v7)
    v7 = +[SSLogConfig sharedConfig](SSLogConfig, "sharedConfig");
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (v9)
  {
    v19 = 138412546;
    v20 = objc_opt_class();
    v21 = 2112;
    v22 = v4;
    LODWORD(v18) = 22;
    result = (id)_os_log_send_and_compose_impl();
    if (!result)
      return result;
    v10 = result;
    v11 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", result, 4, &v19, v18);
    free(v10);
    SSFileLog(v7, CFSTR("%@"), v12, v13, v14, v15, v16, v17, v11);
  }
  return 0;
}

- (SSProtocolCondition)initWithDictionary:(id)a3
{
  SSProtocolCondition *v4;
  void *v5;
  int64_t v6;

  v4 = -[SSProtocolCondition init](self, "init");
  if (v4)
  {
    v5 = (void *)objc_msgSend(a3, "objectForKey:", CFSTR("operator"));
    v6 = 0;
    v4->_operator = 0;
    while (!objc_msgSend(v5, "isEqualToString:", __OperationNames[v6]))
    {
      if (++v6 == 6)
        goto LABEL_7;
    }
    v4->_operator = v6;
LABEL_7:
    v4->_value = (id)objc_msgSend(a3, "objectForKey:", CFSTR("value"));
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSProtocolCondition;
  -[SSProtocolCondition dealloc](&v3, sel_dealloc);
}

- (BOOL)evaluateWithContext:(id)a3
{
  return 0;
}

@end
