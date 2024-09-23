@implementation LNProperty(WFFetchValue)

- (void)wf_getValueForEntity:()WFFetchValue entityMetadata:completionHandler:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  _QWORD v22[5];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "properties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __82__LNProperty_WFFetchValue__wf_getValueForEntity_entityMetadata_completionHandler___block_invoke;
  v22[3] = &unk_1E7AF7558;
  v22[4] = a1;
  objc_msgSend(v11, "if_firstObjectPassingTest:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v13, "capabilities") & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D44188], "policyWithEntityMetadata:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v14, "connectionWithError:", &v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;
    if (v15)
    {
      objc_msgSend(a1, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v12;
      v19[1] = 3221225472;
      v19[2] = __82__LNProperty_WFFetchValue__wf_getValueForEntity_entityMetadata_completionHandler___block_invoke_104;
      v19[3] = &unk_1E7AF38B0;
      v19[4] = a1;
      v20 = v10;
      objc_msgSend(v15, "fetchValueForPropertyWithIdentifier:entity:completionHandler:", v17, v8, v19);

    }
    else
    {
      getWFGeneralLogObject();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "-[LNProperty(WFFetchValue) wf_getValueForEntity:entityMetadata:completionHandler:]";
        v25 = 2112;
        v26 = v16;
        _os_log_impl(&dword_1C15B3000, v18, OS_LOG_TYPE_ERROR, "%s Unable to create connection: %@", buf, 0x16u);
      }

      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }

  }
  else
  {
    objc_msgSend(a1, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v10 + 2))(v10, v14);
  }

}

@end
