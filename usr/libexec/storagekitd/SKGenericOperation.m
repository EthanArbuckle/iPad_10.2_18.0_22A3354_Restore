@implementation SKGenericOperation

- (BOOL)run
{
  void (**v3)(void);

  v3 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[SKGenericOperation completionBlock](self, "completionBlock"));
  v3[2]();

  -[SKManagerOperation finished](self, "finished");
  return 1;
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
}

@end
