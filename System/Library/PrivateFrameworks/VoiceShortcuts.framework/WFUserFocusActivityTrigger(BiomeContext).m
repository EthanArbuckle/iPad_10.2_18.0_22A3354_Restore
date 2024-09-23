@implementation WFUserFocusActivityTrigger(BiomeContext)

- (id)publisherWithScheduler:()BiomeContext
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D027B8];
  v4 = a3;
  objc_msgSend(v3, "userFocusComputedMode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribeOn:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  void (**v7)(id, _QWORD);
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  const char *v20;
  void *v21;
  void *v22;
  char v23;
  uint64_t v24;
  int v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  objc_msgSend(a3, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      getWFTriggersLogObject();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v8, "semanticModeIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mode");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "semanticModeIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v8, "isStarting");
        objc_msgSend(a1, "activityUniqueIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "activitySemanticIdentifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136317186;
        v27 = "-[WFUserFocusActivityTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
        v28 = 2114;
        v29 = v10;
        v30 = 2114;
        v31 = v11;
        v32 = 2114;
        v33 = v12;
        v34 = 1024;
        v35 = v25;
        v36 = 2114;
        v37 = v13;
        v38 = 2114;
        v39 = v14;
        v40 = 1024;
        v41 = objc_msgSend(a1, "onEnable");
        v42 = 1024;
        v43 = objc_msgSend(a1, "onDisable");
        _os_log_impl(&dword_1C146A000, v9, OS_LOG_TYPE_DEFAULT, "%s Received change for Kettle mode (%{public}@) — incoming change (uuid: %{public}@, id: %{public}@, starting: %i), trigger (uuid: %{public}@, id: %{public}@, onEnable: %i, onDisable: %i)", buf, 0x50u);

      }
      objc_msgSend(a1, "activitySemanticIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(a1, "activitySemanticIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "semanticModeIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqualToString:", v17);

        if ((v18 & 1) == 0)
        {
          getWFTriggersLogObject();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v27 = "-[WFUserFocusActivityTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
            v20 = "%s Received Kettle mode change, but the semantic mode identifier didn't match the trigger's semantic m"
                  "ode identifier, not firing";
LABEL_18:
            _os_log_impl(&dword_1C146A000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
            goto LABEL_19;
          }
          goto LABEL_19;
        }
      }
      else
      {
        objc_msgSend(a1, "activityUniqueIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "mode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqualToString:", v22);

        if ((v23 & 1) == 0)
        {
          getWFTriggersLogObject();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            v27 = "-[WFUserFocusActivityTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
            v20 = "%s Received Kettle mode change and the trigger has no semantic mode identifier. The unique identifier "
                  "didn't match the trigger's unique identifier, not firing";
            goto LABEL_18;
          }
LABEL_19:

          v7[2](v7, 0);
LABEL_22:

          goto LABEL_23;
        }
      }
      if (objc_msgSend(v8, "isStarting") && (objc_msgSend(a1, "onEnable") & 1) != 0)
      {
        v24 = 1;
      }
      else if ((objc_msgSend(v8, "isStarting") & 1) != 0)
      {
        v24 = 0;
      }
      else
      {
        v24 = objc_msgSend(a1, "onDisable");
      }
      v7[2](v7, v24);
      goto LABEL_22;
    }
  }

  v7[2](v7, 0);
LABEL_23:

}

@end
