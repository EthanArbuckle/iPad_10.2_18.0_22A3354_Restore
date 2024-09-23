@implementation PVCanceler

- (BOOL)canceled
{
  BOOL *p_canceled;
  void *v4;
  void (**v5)(_QWORD, _QWORD);

  p_canceled = &self->_canceled;
  if (!self->_canceled)
  {
    -[PVCanceler updateBlock](self, "updateBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PVCanceler updateBlock](self, "updateBlock");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, BOOL *))v5)[2](v5, p_canceled);

    }
  }
  return *p_canceled;
}

- (void)setCanceled:(BOOL)a3
{
  self->_canceled = a3;
}

- (id)updateBlock
{
  return self->_updateBlock;
}

- (void)setUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateBlock, 0);
}

+ (id)cancelerWithUpdateBlock:(id)a3
{
  id v3;
  PVCanceler *v4;

  v3 = a3;
  v4 = objc_alloc_init(PVCanceler);
  -[PVCanceler setUpdateBlock:](v4, "setUpdateBlock:", v3);

  return v4;
}

@end
