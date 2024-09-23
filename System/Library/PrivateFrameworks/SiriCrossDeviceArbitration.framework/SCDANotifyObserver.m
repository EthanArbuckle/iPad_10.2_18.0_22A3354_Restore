@implementation SCDANotifyObserver

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  v7.receiver = self;
  v7.super_class = (Class)SCDANotifyObserver;
  -[SCDANotifyObserver description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("%@ {name = %@}"), v4, self->_name);

  return v5;
}

- (SCDANotifyObserver)initWithName:(id)a3 options:(unint64_t)a4 queue:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  SCDANotifyObserver *v13;
  uint64_t v14;
  NSString *name;
  id v16;
  id WeakRetained;
  char v18;
  NSObject *queue;
  _QWORD block[4];
  id v22;
  SCDANotifyObserver *v23;
  id v24[2];
  id location;
  objc_super v26;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SCDANotifyObserver;
  v13 = -[SCDANotifyObserver init](&v26, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    v13->_options = a4;
    objc_storeStrong((id *)&v13->_queue, a5);
    v16 = objc_storeWeak((id *)&v13->_delegate, v12);
    *(_BYTE *)&v13->_flags = *(_BYTE *)&v13->_flags & 0xFE | objc_opt_respondsToSelector() & 1;

    WeakRetained = objc_loadWeakRetained((id *)&v13->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v18 = 2;
    else
      v18 = 0;
    *(_BYTE *)&v13->_flags = *(_BYTE *)&v13->_flags & 0xFD | v18;

    objc_initWeak(&location, v13);
    queue = v13->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__SCDANotifyObserver_initWithName_options_queue_delegate___block_invoke;
    block[3] = &unk_251749BD8;
    v22 = v10;
    v23 = v13;
    objc_copyWeak(v24, &location);
    v24[1] = (id)a4;
    dispatch_async(queue, block);
    objc_destroyWeak(v24);

    objc_destroyWeak(&location);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v3;

  -[SCDANotifyObserver _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SCDANotifyObserver;
  -[SCDANotifyObserver dealloc](&v3, sel_dealloc);
}

- (unint64_t)state
{
  unint64_t v2;
  NSObject *queue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v2 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if ((self->_options & 1) != 0)
  {
    queue = self->_queue;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __27__SCDANotifyObserver_state__block_invoke;
    v5[3] = &unk_25174AD90;
    v5[4] = self;
    v5[5] = &v6;
    dispatch_sync(queue, v5);
    v2 = v7[3];
  }
  _Block_object_dispose(&v6, 8);
  return v2;
}

- (void)getStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((self->_options & 1) != 0)
    {
      queue = self->_queue;
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __45__SCDANotifyObserver_getStateWithCompletion___block_invoke;
      v7[3] = &unk_25174ACA0;
      v7[4] = self;
      v8 = v4;
      dispatch_async(queue, v7);

    }
    else
    {
      (*((void (**)(id, _QWORD))v4 + 2))(v4, 0);
    }
  }

}

- (void)invalidate
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__SCDANotifyObserver_invalidate__block_invoke;
  block[3] = &unk_25174AD68;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_handleNotificationWithToken:(int)a3
{
  uint64_t v3;
  id WeakRetained;

  v3 = *(_QWORD *)&a3;
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "notifyObserver:didReceiveNotificationWithToken:", self, v3);

  }
  if ((self->_options & 1) != 0)
    -[SCDANotifyObserver _updateStateWithToken:](self, "_updateStateWithToken:", v3);
}

- (void)_updateStateWithToken:(int)a3
{
  int registrationToken;
  unint64_t state;
  uint64_t v6;
  id WeakRetained;
  uint64_t state64;

  state64 = 0;
  if (a3 != -1 && !notify_get_state(a3, &state64)
    || (registrationToken = self->_registrationToken, registrationToken != -1)
    && !notify_get_state(registrationToken, &state64))
  {
    state = self->_state;
    v6 = state64;
    if (state != state64)
    {
      self->_state = state64;
      if ((*(_BYTE *)&self->_flags & 2) != 0)
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(WeakRetained, "notifyObserver:didChangeStateFrom:to:", self, state, v6);

      }
    }
  }
}

- (void)_invalidate
{
  int registrationToken;

  registrationToken = self->_registrationToken;
  if (registrationToken != -1)
  {
    notify_cancel(registrationToken);
    self->_registrationToken = -1;
  }
  objc_storeWeak((id *)&self->_delegate, 0);
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __32__SCDANotifyObserver_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __45__SCDANotifyObserver_getStateWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
}

uint64_t __27__SCDANotifyObserver_state__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

void __58__SCDANotifyObserver_initWithName_options_queue_delegate___block_invoke(uint64_t a1)
{
  const char *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void *v7;
  id v8;
  int out_token;

  out_token = -1;
  v2 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String");
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 8);
  v4 = MEMORY[0x24BDAC760];
  v5 = 3221225472;
  v6 = __58__SCDANotifyObserver_initWithName_options_queue_delegate___block_invoke_2;
  v7 = &unk_251749BB0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  if (!notify_register_dispatch(v2, &out_token, v3, &v4))
    *(_DWORD *)(*(_QWORD *)(a1 + 40) + 32) = out_token;
  if ((*(_BYTE *)(a1 + 56) & 1) != 0)
    objc_msgSend(*(id *)(a1 + 40), "_updateStateWithToken:", out_token, v4, v5, v6, v7);
  objc_destroyWeak(&v8);
}

void __58__SCDANotifyObserver_initWithName_options_queue_delegate___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleNotificationWithToken:", a2);

}

@end
