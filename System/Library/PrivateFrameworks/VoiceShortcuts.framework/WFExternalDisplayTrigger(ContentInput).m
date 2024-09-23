@implementation WFExternalDisplayTrigger(ContentInput)

- (uint64_t)requiresEventInfoAsInput
{
  return 1;
}

- (void)eventInfoForEvent:()ContentInput completion:
{
  void (**v5)(id, void *);
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(a3, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "deviceName");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(v6, "productName");
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = (void *)v9;
          objc_msgSend(v6, "uniqueId");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v6, "deviceName", CFSTR("WFDeviceName"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v22[0] = v12;
            v21[1] = CFSTR("ProductName");
            objc_msgSend(v6, "productName");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v22[1] = v13;
            v21[2] = CFSTR("UniqueId");
            objc_msgSend(v6, "uniqueId");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v22[2] = v14;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v5[2](v5, v15);

LABEL_14:
            goto LABEL_15;
          }
        }
        else
        {

        }
      }
      getWFTriggersLogObject();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v6, "deviceName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "productName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "uniqueId");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136316162;
        v24 = "-[WFExternalDisplayTrigger(ContentInput) eventInfoForEvent:completion:]";
        v25 = 2112;
        v26 = v6;
        v27 = 2112;
        v28 = v18;
        v29 = 2112;
        v30 = v19;
        v31 = 2112;
        v32 = v20;
        _os_log_impl(&dword_1C146A000, v17, OS_LOG_TYPE_ERROR, "%s Failed to create event info for display event due to nil property. <%@ deviceName: %@, productName: %@, uniqueId: %@>", buf, 0x34u);

      }
      v5[2](v5, 0);
      goto LABEL_14;
    }
  }

  getWFTriggersLogObject();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[WFExternalDisplayTrigger(ContentInput) eventInfoForEvent:completion:]";
    _os_log_impl(&dword_1C146A000, v16, OS_LOG_TYPE_DEFAULT, "%s Could not create display event no event info output", buf, 0xCu);
  }

  v5[2](v5, 0);
LABEL_15:

}

- (id)contentCollectionWithEventInfo:()ContentInput
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v3 = (objc_class *)MEMORY[0x1E0D13F40];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("UniqueId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("WFDeviceName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("ProductName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v5, "initWithDisplayUUID:deviceName:name:", v6, v7, v8);
  objc_msgSend(MEMORY[0x1E0D13F48], "itemWithObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0D13EA8];
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "collectionWithItems:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
