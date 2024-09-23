@implementation MSDOperationQueue

- (MSDOperationQueue)init
{
  MSDOperationQueue *v2;
  MSDOperationBarrier *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MSDOperationQueue;
  v2 = -[MSDOperationQueue init](&v5, "init");
  if (v2)
  {
    v3 = objc_alloc_init(MSDOperationBarrier);
    -[MSDOperationQueue setCheckpointBarrier:](v2, "setCheckpointBarrier:", v3);

  }
  return v2;
}

- (void)addOperation:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v5 = a3;
  v7 = objc_opt_class(MSDOperation, v6);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) == 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSDOperationQueue.m"), 37, CFSTR("%@ is not a flavor of MSDOperation."), v5);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationQueue checkpointBarrier](self, "checkpointBarrier"));
  objc_msgSend(v5, "addCheckpointBarrier:", v8);

  v10.receiver = self;
  v10.super_class = (Class)MSDOperationQueue;
  -[MSDOperationQueue addOperation:](&v10, "addOperation:", v5);

}

- (void)setSuspended:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MSDOperationQueue;
  -[MSDOperationQueue setSuspended:](&v7, "setSuspended:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationQueue checkpointBarrier](self, "checkpointBarrier"));
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "activate");
  else
    objc_msgSend(v5, "deactivate");

}

- (MSDOperationBarrier)checkpointBarrier
{
  return self->_checkpointBarrier;
}

- (void)setCheckpointBarrier:(id)a3
{
  objc_storeStrong((id *)&self->_checkpointBarrier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkpointBarrier, 0);
}

@end
