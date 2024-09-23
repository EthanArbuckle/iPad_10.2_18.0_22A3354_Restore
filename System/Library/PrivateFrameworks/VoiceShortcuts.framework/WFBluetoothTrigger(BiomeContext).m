@implementation WFBluetoothTrigger(BiomeContext)

- (id)publisherWithScheduler:()BiomeContext
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  BiomeLibrary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Device");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Wireless");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Bluetooth");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "DSLPublisher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeOn:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  void (**v7)(id, _QWORD);
  void *v8;
  NSObject *v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    getWFTriggersLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315394;
      v16 = "-[WFBluetoothTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_DEFAULT, "%s Received Bluetooth connection event %@ for trigger with setting", (uint8_t *)&v15, 0x16u);
    }

    v10 = objc_msgSend(v8, "starting");
    if (v10 != objc_msgSend(a1, "onConnect")
      && (v11 = objc_msgSend(v8, "starting"), v11 == objc_msgSend(a1, "onDisconnect")))
    {
      v7[2](v7, 0);
    }
    else if (objc_msgSend(a1, "selection") == 1)
    {
      objc_msgSend(a1, "selectedDevices");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, objc_msgSend(v12, "containsObject:", v13));

    }
    else
    {
      v7[2](v7, 1);
    }

  }
  else
  {

    getWFTriggersLogObject();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 136315138;
      v16 = "-[WFBluetoothTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C146A000, v14, OS_LOG_TYPE_DEFAULT, "%s No Bluetooth event received for trigger; not firing.",
        (uint8_t *)&v15,
        0xCu);
    }

    v7[2](v7, 0);
  }

}

@end
