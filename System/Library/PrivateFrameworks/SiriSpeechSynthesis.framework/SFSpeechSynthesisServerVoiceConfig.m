@implementation SFSpeechSynthesisServerVoiceConfig

- (SFSpeechSynthesisServerVoiceConfig)initWithUrl:(id)a3 useBlazar:(BOOL)a4 enableAuthentication:(BOOL)a5
{
  id v9;
  SFSpeechSynthesisServerVoiceConfig *v10;
  SFSpeechSynthesisServerVoiceConfig *v11;
  objc_super v13;

  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SFSpeechSynthesisServerVoiceConfig;
  v10 = -[SFSpeechSynthesisServerVoiceConfig init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_ospreyEndpointUrl, a3);
    v11->_useBlazar = a4;
    v11->_enableAuthentication = a5;
  }

  return v11;
}

- (NSString)ospreyEndpointUrl
{
  return self->_ospreyEndpointUrl;
}

- (BOOL)useBlazar
{
  return self->_useBlazar;
}

- (BOOL)enableAuthentication
{
  return self->_enableAuthentication;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ospreyEndpointUrl, 0);
}

+ (id)getTtsServerEndpointByCluster:(id)a3 withServiceType:(id)a4
{
  NSObject *v5;
  dispatch_semaphore_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  uint32_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  dispatch_semaphore_t dsema;
  void *v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  dispatch_semaphore_t v42;
  _BYTE *v43;
  uint8_t v44[4];
  void *v45;
  uint8_t v46[128];
  _BYTE buf[24];
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v34 = a3;
  v35 = a4;
  SFSSGetLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v34;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v35;
    _os_log_impl(&dword_21E284000, v5, OS_LOG_TYPE_INFO, "GetTtsServerEndpoint, cluster=%@, serverType=%@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v48 = __Block_byref_object_copy__475;
  v49 = __Block_byref_object_dispose__476;
  v50 = 0;
  v6 = dispatch_semaphore_create(0);
  v36 = objc_alloc_init(MEMORY[0x24BDD16B0]);
  v7 = (void *)MEMORY[0x24BDBCF48];
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("https://tts-service-tts-tts-proxy-server-dev.usmsc04.app.apple.com/proxy/get_all_tts_service?cluster=%@&service=%@"), v34, v35);
  objc_msgSend(v7, "URLWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setURL:", v9);

  objc_msgSend(v36, "setHTTPMethod:", CFSTR("GET"));
  v10 = (void *)MEMORY[0x24BDD1850];
  objc_msgSend(MEMORY[0x24BDD1858], "defaultSessionConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sessionWithConfiguration:", v11);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __84__SFSpeechSynthesisServerVoiceConfig_getTtsServerEndpointByCluster_withServiceType___block_invoke;
  v41[3] = &unk_24E246A70;
  v43 = buf;
  dsema = v6;
  v42 = dsema;
  objc_msgSend(v33, "dataTaskWithRequest:completionHandler:", v36, v41);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "resume");

  dispatch_semaphore_wait(dsema, 0xFFFFFFFFFFFFFFFFLL);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v13 = *(id *)(*(_QWORD *)&buf[8] + 40);
    v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v38 != v15)
            objc_enumerationMutation(v13);
          v17 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
          objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectForKey:", v17);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = arc4random_uniform(objc_msgSend(v20, "count"));

            objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "objectForKey:", v17);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndexedSubscript:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            SFSSGetLogObject();
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v44 = 138412290;
              v45 = v23;
              _os_log_impl(&dword_21E284000, v24, OS_LOG_TYPE_INFO, "Selected endpoint=%@", v44, 0xCu);
            }

            objc_msgSend(v23, "componentsSeparatedByString:", CFSTR(":"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if ((unint64_t)objc_msgSend(v25, "count") > 1)
            {
              v26 = (void *)MEMORY[0x24BDD17C8];
              objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "stringWithFormat:", CFSTR("http://%@:%@"), v27, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              SFSSGetLogObject();
              v30 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v44 = 138412290;
                v45 = v29;
                _os_log_impl(&dword_21E284000, v30, OS_LOG_TYPE_INFO, "Selected URL=%@", v44, 0xCu);
              }

              v14 = v29;
              v13 = v14;
              goto LABEL_21;
            }

          }
        }
        v14 = (id)objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_21:

  }
  else
  {
    v14 = 0;
  }

  _Block_object_dispose(buf, 8);
  return v14;
}

void __84__SFSpeechSynthesisServerVoiceConfig_getTtsServerEndpointByCluster_withServiceType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  NSObject *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (v6)
  {
    SFSSGetLogObject();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v6;
      _os_log_error_impl(&dword_21E284000, v7, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
    }
  }
  else
  {
    v16 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", a2, 0, &v16);
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = v16;
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    SFSSGetLogObject();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v18 = v12;
      _os_log_impl(&dword_21E284000, v11, OS_LOG_TYPE_INFO, "jsonResponse: %@", buf, 0xCu);
    }

    if (v7)
    {
      SFSSGetLogObject();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v7;
        _os_log_error_impl(&dword_21E284000, v13, OS_LOG_TYPE_ERROR, "jsonError: %@", buf, 0xCu);
      }

      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = 0;

    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
