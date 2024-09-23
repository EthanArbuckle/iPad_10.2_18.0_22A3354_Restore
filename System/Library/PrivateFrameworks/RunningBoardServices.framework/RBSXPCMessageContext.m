@implementation RBSXPCMessageContext

+ (id)currentContext
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RBSXPCCurrentContext"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_unset
{
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "threadDictionary");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "objectForKey:", CFSTR("RBSXPCCurrentContext"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 == a1)
      objc_msgSend(v4, "removeObjectForKey:", CFSTR("RBSXPCCurrentContext"));

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_handoffToken, 0);
}

+ (void)runWithoutContext:(id)a3
{
  void *v3;
  void *v4;
  void (**v5)(void);

  v5 = (void (**)(void))a3;
  +[RBSXPCMessageContext currentContext](RBSXPCMessageContext, "currentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    -[RBSXPCMessageContext _unset](v3);
    v5[2]();
    -[RBSXPCMessageContext _set]((uint64_t)v4);
  }
  else
  {
    v5[2]();
  }

}

void __45__RBSXPCMessageContext_handoffToQueue_block___block_invoke(uint64_t a1)
{
  -[RBSXPCMessageContext _set](*(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  -[RBSXPCMessageContext _unset](*(void **)(a1 + 32));
}

- (void)_set
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "threadDictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKey:", CFSTR("RBSXPCCurrentContext"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__set, a1, CFSTR("RBSXPCUtilities.m"), 89, CFSTR("must not have an existing message context"));

    }
    objc_msgSend(v5, "setObject:forKey:", a1, CFSTR("RBSXPCCurrentContext"));

  }
}

+ (void)handoffContextOnQueue:(id)a3 block:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  +[RBSXPCMessageContext currentContext](RBSXPCMessageContext, "currentContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "handoffToQueue:block:", v6, v5);
  else
    dispatch_async(v6, v5);

}

- (void)handoffToQueue:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  RBSXPCMessageContext *v9;
  id v10;
  void *v11;

  v7 = a4;
  v8 = a3;
  +[RBSXPCMessageContext currentContext](RBSXPCMessageContext, "currentContext");
  v9 = (RBSXPCMessageContext *)objc_claimAutoreleasedReturnValue();

  if (v9 != self)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBSXPCUtilities.m"), 77, CFSTR("current context does not match context being handed off"));

  }
  -[RBSXPCMessageContext _unset](self);
  v10 = v7;
  xpc_dictionary_handoff_reply();

}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (_QWORD)_initWithHandoffToken:(_QWORD *)a1
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v4 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)RBSXPCMessageContext;
    v5 = objc_msgSendSuper2(&v9, sel_init);
    a1 = v5;
    if (v5)
    {
      objc_storeStrong((id *)v5 + 1, a2);
      xpc_dictionary_get_remote_connection(v4);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)a1[2];
      a1[2] = v6;

    }
  }

  return a1;
}

@end
