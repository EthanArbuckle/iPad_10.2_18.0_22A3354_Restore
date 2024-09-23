@implementation _SBAccessibilityWindowHostingControllerServerTarget

- (_SBAccessibilityWindowHostingControllerServerTarget)initWithConnection:(id)a3 proxyInterface:(id)a4
{
  id v6;
  id v7;
  _SBAccessibilityWindowHostingControllerServerTarget *v8;
  _SBAccessibilityWindowHostingControllerServerTarget *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SBAccessibilityWindowHostingControllerServerTarget;
  v8 = -[_SBAccessibilityWindowHostingControllerServerTarget init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeWeak((id *)&v9->_proxyInterface, v7);
  }

  return v9;
}

- (void)registerWindowWithContextID:(id)a3 atLevel:(id)a4
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
  v10[2] = __91___SBAccessibilityWindowHostingControllerServerTarget_registerWindowWithContextID_atLevel___block_invoke;
  v10[3] = &unk_1E8E9E270;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[_SBAccessibilityWindowHostingControllerServerTarget _performBlock:](self, "_performBlock:", v10);

}

- (void)unregisterWindowWithContextID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __85___SBAccessibilityWindowHostingControllerServerTarget_unregisterWindowWithContextID___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_SBAccessibilityWindowHostingControllerServerTarget _performBlock:](self, "_performBlock:", v6);

}

+ (_SBAccessibilityWindowHostingControllerServerTarget)currentTarget
{
  if (_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sOnceToken != -1)
    dispatch_once(&_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_97);
  return (_SBAccessibilityWindowHostingControllerServerTarget *)pthread_getspecific(_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sSBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey);
}

- (void)_performBlock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sOnceToken != -1)
    dispatch_once(&_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_97);
  pthread_setspecific(_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sSBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey, self);
  v4[2]();
  if (_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sOnceToken != -1)
    dispatch_once(&_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_97);
  pthread_setspecific(_SBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey_sSBAccessibilityWindowHostingControllerServerTargetThreadDictionaryKey, 0);

}

- (BSServiceConnection)connection
{
  return (BSServiceConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (SBSAccessibilityWindowHostingClientToServerInterface)proxyInterface
{
  return (SBSAccessibilityWindowHostingClientToServerInterface *)objc_loadWeakRetained((id *)&self->_proxyInterface);
}

- (void)setProxyInterface:(id)a3
{
  objc_storeWeak((id *)&self->_proxyInterface, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxyInterface);
  objc_destroyWeak((id *)&self->_connection);
}

@end
