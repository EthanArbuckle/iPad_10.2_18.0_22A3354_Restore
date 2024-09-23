@implementation SUScriptFunction

- (SUScriptFunction)init
{
  SUScriptFunction *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SUScriptFunction;
  v2 = -[SUScriptFunction init](&v4, sel_init);
  if (v2)
    v2->_lock = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
  return v2;
}

- (SUScriptFunction)initWithScriptObject:(id)a3
{
  SUScriptFunction *v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = -[SUScriptFunction init](self, "init");
  if (v4)
  {
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v6 = objc_msgSend(v5, "shouldLog");
        if (objc_msgSend(v5, "shouldLogToDisk"))
          v7 = v6 | 2;
        else
          v7 = v6;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_FAULT))
          v7 &= 2u;
        if (v7)
        {
          v14 = 138543618;
          v15 = objc_opt_class();
          v16 = 2114;
          v17 = objc_opt_class();
          LODWORD(v13) = 22;
          v12 = &v14;
          v8 = _os_log_send_and_compose_impl();
          if (v8)
          {
            v9 = (void *)v8;
            v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v14, v13);
            free(v9);
            v12 = (int *)v10;
            SSFileLog();
          }
        }
        objc_msgSend(MEMORY[0x24BDFA950], "throwException:", CFSTR("Invalid argument"), v12);
        a3 = 0;
      }
    }
    v4->_function = (WebScriptObject *)a3;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUScriptFunction;
  -[SUScriptFunction dealloc](&v3, sel_dealloc);
}

- (BOOL)callWithArguments:(id)a3
{
  return -[SUScriptFunction callWithArguments:completionBlock:](self, "callWithArguments:completionBlock:", a3, 0);
}

- (BOOL)callWithArguments:(id)a3 completionBlock:(id)a4
{
  WebScriptObject *v6;
  id v7;

  v6 = -[SUScriptFunction scriptObject](self, "scriptObject");
  if (v6)
  {
    v7 = -[SUScriptFunction _copyAdjustedArgumentsForArguments:](self, "_copyAdjustedArgumentsForArguments:", a3);
    WebThreadRun();

  }
  return v6 != 0;
}

void __54__SUScriptFunction_callWithArguments_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[6];

  v2 = objc_msgSend(*(id *)(a1 + 32), "callWebScriptMethod:withArguments:", CFSTR("call"), *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __54__SUScriptFunction_callWithArguments_completionBlock___block_invoke_2;
    v4[3] = &unk_24DE7B900;
    v4[4] = v2;
    v4[5] = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], v4);
  }
}

uint64_t __54__SUScriptFunction_callWithArguments_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)callSynchronouslyWithArguments:(id)a3
{
  id result;
  id v6;
  id v7;
  void *v8;

  result = -[SUScriptFunction scriptObject](self, "scriptObject");
  if (result)
  {
    v6 = result;
    if ((WebThreadIsCurrent() & 1) == 0)
      WebThreadLock();
    v7 = -[SUScriptFunction _copyAdjustedArgumentsForArguments:](self, "_copyAdjustedArgumentsForArguments:", a3);
    v8 = (void *)objc_msgSend(v6, "callWebScriptMethod:withArguments:", CFSTR("call"), v7);

    return v8;
  }
  return result;
}

- (void)lock
{
  -[NSLock lock](self->_lock, "lock");
}

- (WebScriptObject)scriptObject
{
  WebScriptObject *v3;

  -[SUScriptFunction lock](self, "lock");
  v3 = self->_function;
  -[SUScriptFunction unlock](self, "unlock");
  return v3;
}

- (void)setScriptObject:(id)a3
{
  WebScriptObject *function;

  -[SUScriptFunction lock](self, "lock");
  function = self->_function;
  if (function != a3)
  {

    self->_function = (WebScriptObject *)a3;
  }
  -[SUScriptFunction unlock](self, "unlock");
}

- (void)setThisObject:(id)a3
{
  -[SUScriptFunction lock](self, "lock");
  self->_thisObject = (SUScriptObject *)a3;
  -[SUScriptFunction unlock](self, "unlock");
}

- (id)thisObject
{
  SUScriptObject *v3;

  -[SUScriptFunction lock](self, "lock");
  v3 = self->_thisObject;
  -[SUScriptFunction unlock](self, "unlock");
  return v3;
}

- (void)unlock
{
  -[NSLock unlock](self->_lock, "unlock");
}

- (id)_copyAdjustedArgumentsForArguments:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = a3;
  v6 = -[SUScriptFunction thisObject](self, "thisObject");
  if (v6)
  {
    v7 = v6;
    if (a3)
      v8 = (id)objc_msgSend(a3, "mutableCopy");
    else
      v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v9 = v8;
    objc_msgSend(v8, "insertObject:atIndex:", v7, 0);

    return v9;
  }
  return v5;
}

@end
