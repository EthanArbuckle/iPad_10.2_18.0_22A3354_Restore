@implementation TRServerConnection

- (TRServerConnection)initWithService:(id)a3
{
  id v4;
  TRServerConnection *v5;
  TRServerConnection *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TRServerConnection;
  v5 = -[TRServerConnection init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_service, v4);

  return v6;
}

- (void)sendEvent:(id)a3
{
  SFService **p_service;
  id v4;
  id WeakRetained;

  p_service = &self->_service;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_service);
  objc_msgSend(WeakRetained, "sendEvent:", v4);

}

- (void)sendRequest:(id)a3
{
  SFService **p_service;
  id v4;
  id WeakRetained;

  p_service = &self->_service;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_service);
  objc_msgSend(WeakRetained, "sendRequest:", v4);

}

- (void)sendResponse:(id)a3
{
  SFService **p_service;
  id v4;
  id WeakRetained;

  p_service = &self->_service;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_service);
  objc_msgSend(WeakRetained, "sendResponse:", v4);

}

- (void)invalidate
{
  void *v3;
  void (**v4)(void);

  objc_storeWeak((id *)&self->_service, 0);
  -[TRConnection invalidationHandler](self, "invalidationHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TRConnection invalidationHandler](self, "invalidationHandler");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

- (SFService)service
{
  return (SFService *)objc_loadWeakRetained((id *)&self->_service);
}

- (void)setService:(id)a3
{
  objc_storeWeak((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_service);
}

@end
