@implementation WFCarPlayConnectionTrigger(BiomeContext)

- (id)publisherWithScheduler:()BiomeContext
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D027B8];
  v4 = a3;
  objc_msgSend(v3, "carPlayStream");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribeOn:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  void (**v7)(id, uint64_t);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    getWFTriggersLogObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315394;
      v14 = "-[WFCarPlayConnectionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      v15 = 2112;
      v16 = v8;
      _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_DEFAULT, "%s Received CarPlay connection event %@ for trigger with setting", (uint8_t *)&v13, 0x16u);
    }

    v10 = (void *)objc_opt_new();
    if (objc_msgSend(a1, "onConnect"))
      objc_msgSend(v10, "addObject:", MEMORY[0x1E0C9AAB0]);
    if (objc_msgSend(a1, "onDisconnect"))
      objc_msgSend(v10, "addObject:", MEMORY[0x1E0C9AAA0]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v8, "isStart"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, objc_msgSend(v10, "containsObject:", v11));

  }
  else
  {

    getWFTriggersLogObject();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 136315138;
      v14 = "-[WFCarPlayConnectionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C146A000, v12, OS_LOG_TYPE_DEFAULT, "%s No CarPlay event received for trigger; not firing.",
        (uint8_t *)&v13,
        0xCu);
    }

    v7[2](v7, 0);
  }

}

@end
