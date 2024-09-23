@implementation WFComposeUserActivityManager

- (WFComposeUserActivityManager)initWithWorkflow:(id)a3 targetResponder:(id)a4
{
  id v8;
  id v9;
  WFComposeUserActivityManager *v10;
  WFComposeUserActivityManager *v11;
  void *v12;
  void *v13;
  void *v14;
  WFComposeUserActivityManager *v15;
  void *v17;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFComposeUserActivityManager.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("workflow"));

  }
  v18.receiver = self;
  v18.super_class = (Class)WFComposeUserActivityManager;
  v10 = -[WFComposeUserActivityManager init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_workflow, a3);
    objc_storeWeak((id *)&v11->_responder, v9);
    objc_msgSend(v9, "userActivity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "invalidate");

    objc_msgSend(v8, "createUserActivityForViewing");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "userInfo");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeUserActivityManager setUserInfo:](v11, "setUserInfo:", v14);

    objc_msgSend(v9, "setUserActivity:", v13);
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v11, CFSTR("name"), 0, WFWorkflowNameContext);
    objc_msgSend(v8, "addObserver:forKeyPath:options:context:", v11, CFSTR("icon"), 0, WFWorkflowIconContext);
    v15 = v11;

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[WFComposeUserActivityManager workflow](self, "workflow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:forKeyPath:context:", self, CFSTR("name"), WFWorkflowNameContext);

  -[WFComposeUserActivityManager workflow](self, "workflow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("icon"), WFWorkflowIconContext);

  v5.receiver = self;
  v5.super_class = (Class)WFComposeUserActivityManager;
  -[WFComposeUserActivityManager dealloc](&v5, sel_dealloc);
}

- (void)updateUserActivityState:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WFComposeUserActivityManager userInfo](self, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFComposeUserActivityManager userInfo](self, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addUserInfoEntriesFromDictionary:", v5);

  }
}

- (void)setActive:(BOOL)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;

  self->_active = a3;
  v4 = -[WFComposeUserActivityManager isActive](self, "isActive");
  -[WFComposeUserActivityManager responder](self, "responder");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "becomeCurrent");
  else
    objc_msgSend(v5, "resignCurrent");

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;

  if ((void *)WFWorkflowNameContext == a6 || WFWorkflowIconContext == (_QWORD)a6)
  {
    -[WFComposeUserActivityManager responder](self, "responder", a3, a4, a5);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[WFComposeUserActivityManager workflow](self, "workflow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createUserActivityForViewing");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "userInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFComposeUserActivityManager setUserInfo:](self, "setUserInfo:", v10);

    objc_msgSend(v13, "userActivity");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    objc_msgSend(v13, "setUserActivity:", v9);
    if (-[WFComposeUserActivityManager isActive](self, "isActive"))
    {
      objc_msgSend(v13, "userActivity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "becomeCurrent");

    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)WFComposeUserActivityManager;
    -[WFComposeUserActivityManager observeValueForKeyPath:ofObject:change:context:](&v14, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (BOOL)isActive
{
  return self->_active;
}

- (WFWorkflow)workflow
{
  return self->_workflow;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UIResponder)responder
{
  return (UIResponder *)objc_loadWeakRetained((id *)&self->_responder);
}

- (void)setResponder:(id)a3
{
  objc_storeWeak((id *)&self->_responder, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_responder);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_workflow, 0);
}

@end
