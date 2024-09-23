@implementation RTInvocationRecord

- (RTInvocationRecord)initWithBlock:(id)a3 failureBlock:(id)a4 description:(id)a5
{
  id v8;
  id v9;
  id v10;
  RTInvocationRecord *v11;
  uint64_t v12;
  id block;
  uint64_t v14;
  id failureBlock;
  uint64_t v16;
  NSString *invocationDescription;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)RTInvocationRecord;
  v11 = -[RTInvocationRecord init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    block = v11->_block;
    v11->_block = (id)v12;

    v14 = objc_msgSend(v9, "copy");
    failureBlock = v11->_failureBlock;
    v11->_failureBlock = (id)v14;

    v16 = objc_msgSend(v10, "copy");
    invocationDescription = v11->_invocationDescription;
    v11->_invocationDescription = (NSString *)v16;

  }
  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithBlock:failureBlock:description:", self->_block, self->_failureBlock, self->_invocationDescription);
}

- (void)invoke
{
  void (**block)(void);

  block = (void (**)(void))self->_block;
  if (block)
    block[2]();
}

- (void)invokeFailure
{
  void (**failureBlock)(void);

  failureBlock = (void (**)(void))self->_failureBlock;
  if (failureBlock)
    failureBlock[2]();
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)failureBlock
{
  return self->_failureBlock;
}

- (void)setFailureBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)invocationDescription
{
  return self->_invocationDescription;
}

- (void)setInvocationDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationDescription, 0);
  objc_storeStrong(&self->_failureBlock, 0);
  objc_storeStrong(&self->_block, 0);
}

@end
