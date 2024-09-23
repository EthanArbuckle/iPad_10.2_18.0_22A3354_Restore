@implementation WFTrigger(PowerLog)

+ (id)powerLogEventKindForTrigger:()PowerLog
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (powerLogEventKindForTrigger__onceToken != -1)
    dispatch_once(&powerLogEventKindForTrigger__onceToken, &__block_literal_global_1820);
  v4 = (void *)powerLogEventKindForTrigger__eventKinds;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    getWFTriggersLogObject();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "+[WFTrigger(PowerLog) powerLogEventKindForTrigger:]";
      v12 = 2112;
      v13 = objc_opt_class();
      _os_log_impl(&dword_1C146A000, v8, OS_LOG_TYPE_ERROR, "%s Missing eventKind for %@", (uint8_t *)&v10, 0x16u);
    }

    v7 = &unk_1E7ABF678;
  }

  return v7;
}

@end
