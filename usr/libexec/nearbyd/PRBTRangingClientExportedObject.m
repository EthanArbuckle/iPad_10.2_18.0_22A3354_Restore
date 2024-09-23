@implementation PRBTRangingClientExportedObject

- (PRBTRangingClientExportedObject)initWithRangingClient:(id)a3
{
  id v4;
  PRBTRangingClientExportedObject *v5;
  PRBTRangingClientExportedObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRBTRangingClientExportedObject;
  v5 = -[PRBTRangingClientExportedObject init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_rangingClient, v4);

  return v6;
}

- (void)didFailWithError:(id)a3
{
  PRBTRangingClientProtocol **p_rangingClient;
  id v4;
  id WeakRetained;

  p_rangingClient = &self->_rangingClient;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_rangingClient);
  objc_msgSend(WeakRetained, "didFailWithError:", v4);

}

- (void)didFetchTxPower:(id)a3 fromDevice:(id)a4 withError:(id)a5
{
  PRBTRangingClientProtocol **p_rangingClient;
  id v8;
  id v9;
  id v10;
  id WeakRetained;

  p_rangingClient = &self->_rangingClient;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_rangingClient);
  objc_msgSend(WeakRetained, "didFetchTxPower:fromDevice:withError:", v10, v9, v8);

}

- (void)didConnectDevice:(id)a3 error:(id)a4
{
  PRBTRangingClientProtocol **p_rangingClient;
  id v6;
  id v7;
  id WeakRetained;

  p_rangingClient = &self->_rangingClient;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_rangingClient);
  objc_msgSend(WeakRetained, "didConnectDevice:error:", v7, v6);

}

- (void)didStartRangingOnDevice:(id)a3 withError:(id)a4
{
  PRBTRangingClientProtocol **p_rangingClient;
  id v6;
  id v7;
  id WeakRetained;

  p_rangingClient = &self->_rangingClient;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_rangingClient);
  objc_msgSend(WeakRetained, "didStartRangingOnDevice:withError:", v7, v6);

}

- (void)didStopOwnerRangingOnDevice:(id)a3 withError:(id)a4
{
  PRBTRangingClientProtocol **p_rangingClient;
  id v6;
  id v7;
  id WeakRetained;

  p_rangingClient = &self->_rangingClient;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_rangingClient);
  objc_msgSend(WeakRetained, "didStopOwnerRangingOnDevice:withError:", v7, v6);

}

- (void)didReceiveNewBTRSSI:(id)a3
{
  PRBTRangingClientProtocol **p_rangingClient;
  id v4;
  id WeakRetained;

  p_rangingClient = &self->_rangingClient;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_rangingClient);
  objc_msgSend(WeakRetained, "didReceiveNewBTRSSI:", v4);

}

- (PRBTRangingClientProtocol)rangingClient
{
  return (PRBTRangingClientProtocol *)objc_loadWeakRetained((id *)&self->_rangingClient);
}

- (void)setRangingClient:(id)a3
{
  objc_storeWeak((id *)&self->_rangingClient, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_rangingClient);
}

@end
