@implementation VUIAsynchronousWorkToken

- (VUIAsynchronousWorkToken)initWithOperation:(id)a3
{
  id v5;
  VUIAsynchronousWorkToken *v6;
  VUIAsynchronousWorkToken *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIAsynchronousWorkToken;
  v6 = -[VUIAsynchronousWorkToken init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_operation, a3);

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operation, 0);
}

- (VUIAsynchronousWorkToken)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The %@ initializer is not available."), v5);

  return 0;
}

- (void)cancel
{
  id v2;

  -[VUIAsynchronousWorkToken operation](self, "operation");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cancel");

}

- (NSOperation)operation
{
  return self->_operation;
}

- (void)setOperation:(id)a3
{
  objc_storeStrong((id *)&self->_operation, a3);
}

@end
