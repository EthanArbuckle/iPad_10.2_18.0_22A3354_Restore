@implementation MSDOperationBarrier

- (MSDOperationBarrier)init
{
  MSDOperationBarrier *v2;
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDOperationBarrier;
  v2 = -[MSDOperationBarrier init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init((Class)NSCondition);
    -[MSDOperationBarrier setCondition:](v2, "setCondition:", v3);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](v2, "condition"));
    objc_msgSend(v4, "setName:", CFSTR("com.apple.msd.operation_barrier"));

  }
  return v2;
}

- (void)waitUntilClear
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  objc_msgSend(v3, "lock");

  if (-[MSDOperationBarrier activated](self, "activated"))
  {
    do
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
      objc_msgSend(v4, "wait");

    }
    while (-[MSDOperationBarrier activated](self, "activated"));
  }
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  objc_msgSend(v5, "unlock");

}

- (void)activate
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  objc_msgSend(v3, "lock");

  -[MSDOperationBarrier setActivated:](self, "setActivated:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  objc_msgSend(v4, "broadcast");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  objc_msgSend(v5, "unlock");

}

- (void)deactivate
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  objc_msgSend(v3, "lock");

  -[MSDOperationBarrier setActivated:](self, "setActivated:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  objc_msgSend(v4, "broadcast");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDOperationBarrier condition](self, "condition"));
  objc_msgSend(v5, "unlock");

}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (NSCondition)condition
{
  return self->_condition;
}

- (void)setCondition:(id)a3
{
  objc_storeStrong((id *)&self->_condition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_condition, 0);
}

@end
