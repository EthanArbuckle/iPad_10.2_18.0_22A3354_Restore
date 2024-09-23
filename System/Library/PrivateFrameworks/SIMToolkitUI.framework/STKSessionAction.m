@implementation STKSessionAction

+ (id)_sessionActionFromBSAction:(id)a3
{
  id v3;
  void *v4;
  NSString *v5;
  objc_class *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForSetting:", 1);
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();

  v6 = NSClassFromString(v5);
  if (-[objc_class isSubclassOfClass:](v6, "isSubclassOfClass:", objc_opt_class()))
    v7 = (void *)objc_msgSend([v6 alloc], "_initWithBSAction:", v3);
  else
    v7 = 0;

  return v7;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STKSessionAction;
  return -[STKSessionAction init](&v3, sel_init);
}

- (id)_initWithBSAction:(id)a3
{
  id v5;
  id *v6;
  id *v7;

  v5 = a3;
  v6 = -[STKSessionAction _init](self, "_init");
  v7 = v6;
  if (v6)
    objc_storeStrong(v6 + 3, a3);

  return v7;
}

- (STKSessionAction)initWithBehavior:(id)a3 data:(id)a4 responseBlock:(id)a5
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  id *v21;
  STKSessionAction *v22;
  id v23;
  uint64_t v24;
  BSAction *action;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = v12;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKSessionAction.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

    if (v13)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKSessionAction.m"), 59, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("behavior"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v13)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKSessionAction.m"), 61, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("responseBlock"));

LABEL_4:
  __56__STKSessionAction_initWithBehavior_data_responseBlock___block_invoke((uint64_t)v12, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __56__STKSessionAction_initWithBehavior_data_responseBlock___block_invoke((uint64_t)v14, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  v17 = (objc_class *)objc_opt_class();
  NSStringFromClass(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forSetting:", v18, 1);

  objc_msgSend(v16, "setObject:forSetting:", v14, 2);
  objc_msgSend(v16, "setObject:forSetting:", v15, 3);
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forSetting:", v20, 4);

  v21 = -[STKSessionAction _init](self, "_init");
  v22 = (STKSessionAction *)v21;
  if (v21)
  {
    objc_storeStrong(v21 + 1, a3);
    objc_storeStrong((id *)&v22->_data, a4);
    v23 = objc_alloc(MEMORY[0x24BE0BD80]);
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __56__STKSessionAction_initWithBehavior_data_responseBlock___block_invoke_2;
    v30[3] = &unk_24D5637C0;
    v31 = v13;
    v24 = objc_msgSend(v23, "initWithInfo:timeout:forResponseOnQueue:withHandler:", v16, 0, v30, 0.0);
    action = v22->_action;
    v22->_action = (BSAction *)v24;

  }
  return v22;
}

id __56__STKSessionAction_initWithBehavior_data_responseBlock___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  xpc_object_t v3;

  v2 = a2;
  v3 = xpc_dictionary_create(0, 0, 0);
  objc_msgSend(v2, "encodeWithXPCDictionary:", v3);

  return v3;
}

void __56__STKSessionAction_initWithBehavior_data_responseBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v8, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForSetting:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v5, "unsignedIntegerValue");
    objc_msgSend(v8, "info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForSetting:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STKSessionAction.m"), 101, CFSTR("Must be invalidated before it can be deallocated."));

  }
  v5.receiver = self;
  v5.super_class = (Class)STKSessionAction;
  -[STKSessionAction dealloc](&v5, sel_dealloc);
}

- (STKSessionBehavior)behavior
{
  STKSessionBehavior *behavior;
  void *v4;
  void *v5;
  STKSessionBehavior *v6;
  STKSessionBehavior *v7;

  behavior = self->_behavior;
  if (!behavior)
  {
    -[BSAction info](self->_action, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForSetting:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "conformsToProtocol:", &unk_254E42CF8))
    {
      v6 = -[STKSessionBehavior initWithXPCDictionary:]([STKSessionBehavior alloc], "initWithXPCDictionary:", v5);
      v7 = self->_behavior;
      self->_behavior = v6;

    }
    behavior = self->_behavior;
  }
  return behavior;
}

- (BSXPCCoding)sessionData
{
  BSXPCCoding *data;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  objc_class *v8;
  BSXPCCoding *v9;
  BSXPCCoding *v10;

  data = self->_data;
  if (!data)
  {
    -[BSAction info](self->_action, "info");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForSetting:", 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "conformsToProtocol:", &unk_254E42CF8))
    {
      -[BSAction info](self->_action, "info");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForSetting:", 4);
      v7 = (NSString *)objc_claimAutoreleasedReturnValue();

      v8 = NSClassFromString(v7);
      if (v8)
      {
        v9 = (BSXPCCoding *)objc_msgSend([v8 alloc], "initWithXPCDictionary:", v5);
        v10 = self->_data;
        self->_data = v9;

      }
    }

    data = self->_data;
  }
  return data;
}

- (void)sendResponse:(int64_t)a3
{
  -[STKSessionAction sendResponse:withContext:](self, "sendResponse:withContext:", a3, 0);
}

- (void)sendResponse:(int64_t)a3 withContext:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  BSAction *v10;
  BSAction *action;
  void *v12;
  BSAction *v13;
  _QWORD v14[4];
  BSAction *v15;

  v6 = (objc_class *)MEMORY[0x24BE0BE40];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", v9, 1);

  objc_msgSend(v8, "setObject:forSetting:", v7, 2);
  v10 = self->_action;
  action = self->_action;
  self->_action = 0;

  objc_msgSend(MEMORY[0x24BE0BD90], "responseWithInfo:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __45__STKSessionAction_sendResponse_withContext___block_invoke;
  v14[3] = &unk_24D5637E8;
  v15 = v10;
  v13 = v10;
  -[BSAction sendResponse:withCompletion:](v13, "sendResponse:withCompletion:", v12, v14);

}

- (void)invalidate
{
  BSAction *action;

  if (!self->_invalidated)
  {
    self->_invalidated = 1;
    -[BSAction invalidate](self->_action, "invalidate");
    action = self->_action;
    self->_action = 0;

  }
}

- (BSAction)_BSAction
{
  return self->_action;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
}

@end
