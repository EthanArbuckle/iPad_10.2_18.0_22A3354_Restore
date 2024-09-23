@implementation _PRUISPosterRenderingEnqueuedSnapshot

- (_PRUISPosterRenderingEnqueuedSnapshot)initWithSnapshotRequest:(id)a3 completionBlock:(id)a4
{
  id v7;
  id v8;
  _PRUISPosterRenderingEnqueuedSnapshot *v9;
  _PRUISPosterRenderingEnqueuedSnapshot *v10;
  uint64_t v11;
  id completionBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PRUISPosterRenderingEnqueuedSnapshot;
  v9 = -[_PRUISPosterRenderingEnqueuedSnapshot init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_snapshotRequest, a3);
    v11 = objc_msgSend(v8, "copy");
    completionBlock = v10->_completionBlock;
    v10->_completionBlock = (id)v11;

  }
  return v10;
}

- (PRUISPosterSnapshotRequest)snapshotRequest
{
  return self->_snapshotRequest;
}

- (void)setSnapshotRequest:(id)a3
{
  objc_storeStrong((id *)&self->_snapshotRequest, a3);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong((id *)&self->_snapshotRequest, 0);
}

@end
