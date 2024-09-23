@implementation PSGInternalRequestHandler

- (PSGInternalRequestHandler)init
{
  void *v3;
  PSGInternalRequestHandler *v4;

  +[PSGExperimentResolver sharedInstance](PSGExperimentResolver, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PSGInternalRequestHandler _initWithExperimentResolver:](self, "_initWithExperimentResolver:", v3);

  return v4;
}

- (id)_initWithExperimentResolver:(id)a3
{
  id v5;
  PSGInternalRequestHandler *v6;
  PSGInternalRequestHandler *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSGInternalRequestHandler;
  v6 = -[PSGInternalRequestHandler init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_experimentResolver, a3);

  return v7;
}

- (void)setRemoteObjectProxy:(id)a3
{
  objc_storeStrong((id *)&self->_clientProxy, a3);
}

- (id)_getZKWExperimentInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x24BDAC8D0];
  -[PSGExperimentResolver getResponseSuggestionsExperimentConfig:shouldDownloadAssets:](self->_experimentResolver, "getResponseSuggestionsExperimentConfig:shouldDownloadAssets:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("treatment");
  objc_msgSend(v3, "treatmentName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = CFSTR("experiment-id");
  objc_msgSend(v3, "experimentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v5;
  v21[2] = CFSTR("treatment-id");
  objc_msgSend(v3, "experimentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v7;
  v21[3] = CFSTR("ml-enabled");
  v8 = objc_msgSend(v3, "isMLModelEnabled");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  v22[3] = v9;
  v21[4] = CFSTR("model-config");
  objc_msgSend(v3, "inferenceModelConfigPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = CFSTR("nil");
  v22[4] = v13;
  v21[5] = CFSTR("model-file");
  objc_msgSend(v3, "espressoBinFilePath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastPathComponent");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = CFSTR("nil");
  v22[5] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_getWordBoundaryExperimentInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v20;
  _QWORD v21[6];
  _QWORD v22[7];

  v22[6] = *MEMORY[0x24BDAC8D0];
  -[PSGExperimentResolver getWordBoundarySuggestionsExperimentConfig:shouldDownloadAssets:](self->_experimentResolver, "getWordBoundarySuggestionsExperimentConfig:shouldDownloadAssets:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = CFSTR("treatment");
  objc_msgSend(v3, "treatmentName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v20;
  v21[1] = CFSTR("experiment-id");
  objc_msgSend(v3, "experimentIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "experimentId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v5;
  v21[2] = CFSTR("treatment-id");
  objc_msgSend(v3, "experimentIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "treatmentId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[2] = v7;
  v21[3] = CFSTR("ml-enabled");
  v8 = objc_msgSend(v3, "isMLModelEnabled");
  v9 = CFSTR("NO");
  if (v8)
    v9 = CFSTR("YES");
  v22[3] = v9;
  v21[4] = CFSTR("model-config");
  objc_msgSend(v3, "inferenceModelConfigPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "lastPathComponent");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (const __CFString *)v11;
  else
    v13 = CFSTR("nil");
  v22[4] = v13;
  v21[5] = CFSTR("model-file");
  objc_msgSend(v3, "espressoBinFilePath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lastPathComponent");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
    v17 = (const __CFString *)v15;
  else
    v17 = CFSTR("nil");
  v22[5] = v17;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_getPreferredLanguages
{
  return (id)objc_msgSend(MEMORY[0x24BE71AD0], "userLanguages");
}

- (void)sysdiagnoseInformationWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void (**v18)(id, void *, id);
  id obj;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[2];
  _QWORD v26[2];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v18 = (void (**)(id, void *, id))a3;
  v16 = objc_opt_new();
  v4 = (void *)objc_opt_new();
  -[PSGInternalRequestHandler _getPreferredLanguages](self, "_getPreferredLanguages");
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        v25[0] = CFSTR("WB");
        -[PSGInternalRequestHandler _getWordBoundaryExperimentInfo:](self, "_getWordBoundaryExperimentInfo:", v9, v16);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v25[1] = CFSTR("ZKW");
        v26[0] = v10;
        -[PSGInternalRequestHandler _getZKWExperimentInfo:](self, "_getZKWExperimentInfo:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v26[1] = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v9);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v6);
  }
  if (!objc_msgSend(v4, "count", v16))
    objc_msgSend(v4, "setObject:forKeyedSubscript:", CFSTR("No preferredLanguages"), CFSTR("Error"));
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v4, CFSTR("ExperimentInfo"));

  v20 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v17, 3, &v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v20;
  if (v13)
  {
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v13, 4);
    v18[2](v18, v15, v14);

  }
  else
  {
    v18[2](v18, 0, v14);
  }

}

- (NSString)clientProcessName
{
  return self->_clientProcessName;
}

- (void)setClientProcessName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (_PASBundleIdResolver)bundleIdResolver
{
  return self->_bundleIdResolver;
}

- (void)setBundleIdResolver:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdResolver, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdResolver, 0);
  objc_storeStrong((id *)&self->_clientProcessName, 0);
  objc_storeStrong((id *)&self->_experimentResolver, 0);
  objc_storeStrong((id *)&self->_clientProxy, 0);
}

@end
