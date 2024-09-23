@implementation SYApplicationStateObserver

- (BOOL)appIsActive
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_appStateIsActive);
  return v2 & 1;
}

uint64_t __60__SYApplicationStateObserver__updateAppStateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_updateAppStateOnMainThread");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_handleAppBecomeActive:(id)a3
{
  id v4;
  id becomeActiveHandler;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  becomeActiveHandler = self->_becomeActiveHandler;
  if (becomeActiveHandler)
  {
    v6 = (void *)objc_msgSend(becomeActiveHandler, "copy");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__SYApplicationStateObserver__handleAppBecomeActive___block_invoke;
    v8[3] = &unk_1E757B620;
    v10 = v6;
    v9 = v4;
    v7 = v6;
    -[SYApplicationStateObserver _updateAppStateWithCompletion:](self, "_updateAppStateWithCompletion:", v8);

  }
}

- (void)registerForAppStateNotifications
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getUIApplicationWillResignActiveNotification(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("SYApplicationStateObserver.m"), 23, CFSTR("%s"), OUTLINED_FUNCTION_0_3());

  __break(1u);
}

- (SYApplicationStateObserver)initWithBecomeActiveHandler:(id)a3 resignActiveHandler:(id)a4
{
  id v6;
  id v7;
  SYApplicationStateObserver *v8;
  SYApplicationStateObserver *v9;
  uint64_t v10;
  id becomeActiveHandler;
  uint64_t v12;
  id resignActiveHandler;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SYApplicationStateObserver;
  v8 = -[SYApplicationStateObserver init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    atomic_store(0, (unsigned __int8 *)&v8->_appStateIsActive);
    v10 = objc_msgSend(v6, "copy");
    becomeActiveHandler = v9->_becomeActiveHandler;
    v9->_becomeActiveHandler = (id)v10;

    v12 = objc_msgSend(v7, "copy");
    resignActiveHandler = v9->_resignActiveHandler;
    v9->_resignActiveHandler = (id)v12;

    v9->_needsRegisterForAppStateNotifications = 1;
    -[SYApplicationStateObserver _updateAppStateWithCompletion:](v9, "_updateAppStateWithCompletion:", 0);
  }

  return v9;
}

- (void)_updateAppStateWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  _QWORD v5[5];
  void (**v6)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    -[SYApplicationStateObserver _updateAppStateOnMainThread](self, "_updateAppStateOnMainThread");
    if (v4)
      v4[2](v4);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __60__SYApplicationStateObserver__updateAppStateWithCompletion___block_invoke;
    v5[3] = &unk_1E757B850;
    v5[4] = self;
    v6 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

- (void)_updateAppStateOnMainThread
{
  unsigned __int8 v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if ((_localUIApplicationIsExtension() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2050000000;
    v4 = (void *)getUIApplicationClass_softClass_0;
    v11 = getUIApplicationClass_softClass_0;
    if (!getUIApplicationClass_softClass_0)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __getUIApplicationClass_block_invoke_0;
      v7[3] = &unk_1E757B260;
      v7[4] = &v8;
      __getUIApplicationClass_block_invoke_0((uint64_t)v7);
      v4 = (void *)v9[3];
    }
    v5 = objc_retainAutorelease(v4);
    _Block_object_dispose(&v8, 8);
    objc_msgSend(v5, "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "applicationState") == 0;

  }
  atomic_store(v3, (unsigned __int8 *)&self->_appStateIsActive);
}

uint64_t __53__SYApplicationStateObserver__handleAppBecomeActive___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_handleAppResignActive:(id)a3
{
  id v4;
  id resignActiveHandler;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  resignActiveHandler = self->_resignActiveHandler;
  if (resignActiveHandler)
  {
    v6 = (void *)objc_msgSend(resignActiveHandler, "copy");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __53__SYApplicationStateObserver__handleAppResignActive___block_invoke;
    v8[3] = &unk_1E757B620;
    v10 = v6;
    v9 = v4;
    v7 = v6;
    -[SYApplicationStateObserver _updateAppStateWithCompletion:](self, "_updateAppStateWithCompletion:", v8);

  }
}

uint64_t __53__SYApplicationStateObserver__handleAppResignActive___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resignActiveHandler, 0);
  objc_storeStrong(&self->_becomeActiveHandler, 0);
}

@end
