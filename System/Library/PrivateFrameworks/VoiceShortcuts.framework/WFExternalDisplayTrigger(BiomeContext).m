@implementation WFExternalDisplayTrigger(BiomeContext)

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
  objc_msgSend(v4, "SpringBoard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ExternalDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "DisplayConnected");
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
  int v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v9 = objc_msgSend(v8, "starting");
    if (v9 == objc_msgSend(a1, "onConnect"))
    {
      v11 = 1;
    }
    else
    {
      v10 = objc_msgSend(v8, "starting");
      v11 = v10 ^ objc_msgSend(a1, "onDisconnect");
    }
    v7[2](v7, v11);

  }
  else
  {

    getWFTriggersLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[WFExternalDisplayTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEFAULT, "%s No display event received for trigger; not firing.",
        (uint8_t *)&v13,
        0xCu);
    }

    v7[2](v7, 0);
  }

}

@end
