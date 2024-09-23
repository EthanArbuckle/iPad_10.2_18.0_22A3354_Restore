@implementation SDShareSheetRecipientServer

- (void)activate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDShareSheetRecipientServer;
  -[SDXPCDaemon _activate](&v2, "_activate");
}

- (void)invalidate
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SDShareSheetRecipientServer;
  -[SDXPCDaemon _invalidate](&v2, "_invalidate");
}

- (id)machServiceName
{
  return CFSTR("com.apple.sharing.sharesheetrecipients");
}

- (BOOL)shouldAcceptNewConnection:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  id v10;
  int v12;
  unsigned int v13;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueForEntitlement:", CFSTR("com.apple.sharesheet.recipients")));
  v6 = objc_opt_class(NSNumber, v5);
  if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0 && (objc_msgSend(v4, "BOOLValue") & 1) != 0)
  {
    v7 = share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 67109120;
      v13 = objc_msgSend(v3, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Allowing connection from pid %d to sharingd recipient server", (uint8_t *)&v12, 8u);
    }
    v9 = 1;
  }
  else
  {
    v10 = share_sheet_log();
    v8 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 67109120;
      v13 = objc_msgSend(v3, "processIdentifier");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "process %d tried to connect to the sharingd recipient server, but it was not entitled!", (uint8_t *)&v12, 8u);
    }
    v9 = 0;
  }

  return v9;
}

- (id)exportedInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____UIActivityRecipientInterface);
}

- (id)remoteObjectInterface
{
  return +[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL____UIActivityRecipientInterface);
}

- (void)requestMessagesRecipientInfoForSessionID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
  objc_msgSend(v7, "requestMessagesRecipientInfoForSessionID:completionHandler:", v6, v5);

}

- (void)requestRecipientsForSessionID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  if (a4)
  {
    v6 = a4;
    v7 = a3;
    v9 = (id)objc_claimAutoreleasedReturnValue(+[SDShareSheetSlotManager sharedManager](SDShareSheetSlotManager, "sharedManager"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "recipientHandlesForSessionID:", v7));

    (*((void (**)(id, void *))a4 + 2))(v6, v8);
  }
}

@end
