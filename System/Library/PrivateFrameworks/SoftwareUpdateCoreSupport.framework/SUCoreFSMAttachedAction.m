@implementation SUCoreFSMAttachedAction

- (SUCoreFSMAttachedAction)initWithAction:(id)a3 usingDelegate:(id)a4 withInfoClass:(Class)a5
{
  id v9;
  id v10;
  SUCoreFSMAttachedAction *v11;
  SUCoreFSMAttachedAction *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SUCoreFSMAttachedAction;
  v11 = -[SUCoreFSMAttachedAction init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fsmAction, a3);
    objc_storeWeak(&v12->_actionDelegate, v10);
    objc_storeStrong((id *)&v12->_eventInfoClass, a5);
  }

  return v12;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  -[SUCoreFSMAttachedAction fsmAction](self, "fsmAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreFSMAttachedAction actionDelegate](self, "actionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("action(%@),delegate(%@),class(%@)"), v4, v5, -[SUCoreFSMAttachedAction eventInfoClass](self, "eventInfoClass"));

  return v6;
}

- (NSString)fsmAction
{
  return self->_fsmAction;
}

- (id)actionDelegate
{
  return objc_loadWeakRetained(&self->_actionDelegate);
}

- (Class)eventInfoClass
{
  return self->_eventInfoClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventInfoClass, 0);
  objc_destroyWeak(&self->_actionDelegate);
  objc_storeStrong((id *)&self->_fsmAction, 0);
}

@end
