@implementation PXEditCompositionAction

- (PXEditCompositionAction)initWithCompositionController:(id)a3
{
  id v5;
  PXEditCompositionAction *v6;
  PXEditCompositionAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXEditCompositionAction;
  v6 = -[PXEditCompositionAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_compositionController, a3);

  return v7;
}

- (PXEditCompositionAction)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditCompositionAction.m"), 34, CFSTR("%s is not available as initializer"), "-[PXEditCompositionAction init]");

  abort();
}

- (void)_applyComposition:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditCompositionAction.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("composition"));

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71180]), "initWithComposition:", v7);
  objc_msgSend(v5, "setImageOrientation:", -[PICompositionController imageOrientation](self->_compositionController, "imageOrientation"));
  -[PICompositionController applyChangesFromCompositionController:](self->_compositionController, "applyChangesFromCompositionController:", v5);

}

- (NUComposition)sourceComposition
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditCompositionAction.m"), 49, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXEditCompositionAction sourceComposition]", v6);

  abort();
}

- (NUComposition)targetComposition
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXEditCompositionAction.m"), 53, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXEditCompositionAction targetComposition]", v6);

  abort();
}

- (void)performUndo:(id)a3
{
  PICompositionController *compositionController;
  void (**v5)(id, uint64_t, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  compositionController = self->_compositionController;
  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PICompositionController composition](compositionController, "composition");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PXEditCompositionAction sourceComposition](self, "sourceComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXEditCompositionAction _applyComposition:](self, "_applyComposition:", v6);

  v5[2](v5, 1, 0);
  v7 = (void *)MEMORY[0x1E0D7CAB8];
  -[PXEditCompositionAction sourceComposition](self, "sourceComposition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportAnalyticsForChangeFrom:to:actionType:", v9, v8, 0);

}

- (void)performRedo:(id)a3
{
  PICompositionController *compositionController;
  void (**v5)(id, uint64_t, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  id v9;

  compositionController = self->_compositionController;
  v5 = (void (**)(id, uint64_t, _QWORD))a3;
  -[PICompositionController composition](compositionController, "composition");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PXEditCompositionAction targetComposition](self, "targetComposition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXEditCompositionAction _applyComposition:](self, "_applyComposition:", v6);

  v5[2](v5, 1, 0);
  v7 = (void *)MEMORY[0x1E0D7CAB8];
  -[PXEditCompositionAction targetComposition](self, "targetComposition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reportAnalyticsForChangeFrom:to:actionType:", v9, v8, 1);

}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (NSString)actionNameLocalizationKey
{
  return self->_actionNameLocalizationKey;
}

- (void)setActionNameLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)localizedActionName
{
  return self->_localizedActionName;
}

- (void)setLocalizedActionName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedActionName, 0);
  objc_storeStrong((id *)&self->_actionNameLocalizationKey, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
}

@end
