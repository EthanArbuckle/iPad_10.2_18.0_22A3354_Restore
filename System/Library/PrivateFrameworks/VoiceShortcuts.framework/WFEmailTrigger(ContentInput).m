@implementation WFEmailTrigger(ContentInput)

- (uint64_t)requiresEventInfoAsInput
{
  return 1;
}

- (id)contentCollectionWithEventInfo:()ContentInput
{
  id v3;
  NSObject *v4;
  id v5;
  char isKindOfClass;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  getWFTriggersLogObject();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[WFEmailTrigger(ContentInput) contentCollectionWithEventInfo:]";
    v19 = 2112;
    v20 = v3;
    _os_log_impl(&dword_1C146A000, v4, OS_LOG_TYPE_INFO, "%s Creating EmailContentItem from eventinfo: %@", buf, 0x16u);
  }

  v5 = v3;
  if (!v5 || (objc_opt_class(), isKindOfClass = objc_opt_isKindOfClass(), v5, (isKindOfClass & 1) == 0))
  {
    getWFTriggersLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[WFEmailTrigger(ContentInput) contentCollectionWithEventInfo:]";
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1C146A000, v7, OS_LOG_TYPE_ERROR, "%s Event info (%@) was not of type NSDictionary", buf, 0x16u);
    }
    goto LABEL_19;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("NewValue"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v10 = v9;

    v16 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v7 = objc_claimAutoreleasedReturnValue();

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_19:
    v12 = 0;
    goto LABEL_20;
  }
  v7 = v7;
  if (v7)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v7;
    else
      v11 = 0;
  }
  else
  {
    v11 = 0;
  }
  v14 = v11;

  -[NSObject if_map:](v14, "if_map:", &__block_literal_global_7504);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13EA8], "collectionWithItems:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
  return v12;
}

@end
