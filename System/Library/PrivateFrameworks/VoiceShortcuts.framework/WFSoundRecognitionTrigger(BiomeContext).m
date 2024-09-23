@implementation WFSoundRecognitionTrigger(BiomeContext)

- (id)publisherWithScheduler:()BiomeContext
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0D027B8];
  v4 = a3;
  objc_msgSend(v3, "soundDetection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "publisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subscribeOn:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)shouldFireInResponseToEvent:()BiomeContext triggerIdentifier:completion:
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v14 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(a1, "soundDetectionTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __100__WFSoundRecognitionTrigger_BiomeContext__shouldFireInResponseToEvent_triggerIdentifier_completion___block_invoke;
  v22[3] = &unk_1E7AA5EC8;
  v22[4] = &v23;
  objc_msgSend(v15, "if_map:", v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWithSet:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (*((_BYTE *)v24 + 24))
  {
    objc_msgSend(MEMORY[0x1E0DD9C10], "allBMApplianceTypes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setByAddingObjectsFromArray:", v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v19;
  }
  getWFTriggersLogObject();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v28 = "-[WFSoundRecognitionTrigger(BiomeContext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
    v29 = 2114;
    v30 = v13;
    v31 = 2114;
    v32 = v17;
    _os_log_impl(&dword_1C146A000, v20, OS_LOG_TYPE_DEFAULT, "%s Received sound detection event %{public}@ for trigger containing sound detection types %{public}@", buf, 0x20u);
  }

  objc_msgSend(v13, "type");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2](v10, objc_msgSend(v17, "containsObject:", v21));

  _Block_object_dispose(&v23, 8);
}

@end
