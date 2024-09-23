@implementation ListenerTracking

- (NIServerAccessoryGATTServiceListener)listener
{
  return (NIServerAccessoryGATTServiceListener *)objc_loadWeakRetained((id *)&self->_listener);
}

- (void)setListener:(id)a3
{
  objc_storeWeak((id *)&self->_listener, a3);
}

- (NSUUID)peerIdentifier
{
  return self->_peerIdentifier;
}

- (void)setPeerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_peerIdentifier, a3);
}

- (NIConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_peerIdentifier, 0);
  objc_destroyWeak((id *)&self->_listener);
}

@end
