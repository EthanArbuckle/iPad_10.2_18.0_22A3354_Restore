@implementation LNSymbolImage(Workflow)

- (id)serializedRepresentation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "systemName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "if_setObjectIfNonNil:forKey:", v3, CFSTR("systemName"));

  return v2;
}

- (id)wf_image
{
  void *v2;
  void *v3;
  Class UIColorClass;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  Class UIImageSymbolConfigurationClass;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "platform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("UIKit")))
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    UIColorClass = getUIColorClass();
    objc_msgSend(a1, "tintColorData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", UIColorClass, v5, &v26);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v26;

    v8 = (void *)MEMORY[0x1E0CB3710];
    UIImageSymbolConfigurationClass = getUIImageSymbolConfigurationClass();
    objc_msgSend(a1, "configurationData");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v7;
    objc_msgSend(v8, "unarchivedObjectOfClass:fromData:error:", UIImageSymbolConfigurationClass, v10, &v25);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v25;

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0DC7B80], "configurationWithUIImageSymbolConfiguration:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

    if (v12)
    {
      getWFAppIntentsLogObject();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v28 = "-[LNSymbolImage(Workflow) wf_image]";
        v29 = 2112;
        v30 = v12;
        _os_log_impl(&dword_1C15B3000, v14, OS_LOG_TYPE_ERROR, "%s Failed to decode symbol configuration or tintColor data: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v13 = 0;
    v6 = 0;
    v12 = 0;
  }
  v15 = (void *)MEMORY[0x1E0DC7B70];
  objc_msgSend(a1, "systemName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "inImage");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "_renderingMode");
  if (v18 == 2)
    v19 = 2;
  else
    v19 = v18 == 1;
  objc_msgSend(v15, "systemImageNamed:configuration:renderingMode:", v16, v13, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithCGColor:", objc_msgSend(objc_retainAutorelease(v6), "CGColor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "imageWithTintColor:", v21);
    v22 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v22;
  }
  objc_msgSend(v20, "imageWithDisplayStyle:", objc_msgSend(a1, "wfImageDisplayStyleFromLNImageDisplayStyle:", objc_msgSend(a1, "displayStyle")));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)initWithSerializedRepresentation:()Workflow variableProvider:parameter:
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v4 = a3;
  v5 = objc_opt_class();
  WFEnforceClass(v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("systemName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v10 = v8;

    if (objc_msgSend(v10, "length"))
    {
      a1 = (id)objc_msgSend(a1, "initWithSymbolSystemName:", v10);
      v9 = a1;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
