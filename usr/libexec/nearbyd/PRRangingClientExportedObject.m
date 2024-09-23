@implementation PRRangingClientExportedObject

- (PRRangingClientExportedObject)initWithRangingClient:(id)a3
{
  id v4;
  PRRangingClientExportedObject *v5;
  PRRangingClientExportedObject *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PRRangingClientExportedObject;
  v5 = -[PRRangingClientExportedObject init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_rangingClient, v4);

  return v6;
}

- (void)didFailWithError:(id)a3
{
  PRRangingClientProtocol **p_rangingClient;
  id v4;
  id WeakRetained;

  p_rangingClient = &self->_rangingClient;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_rangingClient);
  objc_msgSend(WeakRetained, "didFailWithError:", v4);

}

- (void)rangingServiceDidUpdateState:(unint64_t)a3 cause:(int64_t)a4
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_rangingClient);
  objc_msgSend(WeakRetained, "rangingServiceDidUpdateState:cause:", a3, a4);

}

- (void)didReceiveNewSolutions:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rangingClient);
  if ((objc_opt_respondsToSelector(WeakRetained, "didReceiveNewSolutions:") & 1) != 0)
    objc_msgSend(WeakRetained, "didReceiveNewSolutions:", v5);

}

- (void)rangingRequestDidUpdateStatus:(unint64_t)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_rangingClient);
  if ((objc_opt_respondsToSelector(WeakRetained, "rangingRequestDidUpdateStatus:") & 1) != 0)
    objc_msgSend(WeakRetained, "rangingRequestDidUpdateStatus:", a3);

}

- (void)remoteDevice:(id)a3 didChangeState:(int64_t)a4
{
  id WeakRetained;
  id v7;

  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rangingClient);
  if ((objc_opt_respondsToSelector(WeakRetained, "remoteDevice:didChangeState:") & 1) != 0)
    objc_msgSend(WeakRetained, "remoteDevice:didChangeState:", v7, a4);

}

- (void)sendDataToPeers:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rangingClient);
  if ((objc_opt_respondsToSelector(WeakRetained, "sendDataToPeers:") & 1) != 0)
    objc_msgSend(WeakRetained, "sendDataToPeers:", v5);

}

- (PRRangingClientProtocol)rangingClient
{
  return (PRRangingClientProtocol *)objc_loadWeakRetained((id *)&self->_rangingClient);
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
