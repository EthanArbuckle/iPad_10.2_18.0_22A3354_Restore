@implementation PXBlockActionPerformer

- (PXBlockActionPerformer)initWithActionType:(id)a3 configuration:(id)a4
{
  id v6;
  PXBlockActionPerformer *v7;
  uint64_t v8;
  PXBlockActionConfiguration *configuration;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PXBlockActionPerformer;
  v7 = -[PXActionPerformer initWithActionType:](&v11, sel_initWithActionType_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    configuration = v7->_configuration;
    v7->_configuration = (PXBlockActionConfiguration *)v8;

  }
  return v7;
}

- (void)performUserInteractionTask
{
  void *v3;
  uint64_t (**v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v5;
  uint64_t v6;
  id v7;
  id v8;

  -[PXBlockActionPerformer configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionBlock");
  v4 = (uint64_t (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();

  -[PXBlockActionPerformer actionManager](self, "actionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v6 = ((uint64_t (**)(_QWORD, void *, PXBlockActionPerformer *, id *))v4)[2](v4, v5, self, &v8);
  v7 = v8;

  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", v6, v7);
}

- (PXBlockActionConfiguration)configuration
{
  return self->_configuration;
}

- (PXBlockActionManager)actionManager
{
  return (PXBlockActionManager *)objc_loadWeakRetained((id *)&self->_actionManager);
}

- (void)setActionManager:(id)a3
{
  objc_storeWeak((id *)&self->_actionManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_actionManager);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
