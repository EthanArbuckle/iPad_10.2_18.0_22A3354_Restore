@implementation IMBlockConfigurationPredicate

+ (id)predicateWithBlock:(id)a3
{
  id v3;
  IMBlockConfigurationPredicate *v4;

  v3 = a3;
  v4 = objc_alloc_init(IMBlockConfigurationPredicate);
  -[IMBlockConfigurationPredicate setBlock:](v4, "setBlock:", v3);

  return v4;
}

- (BOOL)evaluateWithContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  char v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[IMBlockConfigurationPredicate block](self, "block"));

  if (v5)
  {
    v6 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[IMBlockConfigurationPredicate block](self, "block"));
    v7 = ((uint64_t (**)(_QWORD, id))v6)[2](v6, v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
