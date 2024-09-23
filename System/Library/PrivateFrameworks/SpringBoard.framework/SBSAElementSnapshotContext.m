@implementation SBSAElementSnapshotContext

- (SBSAElementSnapshotContext)initWithSnapshotIdentity:(id)a3
{
  id v4;
  SBSAElementSnapshotContext *v5;
  void *v6;
  uint64_t v7;
  NSString *clientIdentifier;
  void *v9;
  uint64_t v10;
  NSString *elementIdentifier;
  void *v12;
  uint64_t v13;
  NSString *snapshotReason;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBSAElementSnapshotContext;
  v5 = -[SBSAElementSnapshotContext init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "clientIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "copy");
    clientIdentifier = v5->_clientIdentifier;
    v5->_clientIdentifier = (NSString *)v7;

    objc_msgSend(v4, "elementIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "copy");
    elementIdentifier = v5->_elementIdentifier;
    v5->_elementIdentifier = (NSString *)v10;

    objc_msgSend(v4, "snapshotReason");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "copy");
    snapshotReason = v5->_snapshotReason;
    v5->_snapshotReason = (NSString *)v13;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  NSString *clientIdentifier;
  uint64_t v7;
  id v8;
  void *v9;
  NSString *elementIdentifier;
  id v11;
  void *v12;
  NSString *snapshotReason;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  clientIdentifier = self->_clientIdentifier;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __38__SBSAElementSnapshotContext_isEqual___block_invoke;
  v21[3] = &unk_1E8EA4320;
  v8 = v4;
  v22 = v8;
  objc_msgSend(v5, "appendObject:counterpart:", clientIdentifier, v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  elementIdentifier = self->_elementIdentifier;
  v19[0] = v7;
  v19[1] = 3221225472;
  v19[2] = __38__SBSAElementSnapshotContext_isEqual___block_invoke_2;
  v19[3] = &unk_1E8EA4320;
  v11 = v8;
  v20 = v11;
  objc_msgSend(v9, "appendObject:counterpart:", elementIdentifier, v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  snapshotReason = self->_snapshotReason;
  v17[0] = v7;
  v17[1] = 3221225472;
  v17[2] = __38__SBSAElementSnapshotContext_isEqual___block_invoke_3;
  v17[3] = &unk_1E8EA4320;
  v18 = v11;
  v14 = v11;
  objc_msgSend(v12, "appendObject:counterpart:", snapshotReason, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v15, "isEqual");

  return v7;
}

uint64_t __38__SBSAElementSnapshotContext_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clientIdentifier");
}

uint64_t __38__SBSAElementSnapshotContext_isEqual___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "elementIdentifier");
}

uint64_t __38__SBSAElementSnapshotContext_isEqual___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "snapshotReason");
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendObject:", self->_clientIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendObject:", self->_elementIdentifier);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendObject:", self->_snapshotReason);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hash");

  return v7;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; clientIdentifier: %@; elementIdentifier: %@; snapshotReason: %@>"),
                       objc_opt_class(),
                       self,
                       self->_clientIdentifier,
                       self->_elementIdentifier,
                       self->_snapshotReason);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSString copy](self->_clientIdentifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[NSString copy](self->_elementIdentifier, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_snapshotReason, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  return v4;
}

+ (id)instanceWithBlock:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)objc_msgSend(v4, "copyWithBlock:", v3);

  return v5;
}

+ (Class)mutatorClass
{
  return (Class)objc_opt_class();
}

- (id)copyWithBlock:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
  void *v6;

  v4 = (void (**)(id, void *))a3;
  v5 = (void *)-[SBSAElementSnapshotContext copy](self, "copy");
  if (v4)
  {
    v6 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "mutatorClass")), "initWithElementSnapshotContext:", v5);
    v4[2](v4, v6);

  }
  return v5;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)_setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)elementIdentifier
{
  return self->_elementIdentifier;
}

- (void)_setElementIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)snapshotReason
{
  return self->_snapshotReason;
}

- (void)_setSnapshotReason:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotReason, 0);
  objc_storeStrong((id *)&self->_elementIdentifier, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end
