@implementation CloudTabServices

+ (id)_serverConnection
{
  WebBookmarksXPCConnection *v2;

  v2 = [WebBookmarksXPCConnection alloc];
  return -[WebBookmarksXPCConnection initClientForMachService:](v2, "initClientForMachService:", kWebBookmarksdServiceName);
}

+ (void)clearAllCloudTabDevices
{
  void *v2;
  id v3;

  objc_msgSend(a1, "_serverConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageWithName:", kWebBookmarksClearAllCloudTabDevicesMessageName);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendMessage:", v2);

}

+ (void)clearTabsForCurrentDevice
{
  void *v2;
  id v3;

  objc_msgSend(a1, "_serverConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messageWithName:", kWebBookmarksClearCloudTabsForCurrentDeviceMessageName);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendMessage:", v2);

}

+ (void)didToggleCloudTabs:(BOOL)a3
{
  objc_msgSend(a1, "didToggleCloudTabs:terminateAfterUpdating:", a3, 0);
}

+ (void)didToggleCloudTabs:(BOOL)a3 terminateAfterUpdating:(BOOL)a4
{
  void *v6;
  id v7;

  objc_msgSend(a1, "_serverConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageWithName:", kWebBookmarksDidToggleCloudTabsMessageName);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_set_BOOL(v6, kWebBookmarksEnabledKey, a3);
  xpc_dictionary_set_BOOL(v6, kWebBookmarksTerminateAfterUpdatingKey, a4);
  objc_msgSend(v7, "sendMessage:", v6);

}

@end
