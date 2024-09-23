@implementation RCOperationExternalSignal

- (RCOperationExternalSignal)init
{
  id v2;
  dispatch_group_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RCOperationExternalSignal;
  v2 = -[RCOperationExternalSignal init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_group_create();
    v4 = (void *)*((_QWORD *)v2 + 2);
    *((_QWORD *)v2 + 2) = v3;

    dispatch_group_enter(*((dispatch_group_t *)v2 + 2));
  }
  return (RCOperationExternalSignal *)v2;
}

- (void)triggerWithRetry:(BOOL)a3
{
  self->_result = a3;
  dispatch_group_leave((dispatch_group_t)self->_group);
}

- (void)onQueue:(id)a3 signal:(id)a4
{
  id v6;
  NSObject *group;
  id v8;
  _QWORD v9[5];
  id v10;

  v6 = a4;
  group = self->_group;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__RCOperationExternalSignal_onQueue_signal___block_invoke;
  v9[3] = &unk_1E470E090;
  v9[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_group_notify(group, (dispatch_queue_t)a3, v9);

}

uint64_t __44__RCOperationExternalSignal_onQueue_signal___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
}

@end
