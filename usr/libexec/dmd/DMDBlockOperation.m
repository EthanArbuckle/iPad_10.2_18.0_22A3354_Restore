@implementation DMDBlockOperation

+ (id)blockOperationWithBlock:(id)a3
{
  id v3;
  DMDBlockOperation *v4;

  v3 = a3;
  v4 = objc_opt_new(DMDBlockOperation);
  -[DMDBlockOperation setBlock:](v4, "setBlock:", v3);

  return v4;
}

- (void)main
{
  void *v3;
  void (**v4)(void);

  v3 = objc_autoreleasePoolPush();
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[DMDBlockOperation block](self, "block"));
  v4[2]();

  objc_autoreleasePoolPop(v3);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
