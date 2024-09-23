@implementation WFLinkActionFromSerializedRepresentation

void __WFLinkActionFromSerializedRepresentation_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1E0CB3710];
  v7 = a3;
  v11 = 0;
  objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v7, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v11;
  if (v9)
  {
    getWFAppIntentsLogObject();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "WFLinkActionFromSerializedRepresentation_block_invoke";
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_1C15B3000, v10, OS_LOG_TYPE_FAULT, "%s Failed to decode LNValue from data: %@", buf, 0x16u);
    }
  }
  else
  {
    v10 = objc_msgSend(objc_alloc(MEMORY[0x1E0D43D98]), "initWithIdentifier:value:", v5, v8);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  }

}

@end
