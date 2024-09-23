@implementation SBCancelableBlockOperation

- (SBCancelableBlockOperation)init
{
  SBCancelableBlockOperation *v2;
  NSMutableArray *v3;
  NSMutableArray *blocks;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBCancelableBlockOperation;
  v2 = -[SBCancelableBlockOperation init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    blocks = v2->_blocks;
    v2->_blocks = v3;

  }
  return v2;
}

- (void)addBlock:(id)a3
{
  NSMutableArray *blocks;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  if ((-[SBCancelableBlockOperation isExecuting](self, "isExecuting") & 1) != 0
    || -[SBCancelableBlockOperation isFinished](self, "isFinished"))
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Block added after operation started or finished."), 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v6);
  }
  blocks = self->_blocks;
  v5 = (void *)MEMORY[0x1D17E5550](v7);
  -[NSMutableArray addObject:](blocks, "addObject:", v5);

}

- (void)main
{
  unint64_t v3;
  void (**v4)(void);

  if ((-[SBCancelableBlockOperation isCancelled](self, "isCancelled") & 1) == 0)
  {
    v3 = 0;
    do
    {
      if (-[NSMutableArray count](self->_blocks, "count") <= v3)
        break;
      -[NSMutableArray objectAtIndex:](self->_blocks, "objectAtIndex:", v3);
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();

      ++v3;
    }
    while ((-[SBCancelableBlockOperation isCancelled](self, "isCancelled") & 1) == 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocks, 0);
}

@end
