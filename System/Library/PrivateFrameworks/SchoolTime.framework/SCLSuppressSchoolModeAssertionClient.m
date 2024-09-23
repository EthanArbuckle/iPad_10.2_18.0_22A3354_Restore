@implementation SCLSuppressSchoolModeAssertionClient

- (SCLSuppressSchoolModeAssertionClient)initWithConnection:(id)a3
{
  id v5;
  SCLSuppressSchoolModeAssertionClient *v6;
  SCLSuppressSchoolModeAssertionClient *v7;
  NSXPCConnection *connection;
  void *v9;
  void *v10;
  NSObject *v11;
  NSXPCConnection *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SCLSuppressSchoolModeAssertionClient;
  v6 = -[SCLSuppressSchoolModeAssertionClient init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    -[NSXPCConnection setExportedObject:](v7->_connection, "setExportedObject:", v7);
    connection = v7->_connection;
    SCLSuppressSchoolModeAssertionXPCServerInterface();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setExportedInterface:](connection, "setExportedInterface:", v9);

    objc_msgSend(v5, "valueForEntitlement:", 0x24E29CE48);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v10, "BOOLValue"))
    {
      v7->_entitled = 1;
    }
    else
    {
      scl_framework_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        -[SCLSuppressSchoolModeAssertionClient initWithConnection:].cold.1((uint64_t)v5, v11);

    }
    objc_initWeak(&location, v7);
    v12 = v7->_connection;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __59__SCLSuppressSchoolModeAssertionClient_initWithConnection___block_invoke;
    v14[3] = &unk_24E29B8C0;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInvalidationHandler:](v12, "setInvalidationHandler:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

  }
  return v7;
}

void __59__SCLSuppressSchoolModeAssertionClient_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "connectionDidInvalidate");

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCLSuppressSchoolModeAssertionClient explanation](self, "explanation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; explanation: %@>"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)connectionDidInvalidate
{
  id v3;

  -[SCLSuppressSchoolModeAssertionClient setAcquired:](self, "setAcquired:", 0);
  -[SCLSuppressSchoolModeAssertionClient delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDidInvalidate:", self);

}

- (void)acquireWithExplanation:(id)a3 UUID:(id)a4 completion:(id)a5
{
  NSString *v7;
  NSString *explanation;
  void *v9;
  void *v10;
  void (**v11)(id, uint64_t, _QWORD);

  v11 = (void (**)(id, uint64_t, _QWORD))a5;
  v7 = (NSString *)objc_msgSend(a3, "copy");
  explanation = self->_explanation;
  self->_explanation = v7;

  if (-[SCLSuppressSchoolModeAssertionClient isEntitled](self, "isEntitled"))
  {
    if (!-[SCLSuppressSchoolModeAssertionClient isAcquired](self, "isAcquired"))
    {
      -[SCLSuppressSchoolModeAssertionClient setAcquired:](self, "setAcquired:", 1);
      -[SCLSuppressSchoolModeAssertionClient delegate](self, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "clientDidAcquireAssertion:", self);

    }
    v11[2](v11, 1, 0);
  }
  else
  {
    SCLEntitlementError(0x24E29CE48);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v10);

  }
}

- (SCLSuppressSchoolModeAssertionClientDelegate)delegate
{
  return (SCLSuppressSchoolModeAssertionClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BOOL)isAcquired
{
  return self->_acquired;
}

- (void)setAcquired:(BOOL)a3
{
  self->_acquired = a3;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (BOOL)isEntitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithConnection:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_21E4AD000, a2, OS_LOG_TYPE_ERROR, "Client %@ is not entitled to acquire suppression assertions", (uint8_t *)&v2, 0xCu);
}

@end
