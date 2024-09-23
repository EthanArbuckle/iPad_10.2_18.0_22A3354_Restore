@implementation _SBIdleTimerGlobalSettingMonitor

- (_SBIdleTimerGlobalSettingMonitor)initWithLabel:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  _SBIdleTimerGlobalSettingMonitor *v10;
  uint64_t v11;
  NSString *label;
  void *v14;
  void *v15;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIdleTimerGlobalStateMonitor.m"), 413, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("label"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBIdleTimerGlobalStateMonitor.m"), 414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("delegate"));

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)_SBIdleTimerGlobalSettingMonitor;
  v10 = -[_SBIdleTimerGlobalSettingMonitor init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v7, "copy");
    label = v10->_label;
    v10->_label = (NSString *)v11;

    objc_storeWeak((id *)&v10->_delegate, v9);
  }

  return v10;
}

- (id)formattedValue
{
  return &stru_1E8EC7EC0;
}

- (NSString)label
{
  return self->_label;
}

- (_SBIdleTimerGlobalSettingMonitorDelegate)delegate
{
  return (_SBIdleTimerGlobalSettingMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_label, 0);
}

- (BOOL)_updateCache
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

@end
