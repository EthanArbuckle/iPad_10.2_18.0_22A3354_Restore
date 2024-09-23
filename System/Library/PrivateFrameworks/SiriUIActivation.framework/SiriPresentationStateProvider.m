@implementation SiriPresentationStateProvider

- (SiriPresentationStateProvider)initWithSiriPresentationIdentifier:(int64_t)a3 delegate:(id)a4
{
  id v6;
  SiriPresentationStateProvider *v7;
  SiriPresentationStateProvider *v8;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *dispatchQueue;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SiriPresentationStateProvider;
  v7 = -[SiriPresentationStateProvider init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("SiriPresentationStateProvider", v9);
    dispatchQueue = v8->_dispatchQueue;
    v8->_dispatchQueue = (OS_dispatch_queue *)v10;

    -[SiriPresentationStateProvider _setupProviderForSiriPresentationIdentifier:](v8, "_setupProviderForSiriPresentationIdentifier:", a3);
  }

  return v8;
}

- (void)_setupProviderForSiriPresentationIdentifier:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __77__SiriPresentationStateProvider__setupProviderForSiriPresentationIdentifier___block_invoke;
  v3[3] = &__block_descriptor_40_e39_v16__0__SiriPresentationStateProvider_8l;
  v3[4] = a3;
  -[SiriPresentationStateProvider _invokeOnDispatchQueue:](self, "_invokeOnDispatchQueue:", v3);
}

void __77__SiriPresentationStateProvider__setupProviderForSiriPresentationIdentifier___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[5];

  v3 = (objc_class *)MEMORY[0x24BE907E8];
  v4 = a2;
  v5 = [v3 alloc];
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __77__SiriPresentationStateProvider__setupProviderForSiriPresentationIdentifier___block_invoke_2;
  v7[3] = &__block_descriptor_40_e40_v16__0___SASPresentationStateMutating__8l;
  v7[4] = *(_QWORD *)(a1 + 32);
  v6 = (id)objc_msgSend(v5, "initWithBuilder:", v7);
  objc_msgSend(v4, "_dispatchedDiffAndApplyMutatedStatus:", v6);

}

void __77__SiriPresentationStateProvider__setupProviderForSiriPresentationIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "stringWithSiriPresentationIdentifier:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPresentationIdentifier:", v5);

}

- (void)beginProvidingPresentationStateUpdates
{
  -[SiriPresentationStateProvider _invokeOnDispatchQueue:](self, "_invokeOnDispatchQueue:", &__block_literal_global);
}

void __71__SiriPresentationStateProvider_beginProvidingPresentationStateUpdates__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[SiriPresentationStateProvider beginProvidingPresentationStateUpdates]_block_invoke";
    _os_log_impl(&dword_215D55000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  objc_msgSend(v2, "setShouldProvideUpdates:", 1);
  if (objc_msgSend(v2, "updatesAvailable"))
  {
    objc_msgSend(v2, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "presentationStateProvider:presentationStateDidChange:", v2, v2[1]);

    objc_msgSend(v2, "setUpdatesAvailable:", 0);
  }

}

- (void)stopProvidingPresentationStateUpdatesAndResendLastUpdateOnResumption:(BOOL)a3
{
  _QWORD v3[4];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __102__SiriPresentationStateProvider_stopProvidingPresentationStateUpdatesAndResendLastUpdateOnResumption___block_invoke;
  v3[3] = &__block_descriptor_33_e39_v16__0__SiriPresentationStateProvider_8l;
  v4 = a3;
  -[SiriPresentationStateProvider _invokeOnDispatchQueue:](self, "_invokeOnDispatchQueue:", v3);
}

void __102__SiriPresentationStateProvider_stopProvidingPresentationStateUpdatesAndResendLastUpdateOnResumption___block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  NSObject *v4;
  int v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(unsigned __int8 *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[SiriPresentationStateProvider stopProvidingPresentationStateUpdatesAndResendLastUpdateOnResumption:]_block_invoke";
    v8 = 1024;
    v9 = v5;
    _os_log_impl(&dword_215D55000, v4, OS_LOG_TYPE_DEFAULT, "%s resendLastUpdateOnResumption: %{BOOL}d", (uint8_t *)&v6, 0x12u);
  }
  objc_msgSend(v3, "setShouldProvideUpdates:", 0);
  if (*(_BYTE *)(a1 + 32) && v3[1])
    objc_msgSend(v3, "setUpdatesAvailable:", 1);

}

- (void)barrierWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__SiriPresentationStateProvider_barrierWithCompletion___block_invoke;
  block[3] = &unk_24D47A518;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dispatchQueue, block);

}

uint64_t __55__SiriPresentationStateProvider_barrierWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[SiriPresentationStateProvider barrierWithCompletion:]_block_invoke";
    _os_log_impl(&dword_215D55000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_dispatchedDiffAndApplyMutatedStatus:(id)a3
{
  id v5;
  NSObject *v6;
  SASPresentationState *presentationState;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  SASPresentationState *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((-[SASPresentationState isEqual:](self->_presentationState, "isEqual:", v5) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_presentationState, a3);
    v6 = *MEMORY[0x24BE08FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
    {
      presentationState = self->_presentationState;
      v9 = 136315394;
      v10 = "-[SiriPresentationStateProvider _dispatchedDiffAndApplyMutatedStatus:]";
      v11 = 2112;
      v12 = presentationState;
      _os_log_impl(&dword_215D55000, v6, OS_LOG_TYPE_DEFAULT, "%s New Presentation State detected %@", (uint8_t *)&v9, 0x16u);
    }
    -[SiriPresentationStateProvider setUpdatesAvailable:](self, "setUpdatesAvailable:", 1);
    if (-[SiriPresentationStateProvider shouldProvideUpdates](self, "shouldProvideUpdates"))
    {
      -[SiriPresentationStateProvider delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "presentationStateProvider:presentationStateDidChange:", self, self->_presentationState);

      -[SiriPresentationStateProvider setUpdatesAvailable:](self, "setUpdatesAvailable:", 0);
    }
  }

}

- (void)_invokeOnDispatchQueue:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    dispatchQueue = self->_dispatchQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __56__SiriPresentationStateProvider__invokeOnDispatchQueue___block_invoke;
    block[3] = &unk_24D47A540;
    objc_copyWeak(&v8, &location);
    v7 = v4;
    dispatch_async(dispatchQueue, block);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

}

void __56__SiriPresentationStateProvider__invokeOnDispatchQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    WeakRetained = v3;
  }

}

- (SiriPresentationStateProviderDelegate)delegate
{
  return (SiriPresentationStateProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldProvideUpdates
{
  return self->_shouldProvideUpdates;
}

- (void)setShouldProvideUpdates:(BOOL)a3
{
  self->_shouldProvideUpdates = a3;
}

- (BOOL)updatesAvailable
{
  return self->_updatesAvailable;
}

- (void)setUpdatesAvailable:(BOOL)a3
{
  self->_updatesAvailable = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_presentationState, 0);
}

@end
