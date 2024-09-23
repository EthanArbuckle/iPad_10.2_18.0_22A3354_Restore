@implementation SBTransientActiveInterfaceOrientationRequester

- (SBTransientActiveInterfaceOrientationRequester)initWithOrientation:(int64_t)a3 andReason:(id)a4
{
  id v7;
  SBTransientActiveInterfaceOrientationRequester *v8;
  uint64_t v9;
  NSString *reason;
  void *v12;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBTransientActiveInterfaceOrientationRequester;
  v8 = -[SBTransientActiveInterfaceOrientationRequester init](&v13, sel_init);
  if (v8)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("SpringBoard.m"), 7800, CFSTR("A reason is required to create a SBTransientActiveInterfaceOrientationRequester."));

    }
    v8->_orientation = a3;
    v9 = objc_msgSend(v7, "copy");
    reason = v8->_reason;
    v8->_reason = (NSString *)v9;

  }
  return v8;
}

- (NSString)reason
{
  return self->_reason;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
