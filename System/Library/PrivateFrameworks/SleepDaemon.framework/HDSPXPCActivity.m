@implementation HDSPXPCActivity

- (HDSPXPCActivity)initWithEventName:(id)a3 options:(unint64_t)a4 criteria:(id)a5
{
  return -[HDSPXPCActivity initWithEventName:options:criteria:activity:](self, "initWithEventName:options:criteria:activity:", a3, a4, a5, 0);
}

- (HDSPXPCActivity)initWithEventName:(id)a3 options:(unint64_t)a4 criteria:(id)a5 activity:(id)a6
{
  id v10;
  id v11;
  id v12;
  HDSPXPCActivity *v13;
  uint64_t v14;
  NSString *name;
  HDSPXPCActivity *v16;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HDSPXPCActivity;
  v13 = -[HDSPXPCActivity init](&v18, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    name = v13->_name;
    v13->_name = (NSString *)v14;

    objc_storeStrong((id *)&v13->_criteria, a5);
    objc_storeStrong((id *)&v13->_activity, a6);
    v13->_options = a4;
    v16 = v13;
  }

  return v13;
}

- (BOOL)deferIfNecessary
{
  uint64_t v3;
  _xpc_activity_s *v4;
  _BOOL4 should_defer;
  _xpc_activity_s *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HDSPXPCActivity activity](self, "activity");
  v3 = objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HDSPXPCActivity activity](self, "activity");
    v4 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
    should_defer = xpc_activity_should_defer(v4);

    if (should_defer)
    {
      -[HDSPXPCActivity activity](self, "activity");
      v6 = (_xpc_activity_s *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = xpc_activity_set_state(v6, 3);

      HKSPLogForCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if ((v3 & 1) != 0)
      {
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
LABEL_9:

          return v3;
        }
        -[HDSPXPCActivity name](self, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v9;
        _os_log_impl(&dword_21610C000, v8, OS_LOG_TYPE_DEFAULT, "XPC activity was deferred (%{public}@)", (uint8_t *)&v11, 0xCu);
      }
      else
      {
        if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_9;
        -[HDSPXPCActivity name](self, "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138543362;
        v12 = v9;
        _os_log_error_impl(&dword_21610C000, v8, OS_LOG_TYPE_ERROR, "Failed to defer XPC activity (%{public}@)", (uint8_t *)&v11, 0xCu);
      }

      goto LABEL_9;
    }
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)name
{
  return self->_name;
}

- (OS_xpc_object)criteria
{
  return self->_criteria;
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_criteria, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
