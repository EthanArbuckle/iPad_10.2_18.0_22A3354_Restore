@implementation SCLSchoolMode

- (SCLSchoolMode)init
{
  __assert_rtn("-[SCLSchoolMode init]", "SCLSchoolMode.m", 34, "false");
}

- (SCLSchoolMode)initWithIdentifier:(id)a3
{
  return -[SCLSchoolMode initWithIdentifier:delegate:](self, "initWithIdentifier:delegate:", a3, 0);
}

- (SCLSchoolMode)initWithIdentifier:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SCLSchoolMode *v9;

  v6 = a4;
  v7 = a3;
  SCLAutoUpdatingPairingID();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SCLSchoolMode initWithIdentifier:pairingID:delegate:](self, "initWithIdentifier:pairingID:delegate:", v7, v8, v6);

  return v9;
}

- (SCLSchoolMode)initWithIdentifier:(id)a3 pairingID:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  SCLSchoolModeConfiguration *v11;
  SCLSchoolMode *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc_init(SCLSchoolModeConfiguration);
  -[SCLSchoolModeConfiguration setIdentifier:](v11, "setIdentifier:", v10);

  -[SCLSchoolModeConfiguration setPairingID:](v11, "setPairingID:", v9);
  -[SCLSchoolModeConfiguration setDelegate:](v11, "setDelegate:", v8);

  v12 = -[SCLSchoolMode initWithConfiguration:](self, "initWithConfiguration:", v11);
  -[SCLSchoolMode resume](v12, "resume");

  return v12;
}

- (SCLSchoolMode)initWithConfiguration:(id)a3
{
  id v4;
  SCLSchoolMode *v5;
  uint64_t v6;
  SCLSchoolModeConfiguration *configuration;
  void *v8;
  SCLSchoolModeConfiguration *v9;
  id v10;
  dispatch_queue_t v11;
  SCLSchoolModeXPCClient *v12;
  SCLSchoolModeXPCClient *xpcClient;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCLSchoolMode;
  v5 = -[SCLSchoolMode init](&v15, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    configuration = v5->_configuration;
    v5->_configuration = (SCLSchoolModeConfiguration *)v6;

    -[SCLSchoolModeConfiguration targetQueue](v5->_configuration, "targetQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = v5->_configuration;
      objc_msgSend(v4, "identifier");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4), 0);
      -[SCLSchoolModeConfiguration setTargetQueue:](v9, "setTargetQueue:", v11);

    }
    v5->_lock._os_unfair_lock_opaque = 0;
    v12 = -[SCLSchoolModeXPCClient initWithDelegate:configuration:]([SCLSchoolModeXPCClient alloc], "initWithDelegate:configuration:", v5, v5->_configuration);
    xpcClient = v5->_xpcClient;
    v5->_xpcClient = v12;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[SCLSchoolModeXPCClient invalidate](self->_xpcClient, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SCLSchoolMode;
  -[SCLSchoolMode dealloc](&v3, sel_dealloc);
}

- (NSString)identifier
{
  return -[SCLSchoolModeConfiguration identifier](self->_configuration, "identifier");
}

- (id)delegate
{
  return -[SCLSchoolModeConfiguration delegate](self->_configuration, "delegate");
}

- (SCLState)state
{
  return -[SCLSchoolModeXPCClient state](self->_xpcClient, "state");
}

- (SCLScheduleSettings)scheduleSettings
{
  return -[SCLSchoolModeXPCClient scheduleSettings](self->_xpcClient, "scheduleSettings");
}

- (BOOL)isLoaded
{
  return -[SCLSchoolModeXPCClient isLoaded](self->_xpcClient, "isLoaded");
}

- (void)resume
{
  if (-[SCLSchoolMode resumeState](self, "resumeState"))
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCA98], CFSTR("SCLSchoolMode was resumed more than once %@"), self);
  }
  else
  {
    -[SCLSchoolMode setResumeState:](self, "setResumeState:", 1);
    -[SCLSchoolModeXPCClient resume](self->_xpcClient, "resume");
    -[SCLSchoolMode setResumeState:](self, "setResumeState:", 2);
  }
}

- (void)setActive:(BOOL)a3 completion:(id)a4
{
  -[SCLSchoolMode setActive:options:completion:](self, "setActive:options:completion:", a3, 0, a4);
}

- (void)applyScheduleSettings:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_activity_scope_state_s v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_21E4AD000, "ApplyScheduleSettings", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v8, &v10);
  scl_framework_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v6;
    _os_log_impl(&dword_21E4AD000, v9, OS_LOG_TYPE_DEFAULT, "Apply schedule settings: %{public}@", buf, 0xCu);
  }

  -[SCLSchoolModeXPCClient applyScheduleSettings:completion:](self->_xpcClient, "applyScheduleSettings:completion:", v6, v7);
  os_activity_scope_leave(&v10);

}

- (void)fetchRecentUnlockHistoryItemsWithCompletion:(id)a3
{
  -[SCLSchoolModeXPCClient fetchRecentUnlockHistoryItemsWithCompletion:](self->_xpcClient, "fetchRecentUnlockHistoryItemsWithCompletion:", a3);
}

- (void)_assertQueueIfReady
{
  unint64_t v3;
  NSObject *v4;

  v3 = -[SCLSchoolMode resumeState](self, "resumeState");
  switch(v3)
  {
    case 2uLL:
      goto LABEL_7;
    case 1uLL:
      if (-[SCLSchoolModeConfiguration loadsSynchronously](self->_configuration, "loadsSynchronously"))
        return;
LABEL_7:
      -[SCLSchoolModeConfiguration targetQueue](self->_configuration, "targetQueue");
      v4 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v4);

      return;
    case 0uLL:
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB0], CFSTR("Got delegate callback but not resumed: %@"), self);
      break;
  }
}

- (void)client:(id)a3 didUpdateToState:(id)a4 fromState:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  -[SCLSchoolMode _assertQueueIfReady](self, "_assertQueueIfReady");
  -[SCLSchoolMode delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SCLSchoolMode delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "schoolMode:didUpdateState:fromState:", self, v11, v7);

  }
}

- (void)client:(id)a3 didUpdateScheduleSettings:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  -[SCLSchoolMode _assertQueueIfReady](self, "_assertQueueIfReady");
  -[SCLSchoolMode delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SCLSchoolMode delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "schoolMode:didUpdateScheduleSettings:", self, v8);

  }
}

- (void)clientDidChangeUnlockHistory:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[SCLSchoolMode _assertQueueIfReady](self, "_assertQueueIfReady", a3);
  -[SCLSchoolMode delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[SCLSchoolMode delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "schoolModeDidUpdateUnlockHistory:", self);

  }
}

- (void)client:(id)a3 didLoadScheduleSettings:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  -[SCLSchoolMode _assertQueueIfReady](self, "_assertQueueIfReady");
  -[SCLSchoolMode delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[SCLSchoolMode delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "schoolMode:didLoadScheduleSettings:", self, v11);

  }
  -[SCLSchoolMode delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[SCLSchoolMode delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "schoolModeDidLoad:", self);

  }
}

- (unint64_t)resumeState
{
  return self->_resumeState;
}

- (void)setResumeState:(unint64_t)a3
{
  self->_resumeState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_xpcClient, 0);
}

- (void)addUnlockHistoryItem:(id)a3 completion:(id)a4
{
  -[SCLSchoolModeXPCClient addUnlockHistoryItem:completion:](self->_xpcClient, "addUnlockHistoryItem:completion:", a3, a4);
}

- (void)deleteHistoryWithCompletion:(id)a3
{
  -[SCLSchoolModeXPCClient deleteHistoryWithCompletion:](self->_xpcClient, "deleteHistoryWithCompletion:", a3);
}

- (void)noteSignificantUserInteraction
{
  NSObject *v3;
  NSObject *v4;
  os_activity_scope_state_s v5;
  uint8_t buf[4];
  SCLSchoolMode *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = _os_activity_create(&dword_21E4AD000, "NoteSignificantUserInteraction", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_DEFAULT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v3, &v5);
  scl_framework_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v7 = self;
    _os_log_impl(&dword_21E4AD000, v4, OS_LOG_TYPE_DEFAULT, "NoteSignificantUserInteraction for %@", buf, 0xCu);
  }

  -[SCLSchoolModeXPCClient noteSignificantUserInteraction](self->_xpcClient, "noteSignificantUserInteraction");
  os_activity_scope_leave(&v5);

}

- (void)dumpState
{
  -[SCLSchoolModeXPCClient dumpState](self->_xpcClient, "dumpState");
}

- (void)triggerRemoteSync
{
  -[SCLSchoolModeXPCClient triggerRemoteSync](self->_xpcClient, "triggerRemoteSync");
}

@end
