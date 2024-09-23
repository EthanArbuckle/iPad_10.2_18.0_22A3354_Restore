@implementation SBSAElementSnapshotContextMutator

- (SBSAElementSnapshotContextMutator)initWithElementSnapshotContext:(id)a3
{
  id v5;
  SBSAElementSnapshotContextMutator *v6;
  SBSAElementSnapshotContextMutator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAElementSnapshotContextMutator;
  v6 = -[SBSAElementSnapshotContextMutator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_elementSnapshotContext, a3);

  return v7;
}

- (NSString)clientIdentifier
{
  return -[SBSAElementSnapshotContext clientIdentifier](self->_elementSnapshotContext, "clientIdentifier");
}

- (void)setClientIdentifier:(id)a3
{
  -[SBSAElementSnapshotContext _setClientIdentifier:](self->_elementSnapshotContext, "_setClientIdentifier:", a3);
}

- (NSString)elementIdentifier
{
  return -[SBSAElementSnapshotContext elementIdentifier](self->_elementSnapshotContext, "elementIdentifier");
}

- (void)setElementIdentifier:(id)a3
{
  -[SBSAElementSnapshotContext _setElementIdentifier:](self->_elementSnapshotContext, "_setElementIdentifier:", a3);
}

- (NSString)snapshotReason
{
  return -[SBSAElementSnapshotContext snapshotReason](self->_elementSnapshotContext, "snapshotReason");
}

- (void)setSnapshotReason:(id)a3
{
  -[SBSAElementSnapshotContext _setSnapshotReason:](self->_elementSnapshotContext, "_setSnapshotReason:", a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; elementSnapshotContext: %@>"),
               objc_opt_class(),
               self,
               self->_elementSnapshotContext);
}

- (SBSAElementSnapshotContext)elementSnapshotContext
{
  return self->_elementSnapshotContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementSnapshotContext, 0);
}

@end
