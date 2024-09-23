@implementation SBINAppIntentsCoordinator

+ (SBINAppIntentsCoordinator)sharedSystemCoordinator
{
  if (sharedSystemCoordinator_onceToken[0] != -1)
    dispatch_once(sharedSystemCoordinator_onceToken, &__block_literal_global_0);
  return (SBINAppIntentsCoordinator *)(id)sharedSystemCoordinator_instance;
}

void __52__SBINAppIntentsCoordinator_sharedSystemCoordinator__block_invoke()
{
  SBINAppIntentsCoordinator *v0;
  void *v1;

  v0 = objc_alloc_init(SBINAppIntentsCoordinator);
  v1 = (void *)sharedSystemCoordinator_instance;
  sharedSystemCoordinator_instance = (uint64_t)v0;

}

- (SBINAppIntentsCoordinator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBINAppIntentsCoordinator;
  return -[SBINAppIntentsCoordinator init](&v3, sel_init);
}

- (void)performAppIntent:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, _QWORD);
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  BSDispatchQueueAssertMain();
  -[SBINAppIntentsCoordinator delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "appIntentsCoordinator:performAppIntent:withCompletion:", self, v9, v6);
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

}

- (SBINAppIntentsCoordinatorDelegate)delegate
{
  return (SBINAppIntentsCoordinatorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
