@implementation SBBackgroundFetchExternalRequest

- (id)initForAppInfo:(id)a3
{
  id v5;
  SBBackgroundFetchExternalRequest *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  UIFetchContentInBackgroundAction *action;
  void *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  objc_super v24;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBBackgroundMultitaskingManager.m"), 254, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appInfo != nil"));

  }
  v24.receiver = self;
  v24.super_class = (Class)SBBackgroundFetchExternalRequest;
  v6 = -[SBBackgroundFetchExternalRequest init](&v24, sel_init);
  if (v6)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__129;
    v22 = __Block_byref_object_dispose__129;
    v23 = objc_alloc(MEMORY[0x1E0CEA5C0]);
    +[SBBackgroundMultitaskingManager sharedInstance](SBBackgroundMultitaskingManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_createBackgroundFetchTaskForAppInfo:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_storeStrong((id *)&v6->_task, v8);
    v9 = (id)v19[5];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__SBBackgroundFetchExternalRequest_initForAppInfo___block_invoke;
    v15[3] = &unk_1E8EAB8E0;
    v10 = v8;
    v16 = v10;
    v17 = &v18;
    v11 = objc_msgSend(v9, "initWithHandler:", v15);
    action = v6->_action;
    v6->_action = (UIFetchContentInBackgroundAction *)v11;

    _Block_object_dispose(&v18, 8);
  }

  return v6;
}

void __51__SBBackgroundFetchExternalRequest_initForAppInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  NSObject *v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "result");
    v5 = 4;
    if (v4 == 1)
      v5 = 2;
    if (v4)
      v6 = v5;
    else
      v6 = 1;
  }
  else
  {
    SBLogCommon();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __51__SBBackgroundFetchExternalRequest_initForAppInfo___block_invoke_cold_1(a1, v7);

    v6 = 4;
  }
  -[SBBackgroundFetchTask finishWithResult:](*(_QWORD *)(a1 + 32), v6);

}

- (void)dealloc
{
  objc_super v3;

  -[SBBackgroundFetchTask finishWithResult:]((uint64_t)self->_task, 4uLL);
  -[UIFetchContentInBackgroundAction invalidate](self->_action, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBBackgroundFetchExternalRequest;
  -[SBBackgroundFetchExternalRequest dealloc](&v3, sel_dealloc);
}

- (void)execute
{
  SBBackgroundFetchTask *task;
  UIFetchContentInBackgroundAction *action;

  -[SBBackgroundFetchTask execute](self->_task, "execute");
  task = self->_task;
  self->_task = 0;

  action = self->_action;
  self->_action = 0;

}

- (UIFetchContentInBackgroundAction)action
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

void __51__SBBackgroundFetchExternalRequest_initForAppInfo___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Error completing %{public}@: invalid response (the process probably exited)", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_2_0();
}

@end
