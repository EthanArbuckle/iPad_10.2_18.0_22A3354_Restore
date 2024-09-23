@implementation SpotlightDaemonServer

+ (id)sharedDaemonServer
{
  if (sharedDaemonServer_onceToken != -1)
    dispatch_once(&sharedDaemonServer_onceToken, &__block_literal_global_14);
  return (id)sharedDaemonServer_sSpotlightDaemonServer;
}

void __43__SpotlightDaemonServer_sharedDaemonServer__block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;
  int v4;
  id v5;

  v0 = objc_opt_new();
  v1 = (void *)sharedDaemonServer_sSpotlightDaemonServer;
  sharedDaemonServer_sSpotlightDaemonServer = v0;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = 1u;
  do
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)&sDisabledClientCStrings + v2));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "BOOLForKey:", v3);

    if (v4)
      sDisabledConnections[v2] = 1;
    ++v2;
  }
  while (v2 != 12);

}

- (BOOL)handleJob:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_msgSend(v10, "jobType");
  logForCSLogCategoryDefault();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v39 = v14;
    v40 = 2112;
    v41 = v11;
    _os_log_impl(&dword_213CF1000, v15, OS_LOG_TYPE_DEFAULT, "Handle job type %ld from %@", buf, 0x16u);
  }

  v16 = 0;
  if (-[SpotlightDaemonServer haveDaemonForBundleID:jobType:](self, "haveDaemonForBundleID:jobType:", v11, v14))
  {
    v17 = 0;
    v18 = 0;
    v19 = 1;
    switch(v14)
    {
      case 1:
        objc_msgSend(v10, "identifiersToReindex");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v32[0] = MEMORY[0x24BDAC760];
        v32[1] = 3221225472;
        v32[2] = __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_3;
        v32[3] = &unk_24D0EA938;
        v21 = &v33;
        v33 = v13;
        -[SpotlightDaemonServer issueReindexItemsWithIdentifiers:bundleID:protectionClass:acknowledgementHandler:](self, "issueReindexItemsWithIdentifiers:bundleID:protectionClass:acknowledgementHandler:", v20, v11, v12, v32);
        goto LABEL_14;
      case 2:
        objc_msgSend(v10, "reason");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v34[0] = MEMORY[0x24BDAC760];
        v34[1] = 3221225472;
        v34[2] = __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_2;
        v34[3] = &unk_24D0EA938;
        v21 = &v35;
        v35 = v13;
        -[SpotlightDaemonServer issueReindexAllItemsForBundleID:protectionClass:reason:acknowledgementHandler:](self, "issueReindexAllItemsForBundleID:protectionClass:reason:acknowledgementHandler:", v11, v12, v20, v34);
        goto LABEL_14;
      case 6:
        v17 = 1;
        goto LABEL_8;
      case 7:
        goto LABEL_10;
      case 8:
        v19 = 3;
LABEL_10:
        v18 = v19;
        goto LABEL_11;
      case 14:
LABEL_8:
        objc_msgSend(v10, "providerIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "providerType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_4;
        v30[3] = &unk_24D0EDFA0;
        v21 = &v31;
        v31 = v13;
        -[SpotlightDaemonServer provideDataForBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:](self, "provideDataForBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:", v11, v12, v20, v22, v17, v30);

        goto LABEL_14;
      case 15:
LABEL_11:
        objc_msgSend(v10, "providerIdentifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "providerType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x24BDAC760];
        v28[1] = 3221225472;
        v28[2] = __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_5;
        v28[3] = &unk_24D0EDFA0;
        v21 = &v29;
        v29 = v13;
        -[SpotlightDaemonServer provideFileURLForBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:](self, "provideFileURLForBundleID:protectionClass:itemIdentifier:typeIdentifier:options:completionHandler:", v11, v12, v20, v23, v18, v28);
        goto LABEL_13;
      case 16:
        objc_msgSend(v10, "providerIdentifiers");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "providerType");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = MEMORY[0x24BDAC760];
        v26[1] = 3221225472;
        v26[2] = __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_6;
        v26[3] = &unk_24D0EDFA0;
        v21 = &v27;
        v27 = v13;
        -[SpotlightDaemonServer provideFileURLsForBundleID:protectionClass:itemIdentifiers:typeIdentifier:options:completionHandler:](self, "provideFileURLsForBundleID:protectionClass:itemIdentifiers:typeIdentifier:options:completionHandler:", v11, v12, v20, v23, 1, v26);
LABEL_13:

        goto LABEL_14;
      case 17:
        objc_msgSend(v10, "updatedItems");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v10, "updatedItemsMask");
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke;
        v36[3] = &unk_24D0EA938;
        v21 = &v37;
        v37 = v13;
        -[SpotlightDaemonServer notifyUpdatesForItems:bundleID:interestedAttributeMask:acknowledgementHandler:](self, "notifyUpdatesForItems:bundleID:interestedAttributeMask:acknowledgementHandler:", v20, v11, v25, v36);
LABEL_14:

        v16 = 1;
        break;
      default:
        break;
    }
  }

  return v16;
}

uint64_t __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

uint64_t __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, 0, 0);
  return result;
}

void __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v6 = v3;
    if (v3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSDataForKey:fromXPCDictionary:", "d", v3);
      v4 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v5 = 0;
    }
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);

    v3 = v6;
  }

}

void __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v6 = v3;
    if (v3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSDataForKey:fromXPCDictionary:", "u", v3);
      v4 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v5 = 0;
    }
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);

    v3 = v6;
  }

}

void __78__SpotlightDaemonServer_handleJob_bundleID_protectionClass_completionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4)
  {
    v6 = v3;
    if (v3)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BDC24C8], "copyNSDataForKey:fromXPCDictionary:", "brs", v3);
      v4 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v5 = 0;
    }
    (*(void (**)(uint64_t, void *, _QWORD))(v4 + 16))(v4, v5, 0);

    v3 = v6;
  }

}

- (int64_t)clientTypeForBundleID:(id)a3 jobType:(int64_t)a4
{
  id v5;
  int64_t v6;
  void *v7;

  v5 = a3;
  if (clientTypeForBundleID_jobType__onceToken != -1)
    dispatch_once(&clientTypeForBundleID_jobType__onceToken, &__block_literal_global_22_0);
  if (byte_254D38C79 || (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.people.")) & 1) == 0)
  {
    if (byte_254D38C7A || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobileslideshow")) & 1) == 0)
    {
      if (byte_254D38C7B || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilecal")) & 1) == 0)
      {
        if (byte_254D38C7C || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.reminders")) & 1) == 0)
        {
          if (!byte_254D38C7D
            && objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.MobileSMS"))
            && (clientTypeForBundleID_jobType__messagesDaemonEnabled & 1) != 0)
          {
            v6 = 5;
          }
          else if (byte_254D38C7E || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.mobilemail")) & 1) == 0)
          {
            if (byte_254D38C7F || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.Stickers")) & 1) == 0)
            {
              if (byte_254D38C80
                || (objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.usernotificationsd")) & 1) == 0)
              {
                if (_os_feature_enabled_impl()
                  && !byte_254D38C81
                  && (objc_msgSend((id)fileProviderBundleIDs, "containsObject:", v5) & 1) != 0)
                {
                  v6 = 9;
                }
                else if (byte_254D38C82
                       || (objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.search.csdaemon")) & 1) == 0)
                {
                  if (!byte_254D38C83
                    && objc_msgSend(v5, "hasPrefix:", CFSTR("com.apple.search.csreceiver"))
                    && (+[SpotlightSender connectionForClient:jobType:](SpotlightSender, "connectionForClient:jobType:", 0, a4), v7 = (void *)objc_claimAutoreleasedReturnValue(), v7, v7))
                  {
                    v6 = 11;
                  }
                  else
                  {
                    v6 = 0;
                  }
                }
                else
                {
                  v6 = 10;
                }
              }
              else
              {
                v6 = 8;
              }
            }
            else
            {
              v6 = 7;
            }
          }
          else
          {
            v6 = 6;
          }
        }
        else
        {
          v6 = 4;
        }
      }
      else
      {
        v6 = 3;
      }
    }
    else
    {
      v6 = 2;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

uint64_t __55__SpotlightDaemonServer_clientTypeForBundleID_jobType___block_invoke()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  clientTypeForBundleID_jobType__messagesDaemonEnabled = result;
  return result;
}

- (id)connectionForClientType:(int64_t)a3 jobType:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  dispatch_once_t *v7;
  int64_t v9;
  _QWORD block[7];

  if ((unint64_t)(a3 - 1) > 0xA)
  {
    v6 = 0;
  }
  else
  {
    block[5] = v4;
    block[6] = v5;
    if (a3 == 11)
    {
      +[SpotlightSender connectionForClient:jobType:](SpotlightSender, "connectionForClient:jobType:", 0, a4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = (dispatch_once_t *)((char *)&connectionForClientType_jobType__onceTokens + 8 * a3);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __57__SpotlightDaemonServer_connectionForClientType_jobType___block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a3;
      if (*v7 != -1)
      {
        v9 = a3;
        dispatch_once(v7, block);
        a3 = v9;
      }
      v6 = (id)sConnections[a3];
    }
  }
  return v6;
}

void __57__SpotlightDaemonServer_connectionForClientType_jobType___block_invoke(uint64_t a1)
{
  SDXPCClientConnection *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (!sDisabledConnections[*(_QWORD *)(a1 + 32)])
  {
    v2 = [SDXPCClientConnection alloc];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *((_QWORD *)&sConnectionStrings + *(_QWORD *)(a1 + 32)));
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v3 = -[SDXPCClientConnection initWithServiceName:clientType:](v2, "initWithServiceName:clientType:", v6, *(_QWORD *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = (void *)sConnections[v4];
    sConnections[v4] = v3;

  }
}

- (id)connectionForBundleID:(id)a3 jobType:(int64_t)a4
{
  return -[SpotlightDaemonServer connectionForClientType:jobType:](self, "connectionForClientType:jobType:", -[SpotlightDaemonServer clientTypeForBundleID:jobType:](self, "clientTypeForBundleID:jobType:", a3), a4);
}

- (BOOL)haveDaemonForBundleID:(id)a3 jobType:(int64_t)a4
{
  return -[SpotlightDaemonServer clientTypeForBundleID:jobType:](self, "clientTypeForBundleID:jobType:", a3, a4) != 0;
}

- (void)issueReindexAllItemsForBundleID:(id)a3 protectionClass:(id)a4 reason:(id)a5 acknowledgementHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  xpc_object_t v15;
  __CFString *v16;
  __CFString *v17;
  _QWORD v18[4];
  void (**v19)(_QWORD);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  -[SpotlightDaemonServer connectionForBundleID:jobType:](self, "connectionForBundleID:jobType:", v10, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v15, "command", "ri");
    if (v11)
      xpc_dictionary_set_string(v15, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
    if (v12)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[SP-reindex] %@"), v12);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = CFSTR("[SP-reindex] reason unavailable");
    }
    v17 = objc_retainAutorelease(v16);
    xpc_dictionary_set_string(v15, "rire", (const char *)-[__CFString UTF8String](v17, "UTF8String"));
    xpc_dictionary_set_string(v15, "b", (const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"));
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __103__SpotlightDaemonServer_issueReindexAllItemsForBundleID_protectionClass_reason_acknowledgementHandler___block_invoke;
    v18[3] = &unk_24D0EDFA0;
    v19 = v13;
    objc_msgSend(v14, "sendMessageAsync:completion:", v15, v18);

  }
  else if (v13)
  {
    v13[2](v13);
  }

}

uint64_t __103__SpotlightDaemonServer_issueReindexAllItemsForBundleID_protectionClass_reason_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)issueReindexItemsWithIdentifiers:(id)a3 bundleID:(id)a4 protectionClass:(id)a5 acknowledgementHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  xpc_object_t v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  -[SpotlightDaemonServer connectionForBundleID:jobType:](self, "connectionForBundleID:jobType:", v11, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14 && objc_msgSend(v10, "count"))
  {
    v15 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v15, "command", "ri");
    if (v12)
      xpc_dictionary_set_string(v15, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
    xpc_dictionary_set_string(v15, "b", (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String"));
    objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setStringArray:forKey:", v15, v10, "idsa");
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __106__SpotlightDaemonServer_issueReindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke;
    v16[3] = &unk_24D0EDFA0;
    v17 = v13;
    objc_msgSend(v14, "sendMessageAsync:completion:", v15, v16);

  }
  else if (v13)
  {
    v13[2](v13);
  }

}

uint64_t __106__SpotlightDaemonServer_issueReindexItemsWithIdentifiers_bundleID_protectionClass_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)enumerateConnections:(id)a3 jobType:(int64_t)a4
{
  void (**v6)(id, _QWORD, void *);
  uint64_t v7;
  void **p_cache;
  __int128 v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  __int128 v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  _QWORD v30[3];

  v30[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD, void *))a3;
  v7 = 0;
  p_cache = SPCoreSpotlightIndexerTask.cache;
  *(_QWORD *)&v9 = 138412290;
  v21 = v9;
  v10 = 0x24BDD1000uLL;
  v11 = 0x24BDBC000uLL;
  do
  {
    if (v7 == 9)
    {
      objc_msgSend(p_cache[380], "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(*(id *)(v10 + 1992), "stringWithCString:encoding:", *((_QWORD *)&sBundleStrings + v7), 134217984);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v13;
      objc_msgSend(*(id *)(v11 + 3632), "arrayWithObjects:count:", v30, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if (sDisabledConnections[v7])
    {
      logForCSLogCategoryDefault();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v21;
        v29 = v12;
        _os_log_impl(&dword_213CF1000, v14, OS_LOG_TYPE_DEFAULT, "Skipping disabled connection for %@", buf, 0xCu);
      }
    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v22 = v12;
      v14 = v12;
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v24 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            -[SpotlightDaemonServer connectionForClientType:jobType:](self, "connectionForClientType:jobType:", v7, a4, v21);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v6[2](v6, v19, v20);

          }
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v16);
        p_cache = (void **)(SPCoreSpotlightIndexerTask + 16);
        v10 = 0x24BDD1000;
        v11 = 0x24BDBC000;
      }
      v12 = v22;
    }

    ++v7;
  }
  while (v7 != 12);

}

- (void)handleJob:(id)a3 protectionClass:(id)a4 perClientCompletionHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  dispatch_group_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  qos_class_t v20;
  NSObject *v21;
  id v22;
  id v23;
  _QWORD block[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  dispatch_group_t v29;
  SpotlightDaemonServer *v30;
  id v31;
  id v32;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = dispatch_group_create();
  v15 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __96__SpotlightDaemonServer_handleJob_protectionClass_perClientCompletionHandler_completionHandler___block_invoke;
  v27[3] = &unk_24D0EE368;
  v16 = v10;
  v28 = v16;
  v29 = v14;
  v30 = self;
  v31 = v11;
  v32 = v12;
  v17 = v12;
  v18 = v11;
  v19 = v14;
  -[SpotlightDaemonServer enumerateConnections:jobType:](self, "enumerateConnections:jobType:", v27, objc_msgSend(v16, "jobType"));
  v20 = qos_class_self();
  dispatch_get_global_queue(v20, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __96__SpotlightDaemonServer_handleJob_protectionClass_perClientCompletionHandler_completionHandler___block_invoke_63;
  block[3] = &unk_24D0EB780;
  v25 = v16;
  v26 = v13;
  v22 = v13;
  v23 = v16;
  dispatch_group_notify(v19, v21, block);

}

void __96__SpotlightDaemonServer_handleJob_protectionClass_perClientCompletionHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(*(id *)(a1 + 32), "excludedBundleIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v3);

    if ((v5 & 1) == 0)
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 40));
      v6 = *(void **)(a1 + 32);
      v7 = *(void **)(a1 + 48);
      v8 = *(_QWORD *)(a1 + 56);
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __96__SpotlightDaemonServer_handleJob_protectionClass_perClientCompletionHandler_completionHandler___block_invoke_2;
      v13[3] = &unk_24D0EE340;
      v14 = v6;
      v9 = v3;
      v15 = v9;
      v17 = *(id *)(a1 + 64);
      v16 = *(id *)(a1 + 40);
      if ((objc_msgSend(v7, "handleJob:bundleID:protectionClass:completionHandler:", v14, v9, v8, v13) & 1) == 0)
      {
        logForCSLogCategoryIndex();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v19 = v11;
          v20 = 2112;
          v21 = v9;
          _os_log_impl(&dword_213CF1000, v10, OS_LOG_TYPE_DEFAULT, "Performing job:%@ failed for daemon client \"%@\", buf, 0x16u);
        }

        v12 = *(_QWORD *)(a1 + 64);
        if (v12)
          (*(void (**)(uint64_t, id, _QWORD, _QWORD))(v12 + 16))(v12, v9, 0, 0);
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
      }

    }
  }

}

void __96__SpotlightDaemonServer_handleJob_protectionClass_perClientCompletionHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  logForCSLogCategoryIndex();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_7;
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(_QWORD *)(a1 + 40);
    v17 = 138412802;
    v18 = v9;
    v19 = 2112;
    v20 = v10;
    v21 = 2112;
    v22 = v6;
    v11 = "Failed performing job:%@ for daemon client \"%@\": %@";
    v12 = v7;
    v13 = 32;
  }
  else
  {
    if (!v8)
      goto LABEL_7;
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(_QWORD *)(a1 + 40);
    v17 = 138412546;
    v18 = v14;
    v19 = 2112;
    v20 = v15;
    v11 = "Done performing job:%@ for daemon client \"%@\";
    v12 = v7;
    v13 = 22;
  }
  _os_log_impl(&dword_213CF1000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v17, v13);
LABEL_7:

  v16 = *(_QWORD *)(a1 + 56);
  if (v16)
    (*(void (**)(uint64_t, _QWORD, id, id))(v16 + 16))(v16, *(_QWORD *)(a1 + 40), v5, v6);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __96__SpotlightDaemonServer_handleJob_protectionClass_perClientCompletionHandler_completionHandler___block_invoke_63(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  logForCSLogCategoryIndex();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_213CF1000, v2, OS_LOG_TYPE_DEFAULT, "Done performing job:%@ with daemon clients", (uint8_t *)&v5, 0xCu);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)provideDataForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  uint64_t v22;
  const char *v23;
  _QWORD v24[4];
  id v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (objc_msgSend(v14, "length"))
  {
    if (objc_msgSend(v16, "length"))
    {
      -[SpotlightDaemonServer connectionForBundleID:jobType:](self, "connectionForBundleID:jobType:", v14, 6);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (xpc_object_t)v19;
        v21 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v21, "command", "pd");
        if (v15)
          xpc_dictionary_set_string(v21, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
        xpc_dictionary_set_string(v21, "b", (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
        xpc_dictionary_set_string(v21, "id", (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
        if (objc_msgSend(v17, "length"))
          xpc_dictionary_set_string(v21, "t", (const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
        if (a7)
          xpc_dictionary_set_uint64(v21, "po", a7);
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __120__SpotlightDaemonServer_provideDataForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
        v24[3] = &unk_24D0EDFA0;
        v25 = v18;
        objc_msgSend(v20, "sendMessageAsync:completion:", v21, v24);

        goto LABEL_13;
      }
    }
  }
  v22 = objc_msgSend((id)*MEMORY[0x24BDD0B88], "UTF8String");
  if (v18)
  {
    v23 = (const char *)v22;
    v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v20, "status", 4099);
    xpc_dictionary_set_string(v20, "ed", v23);
    (*((void (**)(id, xpc_object_t))v18 + 2))(v18, v20);
LABEL_13:

  }
}

uint64_t __120__SpotlightDaemonServer_provideDataForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)provideFileURLForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifier:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  uint64_t v22;
  const char *v23;
  _QWORD v24[4];
  id v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (objc_msgSend(v14, "length"))
  {
    if (objc_msgSend(v16, "length"))
    {
      -[SpotlightDaemonServer connectionForBundleID:jobType:](self, "connectionForBundleID:jobType:", v14, 7);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (xpc_object_t)v19;
        v21 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v21, "command", "pu");
        if (v15)
          xpc_dictionary_set_string(v21, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
        xpc_dictionary_set_string(v21, "b", (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
        xpc_dictionary_set_string(v21, "id", (const char *)objc_msgSend(objc_retainAutorelease(v16), "UTF8String"));
        if (objc_msgSend(v17, "length"))
          xpc_dictionary_set_string(v21, "t", (const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
        if (a7)
          xpc_dictionary_set_uint64(v21, "po", a7);
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __123__SpotlightDaemonServer_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke;
        v24[3] = &unk_24D0EDFA0;
        v25 = v18;
        objc_msgSend(v20, "sendMessageAsync:completion:", v21, v24);

        goto LABEL_13;
      }
    }
  }
  v22 = objc_msgSend((id)*MEMORY[0x24BDD0B88], "UTF8String");
  if (v18)
  {
    v23 = (const char *)v22;
    v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v20, "status", 4099);
    xpc_dictionary_set_string(v20, "ed", v23);
    (*((void (**)(id, xpc_object_t))v18 + 2))(v18, v20);
LABEL_13:

  }
}

uint64_t __123__SpotlightDaemonServer_provideFileURLForBundleID_protectionClass_itemIdentifier_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)provideFileURLsForBundleID:(id)a3 protectionClass:(id)a4 itemIdentifiers:(id)a5 typeIdentifier:(id)a6 options:(int64_t)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  xpc_object_t v20;
  xpc_object_t v21;
  uint64_t v22;
  const char *v23;
  _QWORD v24[4];
  id v25;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  if (objc_msgSend(v14, "length"))
  {
    if (objc_msgSend(v16, "count"))
    {
      -[SpotlightDaemonServer connectionForBundleID:jobType:](self, "connectionForBundleID:jobType:", v14, 7);
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (xpc_object_t)v19;
        v21 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(v21, "command", "pus");
        if (v15)
          xpc_dictionary_set_string(v21, "pc", (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
        xpc_dictionary_set_string(v21, "b", (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
        objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setStringArray:forKey:", v21, v16, "idsa");
        if (objc_msgSend(v17, "length"))
          xpc_dictionary_set_string(v21, "t", (const char *)objc_msgSend(objc_retainAutorelease(v17), "UTF8String"));
        if (a7)
          xpc_dictionary_set_uint64(v21, "po", a7);
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = __125__SpotlightDaemonServer_provideFileURLsForBundleID_protectionClass_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke;
        v24[3] = &unk_24D0EDFA0;
        v25 = v18;
        objc_msgSend(v20, "sendMessageAsync:completion:", v21, v24);

        goto LABEL_13;
      }
    }
  }
  v22 = objc_msgSend((id)*MEMORY[0x24BDD0B88], "UTF8String");
  if (v18)
  {
    v23 = (const char *)v22;
    v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_int64(v20, "status", 4099);
    xpc_dictionary_set_string(v20, "ed", v23);
    (*((void (**)(id, xpc_object_t))v18 + 2))(v18, v20);
LABEL_13:

  }
}

uint64_t __125__SpotlightDaemonServer_provideFileURLsForBundleID_protectionClass_itemIdentifiers_typeIdentifier_options_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)notifyUpdatesForItems:(id)a3 bundleID:(id)a4 interestedAttributeMask:(int64_t)a5 acknowledgementHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  const char *v19;
  xpc_object_t v20;
  _QWORD v21[4];
  void (**v22)(_QWORD);
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  int64_t v26;
  __int16 v27;
  const char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  -[SpotlightDaemonServer connectionForBundleID:jobType:](self, "connectionForBundleID:jobType:", v11, 17);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  logForCSLogCategoryDaemonClient();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = os_signpost_id_generate(v14);

  logForCSLogCategoryDaemonClient();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    if (v10)
    {
      v18 = objc_msgSend(v10, "count");
      if (v11)
      {
LABEL_5:
        v19 = (const char *)objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
LABEL_8:
        *(_DWORD *)buf = 134218498;
        v24 = v18;
        v25 = 2048;
        v26 = a5;
        v27 = 2080;
        v28 = v19;
        _os_signpost_emit_with_name_impl(&dword_213CF1000, v17, OS_SIGNPOST_EVENT, v15, "NotifyClient", "count:%ld, mask:0x%lx, bid:%s", buf, 0x20u);
        goto LABEL_9;
      }
    }
    else
    {
      v18 = 0;
      if (v11)
        goto LABEL_5;
    }
    v19 = "";
    goto LABEL_8;
  }
LABEL_9:

  if (v13)
  {
    v20 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v20, "command", "siu");
    if (objc_msgSend(v10, "count"))
      objc_msgSend(MEMORY[0x24BDC24C8], "dictionary:setArray:forKey:", v20, v10, "si");
    if (a5)
      xpc_dictionary_set_uint64(v20, "iam", a5);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __103__SpotlightDaemonServer_notifyUpdatesForItems_bundleID_interestedAttributeMask_acknowledgementHandler___block_invoke;
    v21[3] = &unk_24D0EDFA0;
    v22 = v12;
    objc_msgSend(v13, "sendMessageAsync:completion:", v20, v21);

  }
  else if (v12)
  {
    v12[2](v12);
  }

}

uint64_t __103__SpotlightDaemonServer_notifyUpdatesForItems_bundleID_interestedAttributeMask_acknowledgementHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateFileProviderBundleIDs:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a3;
  logForCSLogCategoryDefault();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[SpotlightDaemonServer updateFileProviderBundleIDs:].cold.1((uint64_t)v3, v4);

  v5 = objc_msgSend(v3, "copy");
  v6 = (void *)fileProviderBundleIDs;
  fileProviderBundleIDs = v5;

}

- (void)updateFileProviderBundleIDs:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_213CF1000, a2, OS_LOG_TYPE_DEBUG, "New list of fileProvider bundle IDs: %@", (uint8_t *)&v2, 0xCu);
}

@end
