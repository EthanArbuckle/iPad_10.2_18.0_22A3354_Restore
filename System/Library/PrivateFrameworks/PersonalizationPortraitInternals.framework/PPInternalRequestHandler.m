@implementation PPInternalRequestHandler

- (void)setAssetMetadataRefreshIntervalSeconds:(double)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAssetMetadataRefreshIntervalSeconds:", a3);

  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _QWORD))v7 + 2))(v7, 0);
    v6 = v7;
  }

}

- (void)clearAssetMetadataRefreshIntervalSecondsWithCompletion:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clearAssetMetadataRefreshIntervalSeconds");

  v4 = v5;
  if (v5)
  {
    (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
    v4 = v5;
  }

}

- (void)assetMetadataRefreshIntervalSecondsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetMetadataRefreshIntervalSeconds");
  (*((void (**)(id, uint64_t, _QWORD))a3 + 2))(v4, 1, 0);

}

- (void)setAssetDefaultBundleOverridePath:(id)a3 assetIdentifier:(id)a4 completion:(id)a5
{
  id v5;
  void (**v6)(id, _QWORD);

  if (a5)
    v5 = a5;
  else
    v5 = &__block_literal_global_117_17326;
  v6 = (void (**)(id, _QWORD))_Block_copy(v5);
  v6[2](v6, 0);

}

- (void)assetDefaultBundleOverridePathForAssetIdentifier:(id)a3 completion:(id)a4
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void (**v8)(id, void *, _QWORD);

  if (a4)
    v4 = a4;
  else
    v4 = &__block_literal_global_119_17324;
  v5 = a3;
  v8 = (void (**)(id, void *, _QWORD))_Block_copy(v4);
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetDefaultBundleOverridePathForAssetIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8[2](v8, v7, 0);
}

- (void)assetVersionsWithCompletion:(id)a3
{
  if (a3)
    (*((void (**)(id, void *, _QWORD))a3 + 2))(a3, &unk_1E7E5BF40, 0);
}

- (void)trialOverridePath:(id)a3 namespaceName:(id)a4 factorName:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  void (**v11)(id, uint64_t, _QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void (**)(id, uint64_t, _QWORD))a6;
  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v16)
    objc_msgSend(v12, "overrideFilepathForFileFactor:namespaceName:path:", v10, v9, v16);
  else
    objc_msgSend(v12, "clearOverrideFilepathForFileFactor:namespaceName:", v10, v9);

  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTrialPathOverrideForNamespaceName:factorName:path:", v9, v10, v16);

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "callRegisteredUpdateHandlersForNamespaceName:", v9);

  v11[2](v11, 1, 0);
}

- (void)setTrialUseDefaultFiles:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(id, uint64_t, _QWORD);

  v4 = a3;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  +[PPSettings sharedInstance](PPSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTrialUseDefaultFiles:", v4);

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUseDefaultFiles:", v4);

  +[PPTrialWrapper sharedInstance](PPTrialWrapper, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "callRegisteredUpdateHandlers");

  v8[2](v8, 1, 0);
}

- (void)sysdiagnoseInformationWithCompletion:(id)a3
{
  void (**v3)(id, void *, id);
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  const __CFString *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  const __CFString *v30;
  void *v31;
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v3 = (void (**)(id, void *, id))a3;
  v4 = (void *)objc_opt_new();
  +[PPSQLDatabase nonMigratingToolsInstance](PPSQLDatabase, "nonMigratingToolsInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "stats");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v6, "checkWithError:", &v25);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v25;
    if (v9)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@"), v9);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("dbCheck-error"));

    }
    +[PPConfiguration sharedInstance](PPConfiguration, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "portraitVariantName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v32[0] = CFSTR("stats");
    v32[1] = CFSTR("check");
    v33[0] = v7;
    v33[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, v32, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("database"));

    v30 = CFSTR("variantName");
    v31 = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("configuration"));

  }
  else
  {
    v28[0] = CFSTR("stats");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = CFSTR("check");
    v29[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v17, CFSTR("database"));

    v26 = CFSTR("variantName");
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("configuration"));
  }

  v18 = (void *)objc_opt_new();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("assets"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assets"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setObject:forKeyedSubscript:", &unk_1E7E5BF68, CFSTR("common"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assets"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", &unk_1E7E5BF90, CFSTR("non-watch"));

  v24 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v4, 3, &v24);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v24;
  if (v21)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v21, 4);
    v3[2](v3, v23, v22);

  }
  else
  {
    v3[2](v3, 0, v22);
  }

}

@end
