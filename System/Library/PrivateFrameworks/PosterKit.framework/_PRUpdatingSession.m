@implementation _PRUpdatingSession

- (_PRUpdatingSession)initWithConnectionAssertion:(id)a3 errorHandler:(id)a4
{
  id v7;
  id v8;
  _PRUpdatingSession *v9;
  _PRUpdatingSession *v10;
  uint64_t v11;
  id errorHandlerBlock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PRUpdatingSession;
  v9 = -[_PRUpdatingSession init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectionAssertion, a3);
    v11 = objc_msgSend(v8, "copy");
    errorHandlerBlock = v10->_errorHandlerBlock;
    v10->_errorHandlerBlock = (id)v11;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB35C8], "pr_errorWithCode:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PRUpdatingSession fireError:](self, "fireError:", v3);

  v4.receiver = self;
  v4.super_class = (Class)_PRUpdatingSession;
  -[_PRUpdatingSession dealloc](&v4, sel_dealloc);
}

- (void)noteSessionIsComplete
{
  id errorHandlerBlock;
  BSInvalidatable *connectionAssertion;
  _PRUpdatingSession *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_didFireCompletion)
  {
    obj->_didFireCompletion = 1;
    errorHandlerBlock = obj->_errorHandlerBlock;
    obj->_errorHandlerBlock = 0;

    -[BSInvalidatable invalidate](obj->_connectionAssertion, "invalidate");
    connectionAssertion = obj->_connectionAssertion;
    obj->_connectionAssertion = 0;

  }
  objc_sync_exit(obj);

}

- (void)fireError:(id)a3
{
  _PRUpdatingSession *v4;
  void (**errorHandlerBlock)(void);
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (!v4->_didFireCompletion)
  {
    errorHandlerBlock = (void (**)(void))v4->_errorHandlerBlock;
    if (v6 && errorHandlerBlock)
    {
      errorHandlerBlock[2]();
      errorHandlerBlock = (void (**)(void))v4->_errorHandlerBlock;
    }
    v4->_errorHandlerBlock = 0;

    -[BSInvalidatable invalidate](v4->_connectionAssertion, "invalidate");
    v4->_didFireCompletion = 1;
  }
  objc_sync_exit(v4);

}

- (void)invalidate
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB35C8], "pr_errorWithCode:", 5);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[_PRUpdatingSession fireError:](self, "fireError:", v3);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_errorHandlerBlock, 0);
  objc_storeStrong((id *)&self->_connectionAssertion, 0);
}

@end
