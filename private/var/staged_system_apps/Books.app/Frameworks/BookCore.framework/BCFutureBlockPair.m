@implementation BCFutureBlockPair

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)caller
{
  return self->_caller;
}

- (void)setCaller:(void *)a3
{
  self->_caller = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
