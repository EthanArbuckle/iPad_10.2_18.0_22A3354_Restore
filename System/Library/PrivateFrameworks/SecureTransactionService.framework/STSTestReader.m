@implementation STSTestReader

- (id)startWithHandoverType:(unint64_t)a3 connectionHandler:(id)a4 invalidationHandler:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_2158CB26C;
  v14[3] = &unk_24D3A7400;
  v15 = v10;
  v11 = v10;
  -[STSTestReader startWithHandoverType:tnepStatusHandler:connectionHandler:invalidationErrorHandler:completion:](self, "startWithHandoverType:tnepStatusHandler:connectionHandler:invalidationErrorHandler:completion:", a3, 0, a4, v14, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)startWithHandoverType:(unint64_t)a3 connectionHandler:(id)a4 invalidationErrorHandler:(id)a5 completion:(id)a6
{
  return -[STSTestReader startWithHandoverType:tnepStatusHandler:connectionHandler:invalidationErrorHandler:completion:](self, "startWithHandoverType:tnepStatusHandler:connectionHandler:invalidationErrorHandler:completion:", a3, 0, a4, a5, a6);
}

- (id)startWithHandoverType:(unint64_t)a3 tnepStatusHandler:(id)a4 connectionHandler:(id)a5 invalidationErrorHandler:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  void *v19;
  objc_super v21;
  _QWORD aBlock[4];
  id v23;
  os_activity_scope_state_s state;

  v12 = a5;
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = _os_activity_create(&dword_2158A9000, "startWithHandoverType:tnepStatusHandler:connectionHandler:invalidationHandler:completion:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v16, &state);
  os_activity_scope_leave(&state);

  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2158CB3D0;
  aBlock[3] = &unk_24D3A76A8;
  v23 = v12;
  v17 = v12;
  v18 = _Block_copy(aBlock);
  v21.receiver = self;
  v21.super_class = (Class)STSTestReader;
  -[STSReader startWithHandoverType:connectionHandler:tnepStatusHandler:invalidationErrorHandler:completion:](&v21, sel_startWithHandoverType_connectionHandler_tnepStatusHandler_invalidationErrorHandler_completion_, a3, v18, v15, v14, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)sendDocumentRequest:(id)a3 timeoutInterval:(double)a4 responseHandler:(id)a5
{
  MEMORY[0x24BEDD108](self, sel_sendDocumentRequest_timeoutInterval_sessionTermination_responseHandler_);
}

@end
