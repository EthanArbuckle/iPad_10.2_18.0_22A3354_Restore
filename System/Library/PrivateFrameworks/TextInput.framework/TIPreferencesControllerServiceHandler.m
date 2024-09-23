@implementation TIPreferencesControllerServiceHandler

- (void)forwardInvocation:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  v4 = &unk_1EE050000;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v4, (SEL)objc_msgSend(v5, "selector"), 1, 1).name)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __59__TIPreferencesControllerServiceHandler_forwardInvocation___block_invoke;
    v6[3] = &unk_1E243B440;
    v7 = v5;
    TIDispatchSync(MEMORY[0x1E0C80D38], v6);

  }
  else
  {
    objc_msgSend(v5, "invokeWithTarget:", self);
  }

}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v5 = &unk_1EE050000;
  if ((unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 1, 1).name)
  {
    +[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "methodSignatureForSelector:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)TIPreferencesControllerServiceHandler;
    -[TIPreferencesControllerServiceHandler methodSignatureForSelector:](&v9, sel_methodSignatureForSelector_, a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  void *v5;
  BOOL v6;
  objc_super v8;

  v5 = &unk_1EE050000;
  v6 = 1;
  if (!(unint64_t)protocol_getMethodDescription((Protocol *)v5, a3, 1, 1).name)
  {
    v8.receiver = self;
    v8.super_class = (Class)TIPreferencesControllerServiceHandler;
    v6 = -[TIPreferencesControllerServiceHandler respondsToSelector:](&v8, sel_respondsToSelector_, a3);
  }

  return v6;
}

void __59__TIPreferencesControllerServiceHandler_forwardInvocation___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  +[TIPreferencesController sharedPreferencesController](TIPreferencesController, "sharedPreferencesController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invokeWithTarget:", v2);

}

@end
