@implementation WFWifiTrigger(BiomeContext)

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
  objc_msgSend(v6, "WiFi");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "DSLPublisher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeOn:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  void *v11;
  NSObject *v12;
  int v13;
  int v14;
  void *v15;
  void *v16;
  char v17;
  _BOOL8 v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  int v29;
  const char *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    getWFTriggersLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 136315394;
      v30 = "-[WFWifiTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEFAULT, "%s Received WiFi connection event %@ for trigger with setting", (uint8_t *)&v29, 0x16u);
    }

    v13 = objc_msgSend(v11, "starting");
    if (v13 != objc_msgSend(a1, "onConnect"))
    {
      v14 = objc_msgSend(v11, "starting");
      if (v14 == objc_msgSend(a1, "onDisconnect"))
        goto LABEL_15;
    }
    if (objc_msgSend(a1, "selection") == 1
      && (objc_msgSend(a1, "selectedNetworks"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v11, "SSID"),
          v16 = (void *)objc_claimAutoreleasedReturnValue(),
          v17 = objc_msgSend(v15, "containsObject:", v16),
          v16,
          v15,
          (v17 & 1) == 0))
    {
LABEL_15:
      v10[2](v10, 0);
    }
    else
    {
      if (objc_msgSend(a1, "onConnect") && (objc_msgSend(a1, "runAfterConnectionInterruption") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0DD9D00], "defaultDatabase");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "sortedRunEventsForTriggerID:", v9);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "descriptors");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          v24 = (void *)MEMORY[0x1E0C99D68];
          objc_msgSend(v8, "timestamp");
          objc_msgSend(v24, "dateWithTimeIntervalSinceReferenceDate:");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "date");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "timeIntervalSinceDate:", v26);
          v28 = v27;

          v18 = v28 > 180.0;
        }
        else
        {
          v18 = 1;
        }

      }
      else
      {
        v18 = 1;
      }
      v10[2](v10, v18);
    }

  }
  else
  {

    getWFTriggersLogObject();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 136315138;
      v30 = "-[WFWifiTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_DEFAULT, "%s No WiFi event received for trigger; not firing.",
        (uint8_t *)&v29,
        0xCu);
    }

    v10[2](v10, 0);
  }

}

@end
