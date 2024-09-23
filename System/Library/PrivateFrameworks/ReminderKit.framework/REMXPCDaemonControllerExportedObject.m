@implementation REMXPCDaemonControllerExportedObject

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_cloudKitNetworkActivityDelegate);
}

- (void)setCloudKitNetworkActivityDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_cloudKitNetworkActivityDelegate, a3);
}

- (void)cloudKitNetworkActivityDidUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMXPCDaemonControllerExportedObject cloudKitNetworkActivityDelegate](self, "cloudKitNetworkActivityDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudKitNetworkActivityDidChange:", v4);

}

- (REMXPCDaemonControllerCloudKitNetworkActivityDelegate)cloudKitNetworkActivityDelegate
{
  return (REMXPCDaemonControllerCloudKitNetworkActivityDelegate *)objc_loadWeakRetained((id *)&self->_cloudKitNetworkActivityDelegate);
}

@end
