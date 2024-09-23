@implementation DispatchGroupWrapper

- (DispatchGroupWrapper)init
{
  DispatchGroupWrapper *v2;
  dispatch_group_t v3;
  OS_dispatch_group *dispatchGroup;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DispatchGroupWrapper;
  v2 = -[DispatchGroupWrapper init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    dispatchGroup = v2->_dispatchGroup;
    v2->_dispatchGroup = (OS_dispatch_group *)v3;

  }
  return v2;
}

- (void)executeWithDispatchGroup:(id)a3
{
  NSObject *dispatchGroup;
  void (**v5)(id, _QWORD *);
  _QWORD v6[5];

  dispatchGroup = self->_dispatchGroup;
  v5 = (void (**)(id, _QWORD *))a3;
  dispatch_group_enter(dispatchGroup);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__DispatchGroupWrapper_executeWithDispatchGroup___block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  v5[2](v5, v6);

}

void __49__DispatchGroupWrapper_executeWithDispatchGroup___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void)notify:(id)a3
{
  dispatch_group_notify((dispatch_group_t)self->_dispatchGroup, MEMORY[0x1E0C80D38], a3);
}

- (OS_dispatch_group)dispatchGroup
{
  return self->_dispatchGroup;
}

- (void)setDispatchGroup:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchGroup, 0);
}

@end
