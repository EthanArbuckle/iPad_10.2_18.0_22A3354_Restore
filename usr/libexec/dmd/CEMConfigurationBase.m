@implementation CEMConfigurationBase

- (id)dmf_installSynthesizedProfileRequestWithAssetProviders:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  unsigned __int8 v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  unsigned __int8 v18;
  void *v19;
  uint64_t v20;
  id v22;
  id v23;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CEMConfigurationBase synthesizeProfileOutUUIDs:withOldUUIDs:assetProviders:](self, "synthesizeProfileOutUUIDs:withOldUUIDs:assetProviders:", v7, 0, v6));

  v9 = DMFConfigurationEngineLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_100070EAC();

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PayloadContent")));
  v12 = objc_msgSend(v11, "count");

  if (!v12)
  {
    v13 = (id)objc_opt_new(DMFRemoveConfigurationRequest);
    objc_msgSend(v13, "setType:", 0);
    objc_msgSend(v13, "setProfile:", v8);
    v22 = 0;
    v18 = +[DMDRemoveConfigurationOperation validateRequest:error:](DMDRemoveConfigurationOperation, "validateRequest:error:", v13, &v22);
    v15 = v22;
    if ((v18 & 1) == 0)
    {
      v20 = DMFConfigurationEngineLog();
      v17 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        sub_100070DBC(v15);
      goto LABEL_11;
    }
LABEL_8:
    v13 = v13;
    v19 = v13;
    goto LABEL_14;
  }
  v13 = (id)objc_opt_new(DMFInstallConfigurationRequest);
  objc_msgSend(v13, "setProfile:", v8);
  objc_msgSend(v13, "setType:", 0);
  v23 = 0;
  v14 = +[DMDInstallConfigurationOperation validateRequest:error:](DMDInstallConfigurationOperation, "validateRequest:error:", v13, &v23);
  v15 = v23;
  if ((v14 & 1) != 0)
    goto LABEL_8;
  v16 = DMFConfigurationEngineLog();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    sub_100070E34(v15);
LABEL_11:

  if (a4)
  {
    v15 = objc_retainAutorelease(v15);
    v19 = 0;
    *a4 = v15;
  }
  else
  {
    v19 = 0;
  }
LABEL_14:

  return v19;
}

- (id)dmf_removeSynthesizedProfileRequestWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v16;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CEMConfigurationBase synthesizeProfileOutUUIDs:withOldUUIDs:assetProviders:](self, "synthesizeProfileOutUUIDs:withOldUUIDs:assetProviders:", v5, 0, &__NSDictionary0__struct));
  v7 = DMFConfigurationEngineLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_100070EAC();

  v9 = (void *)objc_opt_new(DMFRemoveConfigurationRequest);
  objc_msgSend(v9, "setType:", 0);
  objc_msgSend(v9, "setProfile:", v6);
  v16 = 0;
  v10 = +[DMDRemoveConfigurationOperation validateRequest:error:](DMDRemoveConfigurationOperation, "validateRequest:error:", v9, &v16);
  v11 = v16;
  if ((v10 & 1) != 0)
  {
    v12 = v9;
  }
  else
  {
    v13 = DMFConfigurationEngineLog();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100070DBC(v11);

    v12 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v11);
  }

  return v12;
}

@end
