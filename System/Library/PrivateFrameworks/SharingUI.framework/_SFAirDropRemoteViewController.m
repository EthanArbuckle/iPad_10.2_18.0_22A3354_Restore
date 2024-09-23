@implementation _SFAirDropRemoteViewController

+ (id)serviceViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B8F790);
}

+ (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254B739F0);
}

- (void)airDropViewServiceWillStartTransferToRecipient:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_SFAirDropRemoteViewController airDropHost](self, "airDropHost");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "airDropViewServiceWillStartTransferToRecipient:", v4);

}

- (void)airDropViewServiceDidStartTransfer
{
  id v2;

  -[_SFAirDropRemoteViewController airDropHost](self, "airDropHost");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "airDropViewServiceDidStartTransfer");

}

- (void)airDropViewServiceDidFinishTransferWithSuccess:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_SFAirDropRemoteViewController airDropHost](self, "airDropHost");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "airDropViewServiceDidFinishTransferWithSuccess:", v3);

}

- (void)airDropViewServiceRequestingSharedItemsWithDataRequest:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[_SFAirDropRemoteViewController airDropHost](self, "airDropHost");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "airDropViewServiceRequestingSharedItemsWithDataRequest:completionHandler:", v7, v6);

}

- (void)airDropViewServiceRequestingSendingAppBundleIdentifierWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[_SFAirDropRemoteViewController airDropHost](self, "airDropHost");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "airDropViewServiceRequestingSendingAppBundleIdentifierWithCompletionHandler:", v4);

}

- (void)airDropViewServiceDidRequestDismissal
{
  id v2;

  -[_SFAirDropRemoteViewController airDropHost](self, "airDropHost");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "airDropViewServiceDidRequestDismissal");

}

- (SFAirDropViewServiceHostProtocol)airDropHost
{
  return (SFAirDropViewServiceHostProtocol *)objc_loadWeakRetained((id *)&self->_airDropHost);
}

- (void)setAirDropHost:(id)a3
{
  objc_storeWeak((id *)&self->_airDropHost, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_airDropHost);
}

@end
