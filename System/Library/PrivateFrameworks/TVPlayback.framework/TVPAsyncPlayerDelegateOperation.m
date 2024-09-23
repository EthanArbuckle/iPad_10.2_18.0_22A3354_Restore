@implementation TVPAsyncPlayerDelegateOperation

- (TVPAsyncPlayerDelegateOperation)init
{
  TVPAsyncPlayerDelegateOperation *v2;
  uint64_t v3;
  NSNumber *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVPAsyncPlayerDelegateOperation;
  v2 = -[TVPAsyncPlayerDelegateOperation init](&v6, sel_init);
  if (v2)
  {
    ++init_counter;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v3 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSNumber *)v3;

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVPAsyncPlayerDelegateOperation identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TVPAsyncPlayerDelegateOperation identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
