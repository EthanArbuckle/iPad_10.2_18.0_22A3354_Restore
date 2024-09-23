@implementation STSSessionBase

- (STSSessionBase)init
{
  STSSessionBase *v2;
  NSObject *v3;
  NSObject *v4;
  const char *ClassName;
  dispatch_queue_t v6;
  OS_dispatch_queue *callbackQueue;
  uint64_t v8;
  STSHardwareManagerWrapper *nfHwManager;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)STSSessionBase;
  v2 = -[STSSessionBase init](&v11, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_USER_INTERACTIVE, -1);
    v4 = objc_claimAutoreleasedReturnValue();

    ClassName = object_getClassName(v2);
    v6 = dispatch_queue_create(ClassName, v4);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v6;

    v2->_sessionUpdateLock._os_unfair_lock_opaque = 0;
    v8 = objc_opt_new();
    nfHwManager = v2->_nfHwManager;
    v2->_nfHwManager = (STSHardwareManagerWrapper *)v8;

  }
  return v2;
}

- (void)dealloc
{
  uint64_t v2;
  uint64_t v3;
  objc_super v5;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase dealloc]", 47, self, &stru_24D3A78C0, v2, v3, (uint64_t)v5.receiver);
  -[STSSessionBase clearSessionTimer](self, "clearSessionTimer");
  -[STSSessionBase _tearDownOnQueue:completion:](self, "_tearDownOnQueue:completion:", 0, 0);
  v5.receiver = self;
  v5.super_class = (Class)STSSessionBase;
  -[STSSessionBase dealloc](&v5, sel_dealloc);
}

- (id)createHandlerForCredential:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t vars0;

  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase createHandlerForCredential:]", 56, self, CFSTR("Subclass must implement this!"), v3, v4, vars0);
  return 0;
}

- (id)nfHardwareManager
{
  return -[STSHardwareManagerWrapper manager](self->_nfHwManager, "manager");
}

- (void)startWithDelegate:(id)a3 isFirstInQueue:(BOOL *)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD aBlock[5];
  id v14;
  BOOL *v15;

  v6 = a3;
  -[STSSessionBase setDelegate:](self, "setDelegate:", v6);
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_2158ACB98;
  aBlock[3] = &unk_24D3A6E68;
  aBlock[4] = self;
  v14 = v6;
  v15 = a4;
  v7 = v6;
  v8 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[STSSessionBase masterSESession](self, "masterSESession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase startWithDelegate:isFirstInQueue:]", 112, self, CFSTR("Previous session exists, tear down now"), v10, v11, v12);
    -[STSSessionBase _tearDownOnQueue:completion:](self, "_tearDownOnQueue:completion:", 1, v8);
  }
  else
  {
    v8[2](v8);
  }

}

- (void)startWithDelegate:(id)a3 isFirstInQueue:(BOOL *)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  uint64_t v15[4];
  id v16;
  id v17;
  os_activity_scope_state_s state;

  v8 = a3;
  v9 = a5;
  v10 = _os_activity_create(&dword_2158A9000, "startWithDelegate:isFirstInQueue:completion:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase startWithDelegate:isFirstInQueue:completion:]", 123, self, &stru_24D3A78C0, v11, v12, v15[0]);
  -[STSSessionBase canStartSession](self, "canStartSession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[STSSessionBase callbackQueue](self, "callbackQueue");
    v14 = objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = (uint64_t)sub_2158AD058;
    v15[3] = (uint64_t)&unk_24D3A6E90;
    v17 = v9;
    v16 = v13;
    dispatch_async(v14, v15);

  }
  else
  {
    -[STSSessionBase setTheStartCallback:](self, "setTheStartCallback:", v9);
    -[STSSessionBase startWithDelegate:isFirstInQueue:](self, "startWithDelegate:isFirstInQueue:", v8, a4);
  }

}

- (id)canStartSession
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase canStartSession]", 136, self, CFSTR("Subclass must implement this!"), v2, v3, v13);
  v5 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v15[1] = &unk_24D3B2810;
  v14[1] = CFSTR("Line");
  v14[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v8;
  v14[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 137);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 10, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)endSessionWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[5];
  id v11;
  id v12;
  os_activity_scope_state_s state;

  v4 = a3;
  v5 = _os_activity_create(&dword_2158A9000, "endSessionWithCompletion:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase endSessionWithCompletion:]", 142, self, &stru_24D3A78C0, v6, v7, v9);
  objc_initWeak((id *)&state, self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_2158AD34C;
  v10[3] = &unk_24D3A6EB8;
  objc_copyWeak(&v12, (id *)&state);
  v8 = v4;
  v10[4] = self;
  v11 = v8;
  -[STSSessionBase _tearDownOnQueue:completion:](self, "_tearDownOnQueue:completion:", 1, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)&state);

}

- (id)activateChildSession
{
  void *v4;
  void *v5;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x24BDAC8D0];
  -[STSSessionBase handler](self, "handler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handoffToken");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    return 0;
  -[STSSessionBase masterSESession](self, "masterSESession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v7, "createSessionHandoffToken:", &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v20;

  if (v9)
  {
    v10 = v9;
  }
  else
  {
    if (objc_msgSend(v8, "length"))
    {
      sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase activateChildSession]", 189, self, CFSTR("activating new handler with token: %@"), v11, v12, (uint64_t)v8);
      -[STSSessionBase handler](self, "handler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "activateWithHandoffToken:", v8);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase activateChildSession]", 185, self, CFSTR("Invalid token"), v11, v12, v19);
      v14 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v22[0] = v15;
      v22[1] = &unk_24D3B2828;
      v21[1] = CFSTR("Line");
      v21[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2] = v16;
      v21[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 186);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22[3] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", v13, 9, v18);
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return v10;
}

- (id)setActiveCredential:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  os_activity_scope_state_s state;
  _QWORD v54[4];
  _QWORD v55[4];
  _QWORD v56[4];
  _QWORD v57[5];

  v57[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = _os_activity_create(&dword_2158A9000, "setActiveCredential:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 198, self, CFSTR("%@"), v7, v8, (uint64_t)v5);
  -[STSSessionBase handler](self, "handler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (!v5
      || (-[STSSessionBase handler](self, "handler"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v12, "supportedCredentialType"),
          v14 = objc_msgSend(v5, "type"),
          v12,
          v13 == v14))
    {
      v15 = 0;
      goto LABEL_11;
    }
    -[STSSessionBase handler](self, "handler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "activeSTSCredential");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 210, self, CFSTR("new handler required, switching credential from %@ to %@"), v19, v20, (uint64_t)v18);

    -[STSSessionBase createHandlerForCredential:](self, "createHandlerForCredential:", v5);
    v21 = objc_claimAutoreleasedReturnValue();
    if (!v21)
    {
      v46 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v47;
      v57[1] = &unk_24D3B2840;
      v56[1] = CFSTR("Line");
      v56[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2), v5);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v57[2] = v48;
      v56[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 213);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v57[3] = v49;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 4);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "errorWithDomain:code:userInfo:", v40, 11, v50);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_18;
    }
    v16 = (void *)v21;
    -[STSSessionBase handler](self, "handler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tearDownWithCompletion:", 0);

    -[STSSessionBase setHandler:](self, "setHandler:", v16);
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 219, self, CFSTR("Waiting for Control SE session ready"), v23, v24, v52);
    -[STSSessionBase waitForControlSessionToBeReady:](self, "waitForControlSessionToBeReady:", 1);
    v25 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v25;
    if (v25)
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 223, self, CFSTR("Control SE session not ready: %@"), v26, v27, v25);
  }
  else
  {
    if (!v5)
    {
      sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 202, self, CFSTR("Handler does not exist for deactivation."), v10, v11, v51);
      v35 = 0;
      goto LABEL_19;
    }
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 206, self, CFSTR("Creating initial handler"), v10, v11, v51);
    -[STSSessionBase createHandlerForCredential:](self, "createHandlerForCredential:", v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSessionBase setHandler:](self, "setHandler:", v16);
    v15 = 0;
  }

LABEL_11:
  -[STSSessionBase handler](self, "handler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 246, self, CFSTR("Unable to find a valid handler"), v29, v30, v51);
    v39 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v55[0] = v41;
    v55[1] = &unk_24D3B2858;
    v54[1] = CFSTR("Line");
    v54[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v55[2] = v42;
    v54[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 247);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v55[3] = v43;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "errorWithDomain:code:userInfo:", v40, 11, v44);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
    goto LABEL_19;
  }
  -[STSSessionBase handler](self, "handler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "activateChildSessionOnSetActiveCredential");

  if (!v32)
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 240, self, CFSTR(" Handoff not ready to be activated yet"), v33, v34, v51);

    goto LABEL_17;
  }
  -[STSSessionBase activateChildSession](self, "activateChildSession");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v35)
  {
LABEL_17:
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 243, self, CFSTR("Seting new activeCredential %@ on handler"), v36, v37, (uint64_t)v5);
    -[STSSessionBase handler](self, "handler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setActiveCredential:", v5);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase setActiveCredential:]", 233, self, CFSTR("Handler activation failure: %@"), v36, v37, (uint64_t)v35);
  -[STSSessionBase handler](self, "handler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "tearDownWithCompletion:", 0);

  -[STSSessionBase setHandler:](self, "setHandler:", 0);
LABEL_19:

  return v35;
}

- (id)validateCredentials:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const char *Name;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _QWORD v39[4];
  _QWORD v40[4];
  _BYTE v41[128];
  _QWORD v42[4];
  _QWORD v43[4];
  _QWORD v44[4];
  _QWORD v45[6];

  v45[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase validateCredentials:]", 255, self, CFSTR("Empty credential array provided."), v6, v7, v33);
    v22 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v45[0] = v13;
    v45[1] = &unk_24D3B2870;
    v44[1] = CFSTR("Line");
    v44[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v23;
    v44[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 256);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v45[3] = v24;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 4);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v8, 8, v25);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

    goto LABEL_17;
  }
  objc_msgSend(v5, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "type");
  if (!(_DWORD)v9)
  {
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase validateCredentials:]", 263, self, CFSTR("Invalid credential type."), v10, v11, v33);
    v31 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v42[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v23;
    v43[1] = &unk_24D3B2888;
    v42[1] = CFSTR("Line");
    v42[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v43[2] = v24;
    v42[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 264);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v43[3] = v25;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 4);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", v13, 8, v29);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:

    goto LABEL_16;
  }
  v12 = v9;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v13 = v5;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v36;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v36 != v16)
          objc_enumerationMutation(v13);
        v18 = objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * v17), "type");
        if ((_DWORD)v12 != v18)
        {
          v34 = v12;
          sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase validateCredentials:]", 272, self, CFSTR("Invalid or mismatching credential types; found %d, expects %d"),
            v19,
            v20,
            v18);
          v26 = (void *)MEMORY[0x24BDD1540];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v39[0] = *MEMORY[0x24BDD0FC8];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid Parameter");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = v24;
          v40[1] = &unk_24D3B28A0;
          v39[1] = CFSTR("Line");
          v39[2] = CFSTR("Method");
          v27 = (void *)MEMORY[0x24BDD17C8];
          Name = sel_getName(a2);
          objc_msgSend(v27, "stringWithFormat:", CFSTR("%s"), Name, v34, (_QWORD)v35);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v40[2] = v25;
          v39[3] = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 273);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v40[3] = v29;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 4);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "errorWithDomain:code:userInfo:", v23, 8, v30);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      if (v15)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_17:

  return v21;
}

- (id)setActiveCredentials:(id)a3
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  os_activity_scope_state_s state;
  _QWORD v55[4];
  _QWORD v56[4];
  _QWORD v57[4];
  _QWORD v58[5];

  v58[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = _os_activity_create(&dword_2158A9000, "setActiveCredentials:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 285, self, CFSTR("%@"), v7, v8, (uint64_t)v5);
  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STSSessionBase setActiveCredential:](self, "setActiveCredential:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_25:

    goto LABEL_26;
  }
  if (!v5)
  {
    v9 = 0;
LABEL_7:
    -[STSSessionBase handler](self, "handler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (!v9
        || (-[STSSessionBase handler](self, "handler"),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            v15 = objc_msgSend(v14, "supportedCredentialType"),
            v16 = objc_msgSend(v9, "type"),
            v14,
            v15 == v16))
      {
        v17 = 0;
        goto LABEL_17;
      }
      -[STSSessionBase handler](self, "handler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "activeSTSCredential");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 314, self, CFSTR("new handler required, switching credential from %@ to %@"), v21, v22, (uint64_t)v20);

      -[STSSessionBase createHandlerForCredential:](self, "createHandlerForCredential:", v9);
      v23 = objc_claimAutoreleasedReturnValue();
      if (!v23)
      {
        v47 = (void *)MEMORY[0x24BDD1540];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v58[0] = v48;
        v58[1] = &unk_24D3B28B8;
        v57[1] = CFSTR("Line");
        v57[2] = CFSTR("Method");
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2), v9);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v58[2] = v49;
        v57[3] = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 317);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v58[3] = v50;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 4);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "errorWithDomain:code:userInfo:", v41, 11, v51);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_24;
      }
      v18 = (void *)v23;
      -[STSSessionBase handler](self, "handler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "tearDownWithCompletion:", 0);

      -[STSSessionBase setHandler:](self, "setHandler:", v18);
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 323, self, CFSTR("Waiting for Control SE session ready"), v25, v26, v53);
      -[STSSessionBase waitForControlSessionToBeReady:](self, "waitForControlSessionToBeReady:", 1);
      v27 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v27;
      if (v27)
        sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 327, self, CFSTR("Control SE session not ready: %@"), v28, v29, v27);
    }
    else
    {
      if (!v5)
      {
        sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 306, self, CFSTR("Handler does not exist for deactivation."), v12, v13, v52);
        v10 = 0;
        goto LABEL_25;
      }
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 310, self, CFSTR("Creating initial handler"), v12, v13, v52);
      -[STSSessionBase createHandlerForCredential:](self, "createHandlerForCredential:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[STSSessionBase setHandler:](self, "setHandler:", v18);
      v17 = 0;
    }

LABEL_17:
    -[STSSessionBase handler](self, "handler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      -[STSSessionBase handler](self, "handler");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "activateChildSessionOnSetActiveCredential");

      if (v34)
      {
        -[STSSessionBase activateChildSession](self, "activateChildSession");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 337, self, CFSTR("Handler activation failure: %@"), v37, v38, (uint64_t)v10);
          -[STSSessionBase handler](self, "handler");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "tearDownWithCompletion:", 0);

          -[STSSessionBase setHandler:](self, "setHandler:", 0);
          goto LABEL_25;
        }
      }
      else
      {
        sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 343, self, CFSTR("Handler not ready to be activated yet"), v35, v36, v52);

      }
      sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 346, self, CFSTR("Setting new activeCredentials %@ on handler"), v37, v38, (uint64_t)v5);
      -[STSSessionBase handler](self, "handler");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setActiveCredentials:", v5);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase setActiveCredentials:]", 349, self, CFSTR("Unable to find a valid handler"), v31, v32, v52);
      v40 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = *MEMORY[0x24BDD0FC8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Feature Not Supported");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v56[0] = v42;
      v56[1] = &unk_24D3B28D0;
      v55[1] = CFSTR("Line");
      v55[2] = CFSTR("Method");
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v56[2] = v43;
      v55[3] = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 350);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v56[3] = v44;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v56, v55, 4);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "errorWithDomain:code:userInfo:", v41, 11, v45);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
LABEL_24:

    goto LABEL_25;
  }
  -[STSSessionBase validateCredentials:](self, "validateCredentials:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v5, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_26:

  return v10;
}

- (id)createHandoffToken:(id *)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  id v29;
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[5];
  _QWORD v33[6];

  v33[5] = *MEMORY[0x24BDAC8D0];
  -[STSSessionBase handler](self, "handler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handoffToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[STSSessionBase handler](self, "handler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handoffToken");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = (id)objc_msgSend(v9, "copy");

    return 0;
  }
  -[STSSessionBase masterSESession](self, "masterSESession");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v11, "createSessionHandoffToken:", &v29);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v29;

  if (v13)
  {
    *a3 = 0;
    v14 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Unexpected Result");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *MEMORY[0x24BDD1398];
    v33[0] = v16;
    v33[1] = v13;
    v32[1] = v17;
    v32[2] = CFSTR("Line");
    v33[2] = &unk_24D3B28E8;
    v32[3] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v18;
    v32[4] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 367);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[4] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 5);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v14;
    v22 = v15;
    v23 = 10;
  }
  else
  {
    if (objc_msgSend(v12, "length"))
    {
      v24 = 0;
      *a3 = objc_retainAutorelease(v12);
      goto LABEL_8;
    }
    *a3 = 0;
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase createHandoffToken:]", 370, self, CFSTR("Invalid token"), v25, v26, v28);
    v27 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v16;
    v31[1] = &unk_24D3B2900;
    v30[1] = CFSTR("Line");
    v30[2] = CFSTR("Method");
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v18;
    v30[3] = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 371);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v27;
    v22 = v15;
    v23 = 9;
  }
  objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, v23, v20);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  return v24;
}

- (void)setSessionTimeLimit:(double)a3
{
  NSObject *v5;
  STSTimer *sessionKillSwitch;
  STSTimer *v7;
  STSTimer *v8;
  STSTimer *v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14[2];
  os_activity_scope_state_s state;

  v5 = _os_activity_create(&dword_2158A9000, "setSessionTimeLimit:", MEMORY[0x24BDACB08], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  if (a3 <= 0.0)
  {
    -[STSSessionBase clearSessionTimer](self, "clearSessionTimer");
  }
  else
  {
    sessionKillSwitch = self->_sessionKillSwitch;
    if (!sessionKillSwitch)
    {
      objc_initWeak((id *)&state, self);
      v7 = [STSTimer alloc];
      v10 = MEMORY[0x24BDAC760];
      v11 = 3221225472;
      v12 = sub_2158AED7C;
      v13 = &unk_24D3A6F08;
      objc_copyWeak(v14, (id *)&state);
      v14[1] = *(id *)&a3;
      v8 = -[STSTimer initSleepTimerWithCallback:queue:](v7, "initSleepTimerWithCallback:queue:", &v10, self->_callbackQueue);
      v9 = self->_sessionKillSwitch;
      self->_sessionKillSwitch = v8;

      objc_destroyWeak(v14);
      objc_destroyWeak((id *)&state);
      sessionKillSwitch = self->_sessionKillSwitch;
    }
    -[STSTimer startTimer:](sessionKillSwitch, "startTimer:", a3, v10, v11, v12, v13);
  }
}

- (void)clearSessionTimer
{
  uint64_t v2;
  uint64_t v3;
  STSTimer *sessionKillSwitch;
  uint64_t v6;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase clearSessionTimer]", 411, self, CFSTR("Clearing session kill switch timer"), v2, v3, v6);
  -[STSTimer stopTimer](self->_sessionKillSwitch, "stopTimer");
  sessionKillSwitch = self->_sessionKillSwitch;
  self->_sessionKillSwitch = 0;

}

- (double)isTimeLimited
{
  return 900.0;
}

- (void)_tearDownOnQueue:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18[4];
  void (**v19)(_QWORD);
  _QWORD v20[4];
  NSObject *v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD v24[4];
  NSObject *v25;

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase _tearDownOnQueue:completion:]", 422, self, &stru_24D3A78C0, v7, v8, v18[0]);
  if (v4)
    v9 = dispatch_group_create();
  else
    v9 = 0;
  os_unfair_lock_lock(&self->_sessionUpdateLock);
  -[STSSessionBase handler](self, "handler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x24BDAC760];
  if (v10)
  {
    if (v9)
      dispatch_group_enter(v9);
    -[STSSessionBase handler](self, "handler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    v24[1] = 3221225472;
    v24[2] = sub_2158AF214;
    v24[3] = &unk_24D3A6F30;
    v25 = v9;
    objc_msgSend(v12, "tearDownWithCompletion:", v24);

    -[STSSessionBase setHandler:](self, "setHandler:", 0);
  }
  -[STSSessionBase masterSESession](self, "masterSESession");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (v9)
      dispatch_group_enter(v9);
    -[STSSessionBase masterSESession](self, "masterSESession");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v11;
    v22[1] = 3221225472;
    v22[2] = sub_2158AF224;
    v22[3] = &unk_24D3A6F58;
    v23 = v9;
    objc_msgSend(v14, "endSessionWithCompletion:", v22);

    -[STSSessionBase setMasterSESession:](self, "setMasterSESession:", 0);
  }
  -[STSSessionBase initiatingSession](self, "initiatingSession");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (v9)
      dispatch_group_enter(v9);
    -[STSSessionBase initiatingSession](self, "initiatingSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = sub_2158AF234;
    v20[3] = &unk_24D3A6F58;
    v21 = v9;
    objc_msgSend(v16, "endSessionWithCompletion:", v20);

    -[STSSessionBase setInitiatingSession:](self, "setInitiatingSession:", 0);
  }
  os_unfair_lock_unlock(&self->_sessionUpdateLock);
  if (v6)
  {
    if (v9)
    {
      -[STSSessionBase callbackQueue](self, "callbackQueue");
      v17 = objc_claimAutoreleasedReturnValue();
      v18[0] = v11;
      v18[1] = 3221225472;
      v18[2] = (uint64_t)sub_2158AF244;
      v18[3] = (uint64_t)&unk_24D3A6F80;
      v19 = v6;
      dispatch_group_notify(v9, v17, v18);

    }
    else
    {
      v6[2](v6);
    }
  }

}

- (void)handleSessionSuspended:(id)a3 withToken:(id)a4
{
  id v6;
  STSSessionBase *v7;
  uint64_t v8;
  uint64_t v9;
  dispatch_semaphore_t v10;
  OS_dispatch_semaphore *controlSessionSem;
  id v12;

  v12 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase handleSessionSuspended:withToken:]", 466, v7, CFSTR("Control SE session is suspended with token: %@"), v8, v9, (uint64_t)v6);
  v7->_controlSessionSuspended = 1;
  v10 = dispatch_semaphore_create(0);
  controlSessionSem = v7->_controlSessionSem;
  v7->_controlSessionSem = (OS_dispatch_semaphore *)v10;

  objc_sync_exit(v7);
}

- (void)handleSessionResumed:(id)a3
{
  STSSessionBase *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *controlSessionSem;
  uint64_t v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase handleSessionResumed:]", 474, v4, CFSTR("Control SE session resumed"), v5, v6, v8);
  v4->_controlSessionSuspended = 0;
  controlSessionSem = v4->_controlSessionSem;
  if (controlSessionSem)
    dispatch_semaphore_signal(controlSessionSem);
  objc_sync_exit(v4);

}

- (id)waitForControlSessionToBeReady:(int)a3
{
  uint64_t v3;
  STSSessionBase *v5;
  _BOOL4 controlSessionSuspended;
  NSObject *controlSessionSem;
  dispatch_time_t v8;
  uint64_t v9;
  uint64_t v10;
  STSSessionBase *v11;
  _BOOL4 v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[4];
  _QWORD v25[5];

  v3 = *(_QWORD *)&a3;
  v25[4] = *MEMORY[0x24BDAC8D0];
  v5 = self;
  objc_sync_enter(v5);
  controlSessionSuspended = v5->_controlSessionSuspended;
  objc_sync_exit(v5);

  if (!controlSessionSuspended)
    return 0;
  controlSessionSem = v5->_controlSessionSem;
  v8 = dispatch_time(0, 1000000000 * (int)v3);
  if (dispatch_semaphore_wait(controlSessionSem, v8))
    sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase waitForControlSessionToBeReady:]", 492, v5, CFSTR("Control SE session failed to resume after %d seconds"), v9, v10, v3);
  v11 = v5;
  objc_sync_enter(v11);
  v12 = v5->_controlSessionSuspended;
  objc_sync_exit(v11);

  if (!v12)
    return 0;
  sub_2158CDE20(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSessionBase waitForControlSessionToBeReady:]", 501, v11, CFSTR("Control SE session did not resume"), v13, v14, v23);
  v15 = (void *)MEMORY[0x24BDD1540];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "STS.fwk");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Invalid State");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v17;
  v25[1] = &unk_24D3B2918;
  v24[1] = CFSTR("Line");
  v24[2] = CFSTR("Method");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s"), sel_getName(a2));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v18;
  v24[3] = *MEMORY[0x24BDD0BA0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s:%d"), sel_getName(a2), 502);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 9, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)secureElementManagerSessionDidEndUnexpectedly:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  sub_2158CDE20(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSessionBase secureElementManagerSessionDidEndUnexpectedly:]", 511, self, CFSTR("Connection closed unexpectedly."), v3, v4, v6);
  -[STSSessionBase fireSessionDidEndUnexpectedlyEventWithStatus:](self, "fireSessionDidEndUnexpectedlyEventWithStatus:", 0);
}

- (STSSessionBaseDelegate)delegate
{
  return (STSSessionBaseDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (STSHandler)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
  objc_storeStrong((id *)&self->_handler, a3);
}

- (NFSession)initiatingSession
{
  return self->_initiatingSession;
}

- (void)setInitiatingSession:(id)a3
{
  objc_storeStrong((id *)&self->_initiatingSession, a3);
}

- (NFSecureElementManagerSession)masterSESession
{
  return self->_masterSESession;
}

- (void)setMasterSESession:(id)a3
{
  objc_storeStrong((id *)&self->_masterSESession, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (id)theStartCallback
{
  return self->_theStartCallback;
}

- (void)setTheStartCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (BOOL)hasStartedWithDelegate
{
  return self->_hasStartedWithDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_theStartCallback, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_masterSESession, 0);
  objc_storeStrong((id *)&self->_initiatingSession, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_sessionKillSwitch, 0);
  objc_storeStrong((id *)&self->_nfHwManager, 0);
  objc_storeStrong((id *)&self->_controlSessionSem, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)fireSessionDidEndUnexpectedlyEventWithStatus:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  id v7;

  sub_2158CDE20(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSessionBase(EVENTS) fireSessionDidEndUnexpectedlyEventWithStatus:]", 16, self, CFSTR("fireSessionDidEndUnexpectedlyEventWithStatus %d"), v3, v4, a3);
  -[STSSessionBase delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "stsSessionDidEndUnexpectedly:errorCode:", self, a3);

}

@end
