@implementation NIServerVisionInternalSessionRequest

- (NIServerVisionInternalSessionRequest)initWithIdentifier:(id)a3 observer:(id)a4
{
  id v7;
  id v8;
  NIServerVisionInternalSessionRequest *v9;
  NIServerVisionInternalSessionRequest *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  if (!v7)
    __assert_rtn("-[NIServerVisionInternalSessionRequest initWithIdentifier:observer:]", "NIServerVisionInternalSession.mm", 222, "identifier");
  v12.receiver = self;
  v12.super_class = (Class)NIServerVisionInternalSessionRequest;
  v9 = -[NIServerVisionInternalSessionRequest init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeWeak((id *)&v10->_observer, v8);
  }

  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[_InternalVisionSession sharedInstance](_InternalVisionSession, "sharedInstance"));
  objc_msgSend(v3, "unregisterObserverWithIdentifier:", self->_identifier);

  v4.receiver = self;
  v4.super_class = (Class)NIServerVisionInternalSessionRequest;
  -[NIServerVisionInternalSessionRequest dealloc](&v4, "dealloc");
}

- (void)activate
{
  id WeakRetained;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[_InternalVisionSession sharedInstance](_InternalVisionSession, "sharedInstance"));
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(v4, "registerObserver:withIdentifier:", WeakRetained, self->_identifier);

}

- (void)invalidate
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[_InternalVisionSession sharedInstance](_InternalVisionSession, "sharedInstance"));
  objc_msgSend(v3, "unregisterObserverWithIdentifier:", self->_identifier);

}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
