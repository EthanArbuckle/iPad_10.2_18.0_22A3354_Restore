@implementation WFCloudKitTask

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancellationHandler, 0);
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)cancel
{
  void *v3;
  void (**v4)(void);

  if (!-[WFCloudKitTask isCancelled](self, "isCancelled"))
  {
    -[WFCloudKitTask setCancelled:](self, "setCancelled:", 1);
    -[WFCloudKitTask cancellationHandler](self, "cancellationHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[WFCloudKitTask cancellationHandler](self, "cancellationHandler");
      v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v4[2]();

    }
  }
}

- (id)cancellationHandler
{
  return self->_cancellationHandler;
}

- (void)setCancellationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

@end
