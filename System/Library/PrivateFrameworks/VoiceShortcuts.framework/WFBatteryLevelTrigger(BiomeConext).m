@implementation WFBatteryLevelTrigger(BiomeConext)

- (id)publisherWithScheduler:()BiomeConext
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
  objc_msgSend(v5, "Power");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "BatteryLevel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "DSLPublisher");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subscribeOn:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)shouldFireInResponseToEvent:()BiomeConext triggerIdentifier:completion:
{
  id v8;
  void (**v9)(id, _BOOL8);
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  _BOOL8 v25;
  double v26;
  _BOOL8 v27;
  double v28;
  double v29;
  double v30;
  double v31;
  _BOOL8 v32;
  NSObject *v33;
  id v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v34 = a4;
  v9 = a5;
  objc_msgSend(v8, "eventBody");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__745;
  v40 = __Block_byref_object_dispose__746;
  v41 = 0;
  BiomeLibrary();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "Device");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "Power");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "BatteryLevel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D026F0]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 1, 2, 0);
  objc_msgSend(v16, "publisherWithUseCase:options:", CFSTR("SHORTCUTS_AUTOMATIONS"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __95__WFBatteryLevelTrigger_BiomeConext__shouldFireInResponseToEvent_triggerIdentifier_completion___block_invoke_2;
  v35[3] = &unk_1E7AA5F30;
  v35[4] = &v36;
  v19 = (id)objc_msgSend(v18, "sinkWithCompletion:receiveInput:", &__block_literal_global_748, v35);

  v20 = objc_msgSend(a1, "selection");
  if (!v20)
  {
    objc_msgSend(v12, "batteryPercentage", v34);
    v27 = v26 == (double)(unint64_t)objc_msgSend(a1, "level");
    goto LABEL_17;
  }
  if (v20 != 1)
  {
    if (v20 == 2)
    {
      objc_msgSend(v12, "batteryPercentage", v34);
      v22 = v21;
      v23 = (double)(unint64_t)objc_msgSend(a1, "level");
      if (v22 >= v23)
      {
        v25 = 0;
      }
      else
      {
        objc_msgSend((id)v37[5], "eventBody");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "batteryPercentage");
        v25 = v24 == (double)(unint64_t)objc_msgSend(a1, "level");
      }
      v9[2](v9, v25);
      if (v22 >= v23)
        goto LABEL_24;
LABEL_23:

      goto LABEL_24;
    }
    getWFTriggersLogObject();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v43 = "-[WFBatteryLevelTrigger(BiomeConext) shouldFireInResponseToEvent:triggerIdentifier:completion:]";
      _os_log_impl(&dword_1C146A000, v33, OS_LOG_TYPE_FAULT, "%s Invalid case hit for WFBatteryLevelTrigger", buf, 0xCu);
    }

    v27 = 0;
LABEL_17:
    v9[2](v9, v27);
    goto LABEL_24;
  }
  objc_msgSend(v12, "batteryPercentage", v34);
  v29 = v28;
  v30 = (double)(unint64_t)objc_msgSend(a1, "level");
  if (v29 <= v30)
  {
    v32 = 0;
  }
  else
  {
    objc_msgSend((id)v37[5], "eventBody");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "batteryPercentage");
    v32 = v31 == (double)(unint64_t)objc_msgSend(a1, "level");
  }
  v9[2](v9, v32);
  if (v29 > v30)
    goto LABEL_23;
LABEL_24:
  _Block_object_dispose(&v36, 8);

}

@end
