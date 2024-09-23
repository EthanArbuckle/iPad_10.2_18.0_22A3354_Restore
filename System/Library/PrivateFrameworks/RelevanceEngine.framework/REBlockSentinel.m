@implementation REBlockSentinel

- (REBlockSentinel)init
{
  return -[REBlockSentinel initWithFailureBlock:](self, "initWithFailureBlock:", 0);
}

- (REBlockSentinel)initWithFailureBlock:(id)a3
{
  id v4;
  REBlockSentinel *v5;
  uint64_t v6;
  id failureBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REBlockSentinel;
  v5 = -[REBlockSentinel init](&v9, sel_init);
  if (v5)
  {
    v6 = MEMORY[0x2199B2434](v4);
    failureBlock = v5->_failureBlock;
    v5->_failureBlock = (id)v6;

    -[REBlockSentinel setCompleted:](v5, "setCompleted:", 0);
  }

  return v5;
}

- (void)dealloc
{
  void (**failureBlock)(void);
  objc_super v4;

  if (!-[REBlockSentinel isCompleted](self, "isCompleted"))
  {
    failureBlock = (void (**)(void))self->_failureBlock;
    if (failureBlock)
      failureBlock[2]();
  }
  v4.receiver = self;
  v4.super_class = (Class)REBlockSentinel;
  -[REBlockSentinel dealloc](&v4, sel_dealloc);
}

- (void)complete
{
  -[REBlockSentinel setCompleted:](self, "setCompleted:", 1);
}

- (id)failureBlock
{
  return self->_failureBlock;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_failureBlock, 0);
}

@end
