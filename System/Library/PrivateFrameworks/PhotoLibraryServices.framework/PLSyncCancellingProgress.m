@implementation PLSyncCancellingProgress

- (void)setCancellationHandler:(id)a3
{
  int v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PLSyncCancellingProgress setPl_cancellationHandler:](self, "setPl_cancellationHandler:", v6);
  v4 = -[PLSyncCancellingProgress isCancelled](self, "isCancelled");
  v5 = v6;
  if (v6 && v4)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }

}

- (void)cancel
{
  uint64_t v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLSyncCancellingProgress;
  -[PLSyncCancellingProgress cancel](&v5, sel_cancel);
  -[PLSyncCancellingProgress pl_cancellationHandler](self, "pl_cancellationHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    (*(void (**)(uint64_t))(v3 + 16))(v3);

}

- (id)pl_cancellationHandler
{
  return objc_getProperty(self, a2, 120, 1);
}

- (void)setPl_cancellationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pl_cancellationHandler, 0);
}

+ (id)discreteProgressWithTotalUnitCount:(int64_t)a3
{
  PLSyncCancellingProgress *v4;

  v4 = -[PLSyncCancellingProgress initWithParent:userInfo:]([PLSyncCancellingProgress alloc], "initWithParent:userInfo:", 0, 0);
  -[PLSyncCancellingProgress setTotalUnitCount:](v4, "setTotalUnitCount:", a3);
  return v4;
}

@end
