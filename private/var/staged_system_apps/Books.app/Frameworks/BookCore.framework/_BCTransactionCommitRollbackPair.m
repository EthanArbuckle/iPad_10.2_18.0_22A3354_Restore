@implementation _BCTransactionCommitRollbackPair

- (id)commit
{
  return self->_commit;
}

- (void)setCommit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)rollback
{
  return self->_rollback;
}

- (void)setRollback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_rollback, 0);
  objc_storeStrong(&self->_commit, 0);
}

@end
