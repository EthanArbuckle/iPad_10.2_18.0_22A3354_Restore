@implementation _UIViewServiceReplyControlTrampoline

- (void)_forwardInvocation:(id)a3 withIncomingReplyDispatchBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  objc_super *v24;
  void *v25;
  _UIViewServiceReplyControlTrampoline *v26;
  objc_super v27;
  id v28;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "methodSignature");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "numberOfArguments"))
  {
    v28 = 0;
LABEL_14:
    v27.receiver = self;
    v24 = &v27;
    goto LABEL_15;
  }
  v25 = v7;
  v9 = 0;
  v10 = *MEMORY[0x1E0C99778];
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v12 = v11;
    v13 = objc_retainAutorelease(v8);
    if (!strncmp((const char *)objc_msgSend(v13, "getArgumentTypeAtIndex:", v9), "@?", 2uLL))
    {
      v11 = v9;
      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_7;
      v14 = (void *)MEMORY[0x1E0C99DA0];
      objc_msgSend(v6, "debugDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "raise:format:", v10, CFSTR("reply awaiting can only be used with methods that only have one block (failing invocation: %@)"), v15);

    }
    v11 = v12;
LABEL_7:
    ++v9;
  }
  while (objc_msgSend(v13, "numberOfArguments") > v9);
  v28 = 0;
  v7 = v25;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_14;
  objc_msgSend(v6, "getArgument:atIndex:", &v28, v11);
  if (!v28)
    goto LABEL_14;
  objc_msgSend(v6, "methodSignature");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = strcmp((const char *)objc_msgSend(v16, "methodReturnType"), "v");

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    objc_msgSend(v6, "debugDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "raise:format:", v10, CFSTR("reply awaiting can't handle invocations with a reply handler which also return a value (failing invocation: %@)"), v19);

  }
  v20 = (void *)objc_msgSend(v28, "copy");
  v21 = v28;
  v28 = v20;

  objc_msgSend(v6, "setArgument:atIndex:", &v28, v11);
  v22 = v28;
  v23 = (void *)objc_msgSend(v25, "copy");
  objc_setAssociatedObject(v22, &_UIViewServiceIncomingReplyHandlerKey, v23, (void *)0x301);

  v26 = self;
  v24 = (objc_super *)&v26;
LABEL_15:
  v24->super_class = (Class)_UIViewServiceReplyControlTrampoline;
  -[objc_super forwardInvocation:](v24, sel_forwardInvocation_, v6);

}

- (void)forwardInvocation:(id)a3
{
  -[_UIViewServiceReplyControlTrampoline _forwardInvocation:withIncomingReplyDispatchBlock:](self, "_forwardInvocation:withIncomingReplyDispatchBlock:", a3, &__block_literal_global_622);
}

@end
