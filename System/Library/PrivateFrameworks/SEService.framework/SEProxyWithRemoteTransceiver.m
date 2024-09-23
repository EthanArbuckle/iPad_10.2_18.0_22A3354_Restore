@implementation SEProxyWithRemoteTransceiver

- (void)setRemoteTransceiver:(id)a3
{
  objc_storeStrong((id *)&self->_remoteTransceiver, a3);
}

- (void)transceive:(id)a3 callback:(id)a4
{
  STSRemoteTransceiverProxy *remoteTransceiver;
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  id v9;
  id v10;

  remoteTransceiver = self->_remoteTransceiver;
  v10 = 0;
  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  -[STSRemoteTransceiverProxy transceive:outError:](remoteTransceiver, "transceive:outError:", v7, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  NSLog(CFSTR("SERT: remote transceiver returning %@ %@ %@"), v7, v8, v9);

  v6[2](v6, v8, v9);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteTransceiver, 0);
}

@end
