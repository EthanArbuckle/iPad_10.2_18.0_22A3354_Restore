@implementation SCSharingReminderDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  id v6;
  SCSharingReminderXPCClient *v7;
  BOOL v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  __objc2_class **v13;
  void *v14;
  SCSharingReminderXPCService *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = -[SCSharingReminderXPCClient initWithConnection:]([SCSharingReminderXPCClient alloc], "initWithConnection:", v6);
  v8 = -[SCSharingReminderXPCClient hasAccess](v7, "hasAccess");
  SCLogger();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      objc_msgSend(v6, "serviceName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v5;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_2454C0000, v9, OS_LOG_TYPE_DEFAULT, "\"Accepting new connection with listener: %@ for: %@\", (uint8_t *)&v17, 0x16u);

    }
    v12 = -[SCSharingReminderXPCClient hasFeatureAccess](v7, "hasFeatureAccess");
    v13 = off_2516620C0;
    if (!v12)
      v13 = off_2516620E0;
    -[__objc2_class interface](*v13, "interface");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setExportedInterface:", v14);

    v15 = -[SCSharingReminderXPCService initWithClient:]([SCSharingReminderXPCService alloc], "initWithClient:", v7);
    objc_msgSend(v6, "setExportedObject:", v15);

    objc_msgSend(v6, "resume");
  }
  else
  {
    if (v10)
    {
      v17 = 67109120;
      LODWORD(v18) = objc_msgSend(v6, "processIdentifier");
      _os_log_impl(&dword_2454C0000, v9, OS_LOG_TYPE_DEFAULT, "\"Rejecting process %d because it is not entitled to use SCSharingReminders\", (uint8_t *)&v17, 8u);
    }

  }
  return v8;
}

@end
