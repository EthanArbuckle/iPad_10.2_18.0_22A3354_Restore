@implementation _SBRemoteAlertHandleServerTarget

- (_SBRemoteAlertHandleServerTarget)initWithConnection:(id)a3 proxyInterface:(id)a4
{
  id v6;
  id v7;
  _SBRemoteAlertHandleServerTarget *v8;
  _SBRemoteAlertHandleServerTarget *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SBRemoteAlertHandleServerTarget;
  v8 = -[_SBRemoteAlertHandleServerTarget init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_connection, v6);
    objc_storeWeak((id *)&v9->_proxyInterface, v7);
  }

  return v9;
}

- (id)remoteAlertHandleContextsForDefinition:(id)a3 allowsCreationValue:(id)a4 configurationContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__114;
  v25 = __Block_byref_object_dispose__114;
  v26 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __116___SBRemoteAlertHandleServerTarget_remoteAlertHandleContextsForDefinition_allowsCreationValue_configurationContext___block_invoke;
  v16[3] = &unk_1E8EB66B8;
  v20 = &v21;
  v16[4] = self;
  v11 = v8;
  v17 = v11;
  v12 = v9;
  v18 = v12;
  v13 = v10;
  v19 = v13;
  -[_SBRemoteAlertHandleServerTarget _performBlock:](self, "_performBlock:", v16);
  v14 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v14;
}

- (id)createRemoteAlertHandleContextWithDefinition:(id)a3 configurationContext:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__114;
  v20 = __Block_byref_object_dispose__114;
  v21 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102___SBRemoteAlertHandleServerTarget_createRemoteAlertHandleContextWithDefinition_configurationContext___block_invoke;
  v12[3] = &unk_1E8EA9150;
  v15 = &v16;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v9 = v7;
  v14 = v9;
  -[_SBRemoteAlertHandleServerTarget _performBlock:](self, "_performBlock:", v12);
  v10 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  return v10;
}

- (void)activateRemoteAlertHandleWithID:(id)a3 activationContext:(id)a4
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
  v10[2] = __86___SBRemoteAlertHandleServerTarget_activateRemoteAlertHandleWithID_activationContext___block_invoke;
  v10[3] = &unk_1E8E9E270;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[_SBRemoteAlertHandleServerTarget _performBlock:](self, "_performBlock:", v10);

}

- (void)invalidateRemoteAlertHandleWithID:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70___SBRemoteAlertHandleServerTarget_invalidateRemoteAlertHandleWithID___block_invoke;
  v6[3] = &unk_1E8E9E820;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[_SBRemoteAlertHandleServerTarget _performBlock:](self, "_performBlock:", v6);

}

+ (_SBRemoteAlertHandleServerTarget)currentTarget
{
  if (_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sOnceToken != -1)
    dispatch_once(&_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_368);
  return (_SBRemoteAlertHandleServerTarget *)pthread_getspecific(_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sSBRemoteAlertHandleServerTargetThreadDictionaryKey);
}

- (void)_performBlock:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sOnceToken != -1)
    dispatch_once(&_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_368);
  pthread_setspecific(_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sSBRemoteAlertHandleServerTargetThreadDictionaryKey, self);
  v4[2]();
  if (_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sOnceToken != -1)
    dispatch_once(&_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sOnceToken, &__block_literal_global_368);
  pthread_setspecific(_SBRemoteAlertHandleServerTargetThreadDictionaryKey_sSBRemoteAlertHandleServerTargetThreadDictionaryKey, 0);

}

- (BSServiceConnection)connection
{
  return (BSServiceConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (SBSRemoteAlertHandleServiceServerInterface)proxyInterface
{
  return (SBSRemoteAlertHandleServiceServerInterface *)objc_loadWeakRetained((id *)&self->_proxyInterface);
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
