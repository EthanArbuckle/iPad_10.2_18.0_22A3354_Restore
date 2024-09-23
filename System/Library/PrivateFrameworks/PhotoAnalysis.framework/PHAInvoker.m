@implementation PHAInvoker

- (PHAInvoker)initWithDelegate:(id)a3
{
  id v4;
  PHAInvoker *v5;
  PHAInvoker *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHAInvoker;
  v5 = -[PHAInvoker init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;

  v7 = a4;
  v8 = a3;
  objc_msgSend(v7, "target");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "targetForOriginalTarget:connection:selector:", v11, v8, objc_msgSend(v7, "selector"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    -[PHAInvoker handleInvocation:withTarget:service:](self, "handleInvocation:withTarget:service:", v7, v10, v11);
  else
    objc_msgSend(v7, "invoke");

}

- (void)handleInvocation:(id)a3 withTarget:(id)a4 service:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  PHAServiceCancelableOperation *v13;
  id v14;
  id WeakRetained;
  _QWORD v16[4];
  id v17;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  NSStringFromSelector((SEL)objc_msgSend(v10, "selector"));
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "UTF8String");
  v12 = (void *)os_transaction_create();
  objc_msgSend(v10, "setTarget:", v9);
  v13 = -[PHAServiceCancelableOperation initWithOperationId:invocation:]([PHAServiceCancelableOperation alloc], "initWithOperationId:invocation:", 0, v10);

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __50__PHAInvoker_handleInvocation_withTarget_service___block_invoke;
  v16[3] = &unk_1E8521740;
  v17 = v12;
  v14 = v12;
  -[PHAServiceCancelableOperation addCompletionBlock:](v13, "addCompletionBlock:", v16);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "dispatchOperation:toTarget:service:", v13, v9, v8);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
