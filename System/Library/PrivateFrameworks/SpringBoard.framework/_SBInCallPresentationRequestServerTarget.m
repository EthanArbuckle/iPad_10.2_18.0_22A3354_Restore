@implementation _SBInCallPresentationRequestServerTarget

- (_SBInCallPresentationRequestServerTarget)initWithConnection:(id)a3 proxyInterface:(id)a4
{
  id v6;
  id v7;
  _SBInCallPresentationRequestServerTarget *v8;
  _SBInCallPresentationRequestServerTarget *v9;
  uint64_t v10;
  NSUUID *clientIdentifier;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_SBInCallPresentationRequestServerTarget;
  v8 = -[_SBInCallPresentationRequestServerTarget init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeWeak((id *)&v9->_proxyInterface, v7);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v10 = objc_claimAutoreleasedReturnValue();
    clientIdentifier = v9->_clientIdentifier;
    v9->_clientIdentifier = (NSUUID *)v10;

  }
  return v9;
}

- (void)presentWithConfiguration:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80___SBInCallPresentationRequestServerTarget_presentWithConfiguration_completion___block_invoke;
  v10[3] = &unk_1E8E9F7B8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[_SBInCallPresentationRequestServerTarget _performBlock:](self, "_performBlock:", v10);

}

+ (_SBInCallPresentationRequestServerTarget)currentTarget
{
  if (_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sOnceToken != -1)
    dispatch_once(&_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_42);
  return (_SBInCallPresentationRequestServerTarget *)pthread_getspecific(_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sSBInCallPresentationRequestServerTargetThreadDictionaryKey);
}

- (void)_performBlock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sOnceToken != -1)
    dispatch_once(&_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_42);
  pthread_setspecific(_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sSBInCallPresentationRequestServerTargetThreadDictionaryKey, self);
  v4[2]();
  if (_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sOnceToken != -1)
    dispatch_once(&_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_42);
  pthread_setspecific(_SBInCallPresentationRequestServerTargetThreadDictionaryKey_sSBInCallPresentationRequestServerTargetThreadDictionaryKey, 0);

}

- (BSServiceConnection)connection
{
  return (BSServiceConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (SBSInCallPresentationClientToServerInterface)proxyInterface
{
  return (SBSInCallPresentationClientToServerInterface *)objc_loadWeakRetained((id *)&self->_proxyInterface);
}

- (void)setProxyInterface:(id)a3
{
  objc_storeWeak((id *)&self->_proxyInterface, a3);
}

- (NSUUID)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_destroyWeak((id *)&self->_proxyInterface);
  objc_destroyWeak((id *)&self->_connection);
}

@end
