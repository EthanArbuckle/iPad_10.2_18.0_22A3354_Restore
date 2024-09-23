@implementation PKDASession

- (PKDASession)initWithDelegate:(id)a3
{
  id v4;
  PKDASession *v5;
  PKDASession *v6;

  v4 = a3;
  v5 = -[PKDASession init](self, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    atomic_store(1u, &v6->_sessionState);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  if (-[PKDASession state](self, "state") != 3)
    -[PKDASession endSession](self, "endSession");
  v3.receiver = self;
  v3.super_class = (Class)PKDASession;
  -[PKDASession dealloc](&v3, sel_dealloc);
}

- (unint64_t)state
{
  return atomic_load(&self->_sessionState);
}

- (void)setState:(unint64_t)a3
{
  atomic_store(a3, &self->_sessionState);
}

- (void)endSession
{
  NSObject *v3;
  int v4;
  PKDASession *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PKLogFacilityTypeGetObject(6uLL);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = self;
    _os_log_impl(&dword_18FC92000, v3, OS_LOG_TYPE_DEFAULT, "Ending DA Session %@", (uint8_t *)&v4, 0xCu);
  }

  -[DASession endSession](self->_session, "endSession");
}

- (BOOL)startSession
{
  return 0;
}

- (NSString)description
{
  void *v3;
  DASession *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = self->_session;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; state: %ld; session: %@ >"),
    objc_opt_class(),
    self,
    -[PKDASession state](self, "state"),
    v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)daSession:(id)a3 didBecomeActive:(id)a4
{
  id WeakRetained;

  atomic_store(2u, &self->_sessionState);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "session:didChangeState:", self, 2);

}

- (void)daSession:(id)a3 didEnd:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  id WeakRetained;
  DASession *session;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  atomic_store(3u, &self->_sessionState);
  PKLogFacilityTypeGetObject(6uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (!v9)
      goto LABEL_7;
    v15 = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    v10 = "Session %@ invalidated with error %@";
    v11 = v8;
    v12 = 22;
  }
  else
  {
    if (!v9)
      goto LABEL_7;
    v15 = 138412290;
    v16 = v6;
    v10 = "Session %@ has ended";
    v11 = v8;
    v12 = 12;
  }
  _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
LABEL_7:

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "session:didChangeState:", self, 3);
  session = self->_session;
  self->_session = 0;

}

- (PKSessionDelegate)delegate
{
  return (PKSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (DASession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
