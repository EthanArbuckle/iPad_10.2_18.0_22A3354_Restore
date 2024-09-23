@implementation PCSCKKSOperationBlock

- (void)start
{
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  void (**v5)(id, void *);

  if (-[PCSCKKSOperation startOperation](self, "startOperation"))
  {
    -[PCSCKKSOperation checkDependencies](self, "checkDependencies");
    -[PCSCKKSOperationBlock block](self, "block");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0);

    -[PCSCKKSOperation completeOperation](self, "completeOperation");
  }
  else
  {
    -[PCSCKKSOperationBlock block](self, "block");
    v5 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    -[PCSCKKSOperation error](self, "error");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5[2](v5, v4);

  }
}

- (id)block
{
  return objc_getProperty(self, a2, 272, 1);
}

- (void)setBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
}

@end
