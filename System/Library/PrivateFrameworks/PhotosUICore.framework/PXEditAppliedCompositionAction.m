@implementation PXEditAppliedCompositionAction

- (PXEditAppliedCompositionAction)initWithCompositionController:(id)a3 sourceComposition:(id)a4
{
  id v6;
  id v7;
  PXEditAppliedCompositionAction *v8;
  PXEditAppliedCompositionAction *v9;
  uint64_t v10;
  NUComposition *targetComposition;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PXEditAppliedCompositionAction;
  v8 = -[PXEditCompositionAction initWithCompositionController:](&v13, sel_initWithCompositionController_, v6);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_sourceComposition, a4);
    objc_msgSend(v6, "composition");
    v10 = objc_claimAutoreleasedReturnValue();
    targetComposition = v9->_targetComposition;
    v9->_targetComposition = (NUComposition *)v10;

  }
  return v9;
}

- (PXEditAppliedCompositionAction)initWithCompositionController:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditAppliedCompositionAction.m"), 32, CFSTR("%s is not available as initializer"), "-[PXEditAppliedCompositionAction initWithCompositionController:]");

  abort();
}

- (void)performAction:(id)a3
{
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(a3, 1, 0);
}

- (NUComposition)sourceComposition
{
  return self->_sourceComposition;
}

- (id)targetComposition
{
  return self->_targetComposition;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetComposition, 0);
  objc_storeStrong((id *)&self->_sourceComposition, 0);
}

@end
