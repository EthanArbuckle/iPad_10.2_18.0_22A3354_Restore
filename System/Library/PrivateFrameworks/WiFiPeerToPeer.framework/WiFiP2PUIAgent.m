@implementation WiFiP2PUIAgent

- (WiFiP2PUIAgent)init
{
  WiFiP2PUIAgent *v2;
  WiFiP2PUIAgent *v3;
  UNUserNotificationCenter *notificationCenter;
  WiFiP2PXPCConnection *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  uint64_t v8;
  WiFiP2PXPCConnection *xpcConnection;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WiFiP2PUIAgent;
  v2 = -[WiFiP2PUIAgent init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    notificationCenter = v2->_notificationCenter;
    v2->_notificationCenter = 0;

    v5 = [WiFiP2PXPCConnection alloc];
    +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop](WiFiP2PXPCConnection, "wifiPeerToPeerWorkloop");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiP2PUIAgent", 0, v6);
    v8 = -[WiFiP2PXPCConnection initWithEndpointType:queue:retryTimeout:](v5, "initWithEndpointType:queue:retryTimeout:", 0, v7, -1);
    xpcConnection = v3->_xpcConnection;
    v3->_xpcConnection = (WiFiP2PXPCConnection *)v8;

    -[WiFiP2PXPCConnection setDelegate:](v3->_xpcConnection, "setDelegate:", v3);
  }
  return v3;
}

- (void)activate
{
  -[WiFiP2PXPCConnection start](self->_xpcConnection, "start");
}

- (void)invalidate
{
  -[WiFiP2PXPCConnection invalidate](self->_xpcConnection, "invalidate");
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
  objc_msgSend(a3, "createXPCResponderWithType:completionHandler:", 4, a4);
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF1A4C80);
}

- (void)configureNotificationsWithBundleIdentifier:(id)a3
{
  objc_class *v4;
  id v5;
  UNUserNotificationCenter *v6;
  UNUserNotificationCenter *notificationCenter;

  v4 = (objc_class *)MEMORY[0x1E0CEC798];
  v5 = a3;
  v6 = (UNUserNotificationCenter *)objc_msgSend([v4 alloc], "initWithBundleIdentifier:", v5);

  notificationCenter = self->_notificationCenter;
  self->_notificationCenter = v6;

  -[UNUserNotificationCenter removeAllDeliveredNotifications](self->_notificationCenter, "removeAllDeliveredNotifications");
  -[UNUserNotificationCenter removeAllPendingNotificationRequests](self->_notificationCenter, "removeAllPendingNotificationRequests");
}

- (void)addNotificationRequest:(id)a3 completionHandler:(id)a4
{
  -[UNUserNotificationCenter addNotificationRequest:withCompletionHandler:](self->_notificationCenter, "addNotificationRequest:withCompletionHandler:", a3, a4);
}

- (void)removeNotificationsWithIdentifiers:(id)a3
{
  -[UNUserNotificationCenter removeDeliveredNotificationsWithIdentifiers:](self->_notificationCenter, "removeDeliveredNotificationsWithIdentifiers:", a3);
}

- (void)showInfrastructureDisconnectOnRetroModeNotificationForService:(id)a3 localization:(id)a4 phoneDisconnected:(BOOL)a5 uuid:(id)a6 completionHandler:(id)a7
{
  _BOOL4 v9;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  int v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  int v40;
  id v41;
  uint64_t v42;

  v9 = a5;
  v42 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x1E0CEC6D8]);
  v17 = MGGetBoolAnswer();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CEC730], "iconNamed:", CFSTR("iPhone"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIcon:", v18);

    +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v20 = CFSTR("iPhone WLAN Disconnected");
      goto LABEL_6;
    }
    v26 = CFSTR("iPhone Wi-Fi Disconnected");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEC730], "iconNamed:", CFSTR("iPad"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIcon:", v21);

    +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v20 = CFSTR("iPad WLAN Disconnected");
LABEL_6:
      objc_msgSend(v19, "localizedStringForKey:value:table:localization:", v20, 0, 0, v13);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setTitle:", v22);

      if (objc_msgSend(v12, "isEqualToString:", CFSTR("RemoteCamera")))
      {
        +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = CFSTR("To optimize Continuity Camera, your iPhone has disconnected from WLAN. Plug it in with a cable to use WLAN.");
      }
      else
      {
        if (!objc_msgSend(v12, "isEqualToString:", CFSTR("sidecar")))
          goto LABEL_17;
        +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v23;
        v25 = CFSTR("To optimize Sidecar, your iPad has disconnected from WLAN. Plug it in with a cable to use WLAN.");
      }
      goto LABEL_16;
    }
    v26 = CFSTR("iPad Wi-Fi Disconnected");
  }
  objc_msgSend(v19, "localizedStringForKey:value:table:localization:", v26, 0, 0, v13);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTitle:", v27);

  if (objc_msgSend(v12, "isEqualToString:", CFSTR("RemoteCamera")))
  {
    +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = CFSTR("To optimize Continuity Camera, your iPhone has disconnected from Wi-Fi. Plug it in with a cable to use Wi-Fi.");
  }
  else
  {
    if (!objc_msgSend(v12, "isEqualToString:", CFSTR("sidecar")))
      goto LABEL_17;
    +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = CFSTR("To optimize Sidecar, your iPad has disconnected from Wi-Fi. Plug it in with a cable to use Wi-Fi.");
  }
LABEL_16:
  objc_msgSend(v23, "localizedStringForKey:value:table:localization:", v25, 0, 0, v13);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBody:", v28);

LABEL_17:
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("TVRemoteCamera")))
  {
    +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:localization:", CFSTR("Optimizing Continuity Camera connection."), 0, 0, v13);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBody:", v30);

  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("RemoteScreen")))
  {
    +[WiFiP2PXPCConnection frameworkBundle](WiFiP2PXPCConnection, "frameworkBundle");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "localizedStringForKey:value:table:localization:", CFSTR("Optimizing iPhone Mirroring connection."), 0, 0, v13);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBody:", v32);

  }
  objc_msgSend(v16, "title");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33
    && (v34 = (void *)v33,
        objc_msgSend(v16, "body"),
        v35 = (void *)objc_claimAutoreleasedReturnValue(),
        v35,
        v34,
        v35))
  {
    objc_msgSend(MEMORY[0x1E0CEC768], "defaultSound");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSound:", v36);

    objc_msgSend(v16, "setShouldIgnoreDoNotDisturb:", 1);
    objc_msgSend(v16, "setShouldIgnoreDowntime:", 1);
    objc_msgSend(v16, "setShouldHideDate:", 1);
    objc_msgSend(v16, "setShouldHideTime:", 1);
    v37 = (void *)MEMORY[0x1E0CEC748];
    objc_msgSend(v14, "UUIDString");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "requestWithIdentifier:content:trigger:", v38, v16, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[WiFiP2PUIAgent addNotificationRequest:completionHandler:](self, "addNotificationRequest:completionHandler:", v39, v15);

  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v40 = 138543362;
    v41 = v12;
    _os_log_error_impl(&dword_1B8247000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Skipping WiFi disconnect notification for %{public}@", (uint8_t *)&v40, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
