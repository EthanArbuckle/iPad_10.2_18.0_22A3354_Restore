@implementation _UIActionWhenIdle

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocation, 0);
}

- (void)invoke
{
  id v3;

  -[_UIActionWhenIdle invocation](self, "invocation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIActionWhenIdle setInvocation:](self, "setInvocation:", 0);
  objc_msgSend(v3, "invoke");

}

- (void)setInvocation:(id)a3
{
  objc_storeStrong((id *)&self->_invocation, a3);
}

- (NSInvocation)invocation
{
  return self->_invocation;
}

- (void)invalidate
{
  -[_UIActionWhenIdle setInvocation:](self, "setInvocation:", 0);
}

+ (_UIActionWhenIdle)actionWhenIdleWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithTarget:selector:object:", v9, a4, v8);

  return (_UIActionWhenIdle *)v10;
}

- (_UIActionWhenIdle)initWithTarget:(id)a3 selector:(SEL)a4 object:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  _UIActionWhenIdle *v14;
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
      NSLog(CFSTR("%s: method '%@' requires more than 1 argument"), "-[_UIActionWhenIdle initWithTarget:selector:object:]", v15);

    }
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTarget:", v8);
  objc_msgSend(v13, "setSelector:", a4);
  if (v12 >= 3)
    objc_msgSend(v13, "setArgument:atIndex:", &v17, 2);
  v14 = -[_UIActionWhenIdle initWithInvocation:](self, "initWithInvocation:", v13);

LABEL_9:
  return v14;
}

- (_UIActionWhenIdle)initWithInvocation:(id)a3
{
  id v5;
  _UIActionWhenIdle *v6;
  _UIActionWhenIdle *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIActionWhenIdle;
  v6 = -[_UIActionWhenIdle init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_invocation, a3);
    -[NSInvocation retainArguments](v7->_invocation, "retainArguments");
    -[_UIActionWhenIdle addObserverToRunLoop](v7, "addObserverToRunLoop");
  }

  return v7;
}

- (void)addObserverToRunLoop
{
  __CFRunLoopObserver *v2;
  __CFRunLoop *Current;
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41___UIActionWhenIdle_addObserverToRunLoop__block_invoke;
  block[3] = &unk_1E16E8210;
  block[4] = self;
  v2 = CFRunLoopObserverCreateWithHandler(0, 0x20uLL, 0, 0, block);
  Current = CFRunLoopGetCurrent();
  CFRunLoopAddObserver(Current, v2, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
  CFRelease(v2);
}

- (BOOL)isValid
{
  void *v2;
  BOOL v3;

  -[_UIActionWhenIdle invocation](self, "invocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

@end
