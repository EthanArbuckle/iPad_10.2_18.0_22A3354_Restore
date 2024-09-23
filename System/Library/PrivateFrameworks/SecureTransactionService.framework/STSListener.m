@implementation STSListener

- (STSListener)init
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  const char *ClassName;
  NSObject *v7;
  dispatch_queue_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STSListener;
  v5 = -[STSListener init](&v13, sel_init);
  if (v5)
  {
    sub_2158CDFE0(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener init]", 29, (uint64_t)"Creating listener", v2, v3, v4, (uint64_t)v13.receiver);
    ClassName = object_getClassName(v5);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(ClassName, v7);
    v9 = (void *)*((_QWORD *)v5 + 1);
    *((_QWORD *)v5 + 1) = v8;

    v10 = objc_opt_new();
    v11 = (void *)*((_QWORD *)v5 + 4);
    *((_QWORD *)v5 + 4) = v10;

    dispatch_suspend(*((dispatch_object_t *)v5 + 1));
  }
  return (STSListener *)v5;
}

- (id)startWithDelegate:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v12[6];
  os_activity_scope_state_s state;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = _os_activity_create(&dword_2158A9000, "startWithDelegate:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener startWithDelegate:]", 44, self, CFSTR("Starting withdelegate"), v6, v7, v12[0]);
  objc_storeWeak((id *)&self->_delegate, v4);
  state.opaque[0] = 0;
  state.opaque[1] = (uint64_t)&state;
  v14 = 0x3032000000;
  v15 = sub_2158C7DD0;
  v16 = sub_2158C7DE0;
  v17 = 0;
  -[STSHardwareManagerWrapper manager](self->_nfHwManager, "manager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = (uint64_t)sub_2158C7DE8;
  v12[3] = (uint64_t)&unk_24D3A75E0;
  v12[4] = (uint64_t)self;
  v12[5] = (uint64_t)&state;
  v9 = (id)objc_msgSend(v8, "startFieldDetectSession:", v12);

  v10 = *(id *)(state.opaque[1] + 40);
  _Block_object_dispose(&state, 8);

  return v10;
}

- (id)stop
{
  NSObject *v3;
  NFFieldDetectSession *nearFieldFdSession;
  _QWORD v6[5];
  os_activity_scope_state_s state;

  v3 = _os_activity_create(&dword_2158A9000, "stop", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  nearFieldFdSession = self->_nearFieldFdSession;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = sub_2158C7F70;
  v6[3] = &unk_24D3A6F58;
  v6[4] = self;
  -[NFFieldDetectSession endSessionWithCompletion:](nearFieldFdSession, "endSessionWithCompletion:", v6);
  return 0;
}

- (void)didEndSession
{
  uint64_t v2;
  uint64_t v3;
  NSObject *callbackQueue;
  uint64_t v6;
  _QWORD block[5];

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didEndSession]", 76, self, &stru_24D3A78C0, v2, v3, v6);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2158C8004;
  block[3] = &unk_24D3A6F58;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

- (void)didStartSession:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *callbackQueue;
  id v8;
  uint64_t v9[5];
  id v10;

  v4 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didStartSession:]", 87, self, &stru_24D3A78C0, v5, v6, v9[0]);
  callbackQueue = self->_callbackQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = (uint64_t)sub_2158C8128;
  v9[3] = (uint64_t)&unk_24D3A6EE0;
  v9[4] = (uint64_t)self;
  v10 = v4;
  v8 = v4;
  dispatch_async(callbackQueue, v9);

}

- (void)didEnterField:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *callbackQueue;
  id v8;
  uint64_t v9[5];
  id v10;

  v4 = a3;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didEnterField:]", 98, self, &stru_24D3A78C0, v5, v6, v9[0]);
  callbackQueue = self->_callbackQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = (uint64_t)sub_2158C824C;
  v9[3] = (uint64_t)&unk_24D3A6EE0;
  v9[4] = (uint64_t)self;
  v10 = v4;
  v8 = v4;
  dispatch_async(callbackQueue, v9);

}

- (void)didExitField
{
  uint64_t v2;
  uint64_t v3;
  NSObject *callbackQueue;
  uint64_t v6;
  _QWORD block[5];

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener didExitField]", 110, self, &stru_24D3A78C0, v2, v3, v6);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_2158C8358;
  block[3] = &unk_24D3A6F58;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

- (void)fieldDetectSession:(id)a3 didDetectField:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener fieldDetectSession:didDetectField:]", 121, self, CFSTR("fieldPresent=%d"), v4, v5, a4);
}

- (void)fieldDetectSession:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = a4;
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener fieldDetectSession:didEnterFieldWithNotification:]", 126, self, CFSTR("%@"), v6, v7, (uint64_t)v5);
  sub_2158CEFF0(v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[STSListener didEnterField:](self, "didEnterField:", v8);
}

- (void)fieldDetectSessionDidExitField:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSListener fieldDetectSessionDidExitField:]", 132, self, &stru_24D3A78C0, v3, v4, v6);
  MEMORY[0x24BEDD108](self, sel_didExitField);
}

- (void)fieldDetectSessionDidEndUnexpectedly:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSListener fieldDetectSessionDidEndUnexpectedly:]", 137, self, &stru_24D3A78C0, v3, v4, v6);
  MEMORY[0x24BEDD108](self, sel_didEndSession);
}

- (STSListenerDelegate)delegate
{
  return (STSListenerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nfHwManager, 0);
  objc_storeStrong((id *)&self->_lastField, 0);
  objc_storeStrong((id *)&self->_nearFieldFdSession, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
}

@end
