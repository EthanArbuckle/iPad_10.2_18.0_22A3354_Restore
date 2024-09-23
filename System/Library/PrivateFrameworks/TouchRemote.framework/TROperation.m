@implementation TROperation

+ (id)userCancelledError
{
  return (id)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -10001, 0);
}

- (TROperation)initWithSession:(id)a3
{
  id v5;
  TROperation *v6;
  TROperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TROperation;
  v6 = -[TROperation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_session, a3);

  return v7;
}

- (void)main
{
  NSObject *v3;
  id v4;
  OS_dispatch_semaphore *v5;
  OS_dispatch_semaphore *semaphore;
  int v7;
  id v8;
  __int16 v9;
  TROperation *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = (id)objc_opt_class();
      v9 = 2048;
      v10 = self;
      v4 = v8;
      _os_log_impl(&dword_20A2BF000, v3, OS_LOG_TYPE_DEFAULT, "%@<%p> started", (uint8_t *)&v7, 0x16u);

    }
  }
  v5 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  semaphore = self->_semaphore;
  self->_semaphore = v5;

  -[TROperation execute](self, "execute");
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
}

- (void)finishWithResult:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _BYTE v7[24];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v7 = 138412802;
      *(_QWORD *)&v7[4] = objc_opt_class();
      *(_WORD *)&v7[12] = 2048;
      *(_QWORD *)&v7[14] = self;
      *(_WORD *)&v7[22] = 2112;
      v8 = v4;
      v6 = *(id *)&v7[4];
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "%@<%p> completed successfully with result %@", v7, 0x20u);

    }
  }
  -[TROperation setResult:](self, "setResult:", v4, *(_OWORD *)v7, *(_QWORD *)&v7[16], v8);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);

}

- (void)finishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _BYTE v7[24];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (_TRLogEnabled == 1)
  {
    TRLogHandle();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v7 = 138412802;
      *(_QWORD *)&v7[4] = objc_opt_class();
      *(_WORD *)&v7[12] = 2048;
      *(_QWORD *)&v7[14] = self;
      *(_WORD *)&v7[22] = 2112;
      v8 = v4;
      v6 = *(id *)&v7[4];
      _os_log_impl(&dword_20A2BF000, v5, OS_LOG_TYPE_DEFAULT, "%@<%p> failed with error: %@", v7, 0x20u);

    }
  }
  -[TROperation setError:](self, "setError:", v4, *(_OWORD *)v7, *(_QWORD *)&v7[16], v8);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);

}

- (TRSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (NSDictionary)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (void)setSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_semaphore, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
