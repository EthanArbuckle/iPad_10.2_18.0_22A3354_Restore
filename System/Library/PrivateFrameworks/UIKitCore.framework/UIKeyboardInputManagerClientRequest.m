@implementation UIKeyboardInputManagerClientRequest

- (UIKeyboardInputManagerClientRequest)initWithInvocation:(id)a3
{
  id v4;
  UIKeyboardInputManagerClientRequest *v5;
  uint64_t v6;
  NSInvocation *invocation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKeyboardInputManagerClientRequest;
  v5 = -[UIKeyboardInputManagerClientRequest init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend((id)objc_opt_class(), "untargetedInvocationWithInvocation:withCompletion:", v4, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    invocation = v5->_invocation;
    v5->_invocation = (NSInvocation *)v6;

    -[NSInvocation retainArguments](v5->_invocation, "retainArguments");
  }

  return v5;
}

- (NSInvocation)invocation
{
  return (NSInvocation *)objc_msgSend((id)objc_opt_class(), "untargetedInvocationWithInvocation:withCompletion:", self->_invocation, 1);
}

+ (id)untargetedInvocationWithInvocation:(id)a3 withCompletion:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t i;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "methodSignature");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSelector:", objc_msgSend(v5, "selector"));
  v8 = (char *)v13 - ((objc_msgSend(v6, "frameLength") + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = objc_msgSend(v6, "numberOfArguments");
  if (v9 >= 3)
  {
    v10 = v9;
    for (i = 2; i != v10; ++i)
    {
      if (!a4
        && !strncmp((const char *)objc_msgSend(objc_retainAutorelease(v6), "getArgumentTypeAtIndex:", i), "@?", 2uLL))
      {
        break;
      }
      objc_msgSend(v5, "getArgument:atIndex:", v8, i);
      objc_msgSend(v7, "setArgument:atIndex:", v8, i);
    }
  }

  return v7;
}

- (unint64_t)errorCount
{
  return self->_errorCount;
}

- (void)setErrorCount:(unint64_t)a3
{
  self->_errorCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocation, 0);
}

@end
