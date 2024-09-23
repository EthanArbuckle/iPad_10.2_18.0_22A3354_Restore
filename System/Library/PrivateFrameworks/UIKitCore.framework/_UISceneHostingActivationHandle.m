@implementation _UISceneHostingActivationHandle

- (id)initWithActivationTarget:(id *)a1
{
  id v3;
  id *v4;
  objc_super v6;

  v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)_UISceneHostingActivationHandle;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
      objc_storeWeak(v4 + 1, v3);
  }

  return a1;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (-[_UISceneHostingActivationHandle isHandleValid](self, "isHandleValid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneHostingActivationHandle.m"), 25, CFSTR("Scene activation handle deallocated before being invalidated"));

  }
  v5.receiver = self;
  v5.super_class = (Class)_UISceneHostingActivationHandle;
  -[_UISceneHostingActivationHandle dealloc](&v5, sel_dealloc);
}

- (BOOL)isHandleValid
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_activationTarget);
  v3 = WeakRetained != 0;

  return v3;
}

- (BOOL)isActive
{
  id WeakRetained;
  char v5;
  void *v7;

  if (!-[_UISceneHostingActivationHandle isHandleValid](self, "isHandleValid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneHostingActivationHandle.m"), 35, CFSTR("This activation handle has invalidated!"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_activationTarget);
  v5 = objc_msgSend(WeakRetained, "isActive");

  return v5;
}

- (void)activate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v5 = a3;
  if (!-[_UISceneHostingActivationHandle isHandleValid](self, "isHandleValid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneHostingActivationHandle.m"), 40, CFSTR("This activation handle has invalidated!"));

  }
  if (-[_UISceneHostingActivationHandle isActive](self, "isActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneHostingActivationHandle.m"), 41, CFSTR("The scene is already active"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_activationTarget);
  objc_msgSend(WeakRetained, "activate:", v5);

}

- (void)deactivate:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;

  v5 = a3;
  if (!-[_UISceneHostingActivationHandle isHandleValid](self, "isHandleValid"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneHostingActivationHandle.m"), 46, CFSTR("This activation handle has invalidated!"));

  }
  if (!-[_UISceneHostingActivationHandle isActive](self, "isActive"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UISceneHostingActivationHandle.m"), 47, CFSTR("The scene is already inactive"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_activationTarget);
  objc_msgSend(WeakRetained, "deactivate:", v5);

}

- (void)invalidate
{
  objc_storeWeak((id *)&self->_activationTarget, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activationTarget);
}

@end
