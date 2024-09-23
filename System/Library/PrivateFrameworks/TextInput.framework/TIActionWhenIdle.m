@implementation TIActionWhenIdle

+ (id)actionWhenIdleWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTarget:selector:object:", v9, a4, v8);

  return v10;
}

- (TIActionWhenIdle)initWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  TIActionWhenIdle *v14;
  void *v15;
  id v17;

  v8 = a3;
  v17 = a5;
  objc_msgSend(v8, "methodSignatureForSelector:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
  {
LABEL_8:

    v14 = 0;
    goto LABEL_9;
  }
  v11 = objc_msgSend(v9, "numberOfArguments");
  v12 = v11;
  if ((v11 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (v11 >= 4)
    {
      NSStringFromSelector(a4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%s: method '%@' requires more than 1 argument"), "-[TIActionWhenIdle initWithTarget:selector:object:]", v15);

    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTarget:", v8);
  objc_msgSend(v13, "setSelector:", a4);
  if (v12 >= 3)
    objc_msgSend(v13, "setArgument:atIndex:", &v17, 2);
  v14 = -[TIActionWhenIdle initWithInvocation:](self, "initWithInvocation:", v13);

LABEL_9:
  return v14;
}

- (TIActionWhenIdle)initWithInvocation:(id)a3
{
  id v5;
  TIActionWhenIdle *v6;
  TIActionWhenIdle *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIActionWhenIdle;
  v6 = -[TIActionWhenIdle init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_invocation, a3);
    -[NSInvocation retainArguments](v7->_invocation, "retainArguments");
    -[TIActionWhenIdle addObserverToRunLoop](v7, "addObserverToRunLoop");
  }

  return v7;
}

- (void)addObserverToRunLoop
{
  __CFRunLoopObserver *v2;
  __CFRunLoop *Current;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40__TIActionWhenIdle_addObserverToRunLoop__block_invoke;
  v4[3] = &unk_1E2438FF0;
  objc_copyWeak(&v5, &location);
  v2 = CFRunLoopObserverCreateWithHandler(0, 0x20uLL, 0, 0, v4);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddObserver(Current, v2, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  CFRelease(v2);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)invoke
{
  id v3;

  -[TIActionWhenIdle invocation](self, "invocation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TIActionWhenIdle setInvocation:](self, "setInvocation:", 0);
  objc_msgSend(v3, "invoke");

}

void __40__TIActionWhenIdle_addObserverToRunLoop__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invoke");

}

- (void)setInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_invocation, a3);
}

- (NSInvocation)invocation
{
  return self->_invocation;
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[TIActionWhenIdle invocation](self, "invocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (void)invalidate
{
  -[TIActionWhenIdle setInvocation:](self, "setInvocation:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocation, 0);
}

@end
