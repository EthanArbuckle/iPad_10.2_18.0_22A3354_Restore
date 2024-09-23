@implementation SBSystemApertureAlertItemPresenter

- (SBSystemApertureAlertItemPresenter)initWithSystemApertureController:(id)a3
{
  id v5;
  SBSystemApertureAlertItemPresenter *v6;
  SBSystemApertureAlertItemPresenter *v7;
  void *v9;
  objc_super v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureAlertItemPresenter.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("systemApertureController"));

  }
  v10.receiver = self;
  v10.super_class = (Class)SBSystemApertureAlertItemPresenter;
  v6 = -[SBSystemApertureAlertItemPresenter init](&v10, sel_init);
  v7 = v6;
  if (v6)
    objc_storeWeak((id *)&v6->_systemApertureController, v5);

  return v7;
}

- (BOOL)presentsAlertItemsModally
{
  return 0;
}

- (BOOL)canPresentMultipleAlertItemsSimultaneously
{
  return 1;
}

- (void)presentAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  NSMapTable *v12;
  NSMapTable *elementsToAssertions;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = (void (**)(_QWORD))a5;
  BSDispatchQueueAssertMain();
  objc_msgSend(v16, "_systemApertureElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureAlertItemPresenter.m"), 48, CFSTR("%@ cannot present alert item '%@' that does not have an SAElement"), self, v16);

  }
  -[SBSystemApertureAlertItemPresenter systemApertureController](self, "systemApertureController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "registerElement:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if (!self->_elementsToAssertions)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v12 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
      elementsToAssertions = self->_elementsToAssertions;
      self->_elementsToAssertions = v12;

    }
    -[SBSystemApertureAlertItemPresenter elementsToAssertions](self, "elementsToAssertions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKey:", v11, v9);

    objc_msgSend(v16, "wakeDisplay");
  }
  if (v8)
    v8[2](v8);

}

- (void)dismissAlertItem:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = (void (**)(_QWORD))a5;
  BSDispatchQueueAssertMain();
  objc_msgSend(v14, "_systemApertureElement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureAlertItemPresenter.m"), 72, CFSTR("%@ cannot dismiss alert item '%@' that does not have an SAElement"), self, v14);

  }
  -[SBSystemApertureAlertItemPresenter elementsToAssertions](self, "elementsToAssertions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "invalidateWithReason:", CFSTR("dismissAlertItem"));
    -[SBSystemApertureAlertItemPresenter elementsToAssertions](self, "elementsToAssertions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObjectForKey:", v9);

  }
  if (v8)
    v8[2](v8);

}

- (SBSystemApertureController)systemApertureController
{
  return (SBSystemApertureController *)objc_loadWeakRetained((id *)&self->_systemApertureController);
}

- (NSMapTable)elementsToAssertions
{
  return self->_elementsToAssertions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementsToAssertions, 0);
  objc_destroyWeak((id *)&self->_systemApertureController);
}

@end
