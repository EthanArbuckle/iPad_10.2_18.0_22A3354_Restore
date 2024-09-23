@implementation SXPostActionHandlerManager

- (SXPostActionHandlerManager)init
{
  SXPostActionHandlerManager *v2;
  uint64_t v3;
  NSMutableDictionary *postActionHandlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXPostActionHandlerManager;
  v2 = -[SXPostActionHandlerManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    postActionHandlers = v2->_postActionHandlers;
    v2->_postActionHandlers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)addPostActionHandler:(id)a3 forActionType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[SXPostActionHandlerManager postActionHandlers](self, "postActionHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    -[SXPostActionHandlerManager postActionHandlers](self, "postActionHandlers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, v6);

    -[SXPostActionHandlerManager postActionHandlers](self, "postActionHandlers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "addObject:", v12);

}

- (void)removePostActionHandler:(id)a3 forActionType:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  -[SXPostActionHandlerManager postActionHandlers](self, "postActionHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObject:", v6);
  if (!objc_msgSend(v8, "count"))
  {
    -[SXPostActionHandlerManager postActionHandlers](self, "postActionHandlers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObjectForKey:", v10);

  }
}

- (void)handledAction:(id)a3 state:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  unint64_t v13;

  v6 = a3;
  -[SXPostActionHandlerManager postActionHandlers](self, "postActionHandlers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "type");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __50__SXPostActionHandlerManager_handledAction_state___block_invoke;
  v11[3] = &unk_24D68D828;
  v12 = v6;
  v13 = a4;
  v10 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v11);

}

uint64_t __50__SXPostActionHandlerManager_handledAction_state___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handledAction:state:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (NSMutableDictionary)postActionHandlers
{
  return self->_postActionHandlers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postActionHandlers, 0);
}

@end
