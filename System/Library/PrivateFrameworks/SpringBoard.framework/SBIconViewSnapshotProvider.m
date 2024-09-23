@implementation SBIconViewSnapshotProvider

- (SBIconViewSnapshotProvider)initWithSnapshotView:(id)a3 invalidation:(id)a4
{
  id v7;
  id v8;
  SBIconViewSnapshotProvider *v9;
  SBIconViewSnapshotProvider *v10;
  uint64_t v11;
  id invalidationBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SBIconViewSnapshotProvider;
  v9 = -[SBIconViewSnapshotProvider init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_snapshotView, a3);
    v11 = objc_msgSend(v8, "copy");
    invalidationBlock = v10->_invalidationBlock;
    v10->_invalidationBlock = (id)v11;

  }
  return v10;
}

- (void)invalidate
{
  id invalidationBlock;
  id v4;
  void (**v5)(id, SBIconViewSnapshotProvider *);

  invalidationBlock = self->_invalidationBlock;
  if (invalidationBlock)
  {
    v5 = (void (**)(id, SBIconViewSnapshotProvider *))MEMORY[0x1D17E5550](invalidationBlock, a2);
    v4 = self->_invalidationBlock;
    self->_invalidationBlock = 0;

    v5[2](v5, self);
  }
}

- (UIView)snapshotView
{
  return self->_snapshotView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotView, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end
