@implementation WFNFCTrigger(BiomeContext)

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
  objc_msgSend(v6, "NFCTag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "DSLPublisher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeOn:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  void (**v7)(id, uint64_t);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  const char *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    getWFTriggersLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[WFNFCTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_DEFAULT, "%s Received NFC connection event %@ for trigger with setting", (uint8_t *)&v17, 0x16u);
    }

    objc_msgSend(v8, "tagID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "tagIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v10;
    v13 = v11;
    v14 = v13;
    if (v12 == v13)
    {
      v15 = 1;
    }
    else
    {
      v15 = 0;
      if (v12 && v13)
        v15 = objc_msgSend(v12, "isEqualToString:", v13);
    }

    v7[2](v7, v15);
  }
  else
  {

    getWFTriggersLogObject();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315138;
      v18 = "-[WFNFCTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_DEFAULT, "%s No NFC event received for trigger; not firing.",
        (uint8_t *)&v17,
        0xCu);
    }

    v7[2](v7, 0);
  }

}

@end
