@implementation PUConnectionUnlockClient

- (PUConnectionUnlockClient)initWithConnection:(id)a3
{
  id v4;
  PUConnectionUnlockClient *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PUConnectionUnlockClient;
  -[PUConnectionUnlockClient self](&v7, sel_self);
  v5 = (PUConnectionUnlockClient *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_storeWeak((id *)&v5->_connection, v4);

  return v5;
}

- (void)didPairForUnlock:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  PUConnection **p_connection;
  id v6;
  id WeakRetained;

  v4 = a3;
  p_connection = &self->_connection;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  objc_msgSend(WeakRetained, "didPairForUnlock:error:", v4, v6);

}

- (void)didUnpairForUnlock:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  PUConnection **p_connection;
  id v6;
  id WeakRetained;

  v4 = a3;
  p_connection = &self->_connection;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  objc_msgSend(WeakRetained, "didUnpairForUnlock:error:", v4, v6);

}

- (void)didEnableOnlyRemoteUnlock:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  PUConnection **p_connection;
  id v6;
  id WeakRetained;

  v4 = a3;
  p_connection = &self->_connection;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  objc_msgSend(WeakRetained, "didEnableOnlyRemoteUnlock:error:", v4, v6);

}

- (void)didDisableOnlyRemoteUnlock:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  PUConnection **p_connection;
  id v6;
  id WeakRetained;

  v4 = a3;
  p_connection = &self->_connection;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  objc_msgSend(WeakRetained, "didDisableOnlyRemoteUnlock:error:", v4, v6);

}

- (void)remoteDeviceDidCompleteRemoteAction:(BOOL)a3 remoteDeviceState:(id)a4 error:(id)a5
{
  _BOOL8 v6;
  PUConnection **p_connection;
  id v8;
  id v9;
  id WeakRetained;

  v6 = a3;
  p_connection = &self->_connection;
  v8 = a5;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  objc_msgSend(WeakRetained, "remoteDeviceDidCompleteRemoteAction:remoteDeviceState:error:", v6, v9, v8);

}

- (void)remoteDeviceDidUnlock
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_msgSend(WeakRetained, "remoteDeviceDidUnlock");

}

- (void)remoteDeviceDidRemoveLockout:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  PUConnection **p_connection;
  id v6;
  id WeakRetained;

  v4 = a3;
  p_connection = &self->_connection;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  objc_msgSend(WeakRetained, "remoteDeviceDidRemoveLockout:error:", v4, v6);

}

- (void)didGetRemoteDeviceState:(id)a3 error:(id)a4
{
  PUConnection **p_connection;
  id v6;
  id v7;
  id WeakRetained;

  p_connection = &self->_connection;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_connection);
  objc_msgSend(WeakRetained, "didGetRemoteDeviceState:error:", v7, v6);

}

- (PUConnection)connection
{
  return (PUConnection *)objc_loadWeakRetained((id *)&self->_connection);
}

- (void)setConnection:(id)a3
{
  objc_storeWeak((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
}

@end
