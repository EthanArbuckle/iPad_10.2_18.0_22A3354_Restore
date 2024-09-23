@implementation UAFAssetSet

- (id)assetNamed:(id)a3
{
  __CFString *v4;
  NSDictionary *assets;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  NSObject *v12;
  NSUUID *v13;
  NSString *name;
  uint64_t v15;
  void *v16;
  BOOL v17;
  NSUUID *uuid;
  NSObject *v19;
  NSUUID *v21;
  int v22;
  const char *v23;
  __int16 v24;
  NSUUID *v25;
  __int16 v26;
  NSString *p_isa;
  __int16 v28;
  __CFString *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = (__CFString *)a3;
  assets = self->_assets;
  if (assets)
  {
    -[NSDictionary objectForKeyedSubscript:](assets, "objectForKeyedSubscript:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
    {
      v11 = CFSTR("none");
LABEL_12:
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uuid = self->_uuid;
        v22 = 136315906;
        v23 = "-[UAFAssetSet assetNamed:]";
        v24 = 2114;
        v25 = uuid;
        v26 = 2114;
        p_isa = &v4->isa;
        v28 = 2114;
        v29 = v11;
        _os_log_impl(&dword_229282000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Returning %{public}@ from source %{public}@", (uint8_t *)&v22, 0x2Au);
      }
      goto LABEL_17;
    }
    -[NSObject metadata](v6, "metadata");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("com.apple.UnifiedAssetFramework.Source"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[NSObject metadata](v7, "metadata");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("com.apple.UnifiedAssetFramework.Source"));
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = CFSTR("none");
    }
    -[NSObject location](v7, "location");
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_12;
    v16 = (void *)v15;
    v17 = +[UAFAssetSet isAssetValid:context:](UAFAssetSet, "isAssetValid:context:", v7, CFSTR("assetNamed"));

    if (v17)
      goto LABEL_12;
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21 = self->_uuid;
      v22 = 136315906;
      v23 = "-[UAFAssetSet assetNamed:]";
      v24 = 2114;
      v25 = v21;
      v26 = 2114;
      p_isa = &v4->isa;
      v28 = 2114;
      v29 = (__CFString *)v7;
      _os_log_error_impl(&dword_229282000, v19, OS_LOG_TYPE_ERROR, "%s %{public}@: Asset %{public}@ is not valid, returning nil instead of: %{public}@", (uint8_t *)&v22, 0x2Au);
    }

    v12 = v7;
    v7 = 0;
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = self->_uuid;
      name = self->_name;
      v22 = 136315906;
      v23 = "-[UAFAssetSet assetNamed:]";
      v24 = 2114;
      v25 = v13;
      v26 = 2114;
      p_isa = name;
      v28 = 2114;
      v29 = v4;
      _os_log_impl(&dword_229282000, v12, OS_LOG_TYPE_DEFAULT, "%s %{public}@: No assets in asset set %{public}@ while querying %{public}@", (uint8_t *)&v22, 0x2Au);
    }
    v7 = 0;
    v11 = CFSTR("none");
  }
LABEL_17:

  return v7;
}

+ (BOOL)isAssetValid:(id)a3 context:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  int v20;
  id v21;
  _OWORD v22[9];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  memset(v22, 0, sizeof(v22));
  objc_msgSend(v4, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v7 = +[UAFCommonUtilities stat:withBuf:error:](UAFCommonUtilities, "stat:withBuf:error:", v6, v22, &v21);
  v8 = v21;

  if (v7 || (v20 = WORD2(v22[0]) & 0xF000, v18 = 1, v20 != 0x4000) && v20 != 0x8000)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "location");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316418;
      v24 = "+[UAFAssetSet isAssetValid:context:]";
      v25 = 2114;
      v26 = v11;
      v27 = 1024;
      v28 = v7;
      v29 = 1024;
      v30 = WORD2(v22[0]);
      v31 = 1024;
      v32 = WORD3(v22[0]);
      v33 = 2114;
      v34 = v8;
      _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s stat(%{public}@) = %d, type: %x, link count: %d, error: %{public}@", buf, 0x32u);

    }
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "+[UAFAssetSet isAssetValid:context:]";
      v25 = 2114;
      v26 = v4;
      _os_log_fault_impl(&dword_229282000, v12, OS_LOG_TYPE_FAULT, "%s Asset missing: %{public}@", buf, 0x16u);
    }

    UAFGetLogCategory((id *)&UAFLogContextClient);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = kUAFABCMissingAssetFailure;
    v15 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v4, "name");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    UAFFaultCapture((uint64_t)v13, (uint64_t)v14, (uint64_t)v17, 0);

    v18 = 0;
  }

  return v18;
}

- (id)assets
{
  return self->_assets;
}

+ (id)getEntitledTrialAssets:(id)a3 usages:(id)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  os_signpost_id_t spid;
  unint64_t v33;
  void *v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  void *v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v36 = a3;
  v5 = a4;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v33 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_229282000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "TrialEntitlements", (const char *)&unk_2292ECD19, buf, 2u);
  }
  spid = v7;

  v34 = v5;
  objc_msgSend(v36, "getTrialAssets:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFTrialConversions entitledTrialNamespaceNames](UAFTrialConversions, "entitledTrialNamespaceNames");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v38;
    v17 = CFSTR("TrialNamespace");
    v35 = v12;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v38 != v16)
          objc_enumerationMutation(v12);
        v19 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKeyedSubscript:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v11, "containsObject:", v21) & 1) != 0)
        {
          if (!v15)
            v15 = (void *)objc_opt_new();
          objc_msgSend(v12, "objectForKeyedSubscript:", v19);
          v22 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v22, v19);
        }
        else
        {
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v36, "name");
            v23 = v14;
            v24 = v17;
            v25 = v16;
            v26 = v15;
            v27 = v11;
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v42 = "+[UAFAssetSet getEntitledTrialAssets:usages:]";
            v43 = 2114;
            v44 = v19;
            v45 = 2114;
            v46 = v28;
            v47 = 2114;
            v48 = v21;
            _os_log_impl(&dword_229282000, v22, OS_LOG_TYPE_DEFAULT, "%s Not including asset %{public}@ in asset set %{public}@ due to lack of entitlement for Namespace %{public}@", buf, 0x2Au);

            v11 = v27;
            v15 = v26;
            v16 = v25;
            v17 = v24;
            v14 = v23;
            v12 = v35;
          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v14);
  }
  else
  {
    v15 = 0;
  }

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v33 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_229282000, v30, OS_SIGNPOST_INTERVAL_END, spid, "TrialEntitlements", (const char *)&unk_2292ECD19, buf, 2u);
  }

  return v15;
}

+ (id)getTrialPurgeabilityLevel:(unint64_t)a3
{
  if (a3 - 1 > 3)
    return 0;
  else
    return (id)qword_24F1F8778[a3 - 1];
}

+ (id)autoAssets:(id)a3 usages:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "autoAssetType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      goto LABEL_9;
    objc_msgSend(v5, "name");
    v11 = objc_claimAutoreleasedReturnValue();
    v14 = 136315394;
    v15 = "+[UAFAssetSet autoAssets:usages:]";
    v16 = 2114;
    v17 = v11;
    _os_log_debug_impl(&dword_229282000, v9, OS_LOG_TYPE_DEBUG, "%s Auto asset type not specified for %{public}@", (uint8_t *)&v14, 0x16u);
LABEL_7:

LABEL_9:
    v10 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "getAutoAssets:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v8 || !-[NSObject count](v8, "count"))
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "name");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = 136315394;
      v15 = "+[UAFAssetSet autoAssets:usages:]";
      v16 = 2114;
      v17 = v13;
      _os_log_debug_impl(&dword_229282000, v11, OS_LOG_TYPE_DEBUG, "%s No Auto assets defined for %{public}@", (uint8_t *)&v14, 0x16u);

    }
    goto LABEL_7;
  }
  v9 = v9;
  v10 = v9;
LABEL_10:

  return v10;
}

+ (id)autoAssetSet:(id)a3 usages:(id)a4 uuid:(id)a5 autoAssets:(id)a6 experiment:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  UAFAutoAssetSet *v21;
  void *v22;
  UAFAutoAssetSet *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  int v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = a6;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    objc_msgSend(v12, "name");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v13;
    v30 = 2114;
    v31 = v20;
    _os_signpost_emit_with_name_impl(&dword_229282000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "AutoAsset Assets", "%{public}@:%{public}@", (uint8_t *)&v28, 0x16u);

  }
  if (a8)
    *a8 = 0;
  v21 = [UAFAutoAssetSet alloc];
  objc_msgSend(v12, "name");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[UAFAutoAssetSet initWithAssetSetName:autoAssets:uuid:experiment:error:](v21, "initWithAssetSetName:autoAssets:uuid:experiment:error:", v22, v15, v13, v14, a8);

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    objc_msgSend(v12, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138543618;
    v29 = v13;
    v30 = 2114;
    v31 = v26;
    _os_signpost_emit_with_name_impl(&dword_229282000, v25, OS_SIGNPOST_INTERVAL_END, v17, "AutoAsset Assets", "%{public}@:%{public}@", (uint8_t *)&v28, 0x16u);

  }
  return v23;
}

- (UAFAssetSet)initWithAssetSet:(id)a3 usages:(id)a4
{
  return -[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:](self, "initWithAssetSet:usages:configurationDirURLs:", a3, a4, 0);
}

- (UAFAssetSet)initWithAssetSet:(id)a3 usages:(id)a4 disableExperimentation:(BOOL)a5
{
  return -[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:](self, "initWithAssetSet:usages:configurationDirURLs:disableExperimentation:", a3, a4, 0, a5);
}

- (UAFAssetSet)initWithAssetSet:(id)a3 usages:(id)a4 configurationDirURLs:(id)a5
{
  return -[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:](self, "initWithAssetSet:usages:configurationDirURLs:disableExperimentation:", a3, a4, a5, 0);
}

- (UAFAssetSet)initWithAssetSet:(id)a3 usages:(id)a4 configurationDirURLs:(id)a5 disableExperimentation:(BOOL)a6
{
  _BOOL4 v6;
  id v11;
  id v12;
  id v13;
  void *v14;
  UAFAssetSet *v15;
  UAFAssetSet *v16;
  id v17;
  uint64_t v18;
  NSUUID *uuid;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  unint64_t v24;
  const char *v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  UAFConfigurationManager *v30;
  uint64_t v31;
  UAFAssetSetConfiguration *cfg;
  uint64_t v33;
  NSDictionary *minVersions;
  uint64_t v35;
  NSDictionary *assetNameToAutoAsset;
  NSObject *v37;
  NSObject *v38;
  NSObject *v39;
  void *v40;
  const char *v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  const char *v48;
  NSObject *v49;
  os_signpost_id_t v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  NSObject *v54;
  NSUUID *v55;
  NSString *v56;
  const char *v57;
  NSUUID *v58;
  NSString *v59;
  UAFAssetSetExperiment *v60;
  uint64_t v61;
  UAFAssetSetExperiment *experiment;
  NSDictionary *usages;
  NSUUID *v64;
  NSDictionary *v65;
  UAFAssetSetConfiguration *v66;
  UAFAssetSetExperiment *v67;
  uint64_t v68;
  id v69;
  UAFAutoAssetSet *autoAssetSet;
  uint64_t v71;
  NSString *experimentId;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  NSUUID *v76;
  uint64_t v77;
  NSDictionary *assetNameToTrial;
  NSObject *v79;
  NSObject *v80;
  const char *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  TRIClient *client;
  NSObject *v87;
  NSObject *v88;
  const char *v89;
  uint64_t v90;
  NSDictionary *assets;
  NSObject *v92;
  NSUUID *v93;
  NSString *name;
  NSDictionary *v95;
  NSObject *v96;
  NSObject *v97;
  const char *v98;
  UAFAssetSet *v99;
  NSObject *v100;
  NSObject *v101;
  NSObject *v102;
  const char *v103;
  NSObject *v104;
  NSObject *v105;
  const char *v106;
  NSObject *v107;
  NSObject *v108;
  id v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  NSObject *v114;
  void *v115;
  os_signpost_id_t spid;
  id v117;
  id v118;
  objc_super v119;
  uint8_t buf[4];
  const char *v121;
  __int16 v122;
  uint64_t v123;
  __int16 v124;
  uint64_t v125;
  __int16 v126;
  NSDictionary *v127;
  uint64_t v128;

  v6 = a6;
  v128 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = (void *)MEMORY[0x22E2C6BC8]();
  v119.receiver = self;
  v119.super_class = (Class)UAFAssetSet;
  v15 = -[UAFAssetSet init](&v119, sel_init);
  v16 = v15;
  if (v15)
  {
    v115 = v14;
    v117 = v11;
    v17 = v13;
    objc_storeStrong((id *)&v15->_name, a3);
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v18 = objc_claimAutoreleasedReturnValue();
    uuid = v16->_uuid;
    v16->_uuid = (NSUUID *)v18;

    UAFGetLogCategory((id *)&UAFLogContextClient);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_signpost_id_generate(v20);

    UAFGetLogCategory((id *)&UAFLogContextClient);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = v22;
    spid = v21;
    v24 = v21 - 1;
    if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v25 = (const char *)v16->_uuid;
      *(_DWORD *)buf = 138543362;
      v121 = v25;
      _os_signpost_emit_with_name_impl(&dword_229282000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "AssetSet init", "%{public}@", buf, 0xCu);
    }

    *(_WORD *)&v16->_rootsPresent = 0;
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      v28 = (const char *)v16->_uuid;
      *(_DWORD *)buf = 138543362;
      v121 = v28;
      _os_signpost_emit_with_name_impl(&dword_229282000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v21, "AssetSet Configuration", "%{public}@", buf, 0xCu);
    }

    +[UAFConfigurationManager defaultManager](UAFConfigurationManager, "defaultManager");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v30 = -[UAFConfigurationManager initWithURLs:]([UAFConfigurationManager alloc], "initWithURLs:", v17);

      v29 = v30;
    }
    v11 = v117;
    objc_msgSend(v29, "getAssetSet:", v117);
    v31 = objc_claimAutoreleasedReturnValue();
    cfg = v16->_cfg;
    v16->_cfg = (UAFAssetSetConfiguration *)v31;

    if (!v16->_cfg)
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v37 = objc_claimAutoreleasedReturnValue();
      v13 = v17;
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v121 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:]";
        v122 = 2114;
        v123 = (uint64_t)v117;
        _os_log_error_impl(&dword_229282000, v37, OS_LOG_TYPE_ERROR, "%s Could not init asset set %{public}@", buf, 0x16u);
      }

      UAFGetLogCategory((id *)&UAFLogContextClient);
      v38 = objc_claimAutoreleasedReturnValue();
      v39 = v38;
      v40 = v115;
      if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
      {
        v41 = (const char *)v16->_uuid;
        *(_DWORD *)buf = 138543362;
        v121 = v41;
        _os_signpost_emit_with_name_impl(&dword_229282000, v39, OS_SIGNPOST_INTERVAL_END, spid, "AssetSet Configuration", "%{public}@", buf, 0xCu);
      }

      UAFGetLogCategory((id *)&UAFLogContextClient);
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
      {
        v44 = (const char *)v16->_uuid;
        *(_DWORD *)buf = 138543362;
        v121 = v44;
        _os_signpost_emit_with_name_impl(&dword_229282000, v43, OS_SIGNPOST_INTERVAL_END, spid, "AssetSet init", "%{public}@", buf, 0xCu);
      }
      goto LABEL_76;
    }
    objc_msgSend(v29, "minVersions:", v117);
    v33 = objc_claimAutoreleasedReturnValue();
    minVersions = v16->_minVersions;
    v16->_minVersions = (NSDictionary *)v33;

    -[UAFAssetSetConfiguration getAutoAssets:](v16->_cfg, "getAutoAssets:", v12);
    v35 = objc_claimAutoreleasedReturnValue();
    assetNameToAutoAsset = v16->_assetNameToAutoAsset;
    v16->_assetNameToAutoAsset = (NSDictionary *)v35;

    if (v6)
    {
      v16->_experimentationEnabled = 0;
    }
    else
    {
      -[UAFAssetSetConfiguration experimentalAssets](v16->_cfg, "experimentalAssets");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v16->_experimentationEnabled = v45 != 0;

    }
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      v48 = (const char *)v16->_uuid;
      *(_DWORD *)buf = 138543362;
      v121 = v48;
      _os_signpost_emit_with_name_impl(&dword_229282000, v47, OS_SIGNPOST_INTERVAL_END, v21, "AssetSet Configuration", "%{public}@", buf, 0xCu);
    }

    objc_storeStrong((id *)&v16->_usages, a4);
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v49 = objc_claimAutoreleasedReturnValue();
    v50 = os_signpost_id_generate(v49);

    UAFGetLogCategory((id *)&UAFLogContextClient);
    v51 = objc_claimAutoreleasedReturnValue();
    v52 = v51;
    if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_229282000, v52, OS_SIGNPOST_INTERVAL_BEGIN, v50, "Lock AutoAssets", (const char *)&unk_2292ECD19, buf, 2u);
    }

    -[UAFAssetSetConfiguration experimentalAssets](v16->_cfg, "experimentalAssets");
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      if (!v6)
      {
        v60 = [UAFAssetSetExperiment alloc];
        -[UAFAssetSetConfiguration experimentalAssets](v16->_cfg, "experimentalAssets");
        v54 = objc_claimAutoreleasedReturnValue();
        v61 = -[UAFAssetSetExperiment initWithConfiguration:uuid:](v60, "initWithConfiguration:uuid:", v54, v16->_uuid);
        experiment = v16->_experiment;
        v16->_experiment = (UAFAssetSetExperiment *)v61;

LABEL_36:
        usages = v16->_usages;
        v64 = v16->_uuid;
        v65 = v16->_assetNameToAutoAsset;
        v66 = v16->_cfg;
        v67 = v16->_experiment;
        v118 = 0;
        +[UAFAssetSet autoAssetSet:usages:uuid:autoAssets:experiment:error:](UAFAssetSet, "autoAssetSet:usages:uuid:autoAssets:experiment:error:", v66, usages, v64, v65, v67, &v118);
        v68 = objc_claimAutoreleasedReturnValue();
        v69 = v118;
        v114 = v118;
        autoAssetSet = v16->_autoAssetSet;
        v16->_autoAssetSet = (UAFAutoAssetSet *)v68;

        objc_storeStrong((id *)&v16->_autoAssetSetError, v69);
        v16->_experimentationEnabled = v16->_experiment != 0;
        if (-[UAFAutoAssetSet experimentActivated](v16->_autoAssetSet, "experimentActivated"))
        {
          -[UAFAssetSetExperiment experimentId](v16->_experiment, "experimentId");
          v71 = objc_claimAutoreleasedReturnValue();
          experimentId = v16->_experimentId;
          v16->_experimentId = (NSString *)v71;
        }
        else
        {
          experimentId = v16->_experimentId;
          v16->_experimentId = (NSString *)&stru_24F1F9848;
        }

        UAFGetLogCategory((id *)&UAFLogContextClient);
        v73 = objc_claimAutoreleasedReturnValue();
        v74 = v73;
        if (v50 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_229282000, v74, OS_SIGNPOST_INTERVAL_END, v50, "Lock AutoAssets", (const char *)&unk_2292ECD19, buf, 2u);
        }

        if (v16->_autoAssetSet)
        {
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v75 = objc_claimAutoreleasedReturnValue();
          v13 = v17;
          v11 = v117;
          if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
          {
            v76 = v16->_uuid;
            *(_DWORD *)buf = 136315650;
            v121 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:]";
            v122 = 2114;
            v123 = (uint64_t)v76;
            v124 = 2114;
            v125 = (uint64_t)v117;
            _os_log_impl(&dword_229282000, v75, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Using AutoAsset configuration instead of Trial for asset set %{public}@", buf, 0x20u);
          }

          goto LABEL_56;
        }
        v13 = v17;
        v11 = v117;
        if (!-[UAFAssetSetConfiguration isTrialAvailable](v16->_cfg, "isTrialAvailable"))
        {
LABEL_56:
          -[UAFAssetSet createAssets](v16, "createAssets");
          v90 = objc_claimAutoreleasedReturnValue();
          assets = v16->_assets;
          v16->_assets = (NSDictionary *)v90;

          UAFGetLogCategory((id *)&UAFLogContextClient);
          v92 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
          {
            v93 = v16->_uuid;
            v95 = v16->_usages;
            name = v16->_name;
            *(_DWORD *)buf = 136315906;
            v121 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:]";
            v122 = 2114;
            v123 = (uint64_t)v93;
            v124 = 2114;
            v125 = (uint64_t)name;
            v126 = 2114;
            v127 = v95;
            _os_log_impl(&dword_229282000, v92, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Asset set initialized for %{public}@ with usages: %{public}@", buf, 0x2Au);
          }

          UAFGetLogCategory((id *)&UAFLogContextClient);
          v96 = objc_claimAutoreleasedReturnValue();
          v97 = v96;
          v14 = v115;
          if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v96))
          {
            v98 = (const char *)v16->_uuid;
            *(_DWORD *)buf = 138543362;
            v121 = v98;
            _os_signpost_emit_with_name_impl(&dword_229282000, v97, OS_SIGNPOST_INTERVAL_END, spid, "AssetSet init", "%{public}@", buf, 0xCu);
          }

          goto LABEL_62;
        }
        +[UAFAssetSet getEntitledTrialAssets:usages:](UAFAssetSet, "getEntitledTrialAssets:usages:", v16->_cfg, v12);
        v77 = objc_claimAutoreleasedReturnValue();
        assetNameToTrial = v16->_assetNameToTrial;
        v16->_assetNameToTrial = (NSDictionary *)v77;

        UAFGetLogCategory((id *)&UAFLogContextClient);
        v79 = objc_claimAutoreleasedReturnValue();
        v80 = v79;
        if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v79))
        {
          v81 = (const char *)v16->_uuid;
          *(_DWORD *)buf = 138543362;
          v121 = v81;
          _os_signpost_emit_with_name_impl(&dword_229282000, v80, OS_SIGNPOST_INTERVAL_BEGIN, spid, "TRIClient init", "%{public}@", buf, 0xCu);
        }

        v82 = (void *)MEMORY[0x24BEBA9A0];
        -[UAFAssetSetConfiguration trialProject](v16->_cfg, "trialProject");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v82, "projectIdFromName:", v83);

        if ((_DWORD)v84 && (TRIProject_ProjectId_IsValidValue() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x24BEBA908], "clientWithIdentifier:", v84);
          v85 = objc_claimAutoreleasedReturnValue();
          client = v16->_client;
          v16->_client = (TRIClient *)v85;

          UAFGetLogCategory((id *)&UAFLogContextClient);
          v87 = objc_claimAutoreleasedReturnValue();
          v88 = v87;
          v13 = v17;
          v11 = v117;
          if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v87))
          {
            v89 = (const char *)v16->_uuid;
            *(_DWORD *)buf = 138543362;
            v121 = v89;
            _os_signpost_emit_with_name_impl(&dword_229282000, v88, OS_SIGNPOST_INTERVAL_END, spid, "TRIClient init", "%{public}@", buf, 0xCu);
          }

          if (v16->_client)
            goto LABEL_56;
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v107 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
          {
            v113 = objc_msgSend(objc_retainAutorelease(v117), "UTF8String");
            *(_DWORD *)buf = 136315394;
            v121 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:]";
            v122 = 2082;
            v123 = v113;
            _os_log_error_impl(&dword_229282000, v107, OS_LOG_TYPE_ERROR, "%s Could not create trial client for asset set %{public}s", buf, 0x16u);
          }

          UAFGetLogCategory((id *)&UAFLogContextClient);
          v108 = objc_claimAutoreleasedReturnValue();
          v105 = v108;
          v43 = v114;
          v40 = v115;
          if (v24 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v108))
            goto LABEL_75;
        }
        else
        {
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v100 = objc_claimAutoreleasedReturnValue();
          v13 = v17;
          if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR))
          {
            -[UAFAssetSetConfiguration trialProject](v16->_cfg, "trialProject");
            v110 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            v111 = objc_msgSend(v110, "UTF8String");
            v112 = objc_msgSend(objc_retainAutorelease(v117), "UTF8String");
            *(_DWORD *)buf = 136315650;
            v121 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:]";
            v122 = 2082;
            v123 = v111;
            v13 = v17;
            v124 = 2082;
            v125 = v112;
            _os_log_error_impl(&dword_229282000, v100, OS_LOG_TYPE_ERROR, "%s Could not find TRIProject for %{public}s for asset set %{public}s", buf, 0x20u);

          }
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v101 = objc_claimAutoreleasedReturnValue();
          v102 = v101;
          v43 = v114;
          if (v24 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v101))
          {
            v103 = (const char *)v16->_uuid;
            *(_DWORD *)buf = 138543362;
            v121 = v103;
            _os_signpost_emit_with_name_impl(&dword_229282000, v102, OS_SIGNPOST_INTERVAL_END, spid, "TRIClient init", "%{public}@", buf, 0xCu);
          }

          UAFGetLogCategory((id *)&UAFLogContextClient);
          v104 = objc_claimAutoreleasedReturnValue();
          v105 = v104;
          v11 = v117;
          v40 = v115;
          if (v24 > 0xFFFFFFFFFFFFFFFDLL || !os_signpost_enabled(v104))
            goto LABEL_75;
        }
        v106 = (const char *)v16->_uuid;
        *(_DWORD *)buf = 138543362;
        v121 = v106;
        _os_signpost_emit_with_name_impl(&dword_229282000, v105, OS_SIGNPOST_INTERVAL_END, spid, "AssetSet init", "%{public}@", buf, 0xCu);
LABEL_75:

LABEL_76:
        objc_autoreleasePoolPop(v40);
        v99 = 0;
        goto LABEL_77;
      }
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v54 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      v55 = v16->_uuid;
      v56 = v16->_name;
      *(_DWORD *)buf = 136315650;
      v121 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:]";
      v122 = 2114;
      v123 = (uint64_t)v55;
      v124 = 2114;
      v125 = (uint64_t)v56;
      v57 = "%s %{public}@: Experimentation not enabled for asset set %{public}@";
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v54 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        goto LABEL_36;
      v58 = v16->_uuid;
      v59 = v16->_name;
      *(_DWORD *)buf = 136315650;
      v121 = "-[UAFAssetSet initWithAssetSet:usages:configurationDirURLs:disableExperimentation:]";
      v122 = 2114;
      v123 = (uint64_t)v58;
      v124 = 2114;
      v125 = (uint64_t)v59;
      v57 = "%s %{public}@: No experimental assets for asset set %{public}@";
    }
    _os_log_impl(&dword_229282000, v54, OS_LOG_TYPE_DEFAULT, v57, buf, 0x20u);
    goto LABEL_36;
  }
LABEL_62:
  objc_autoreleasePoolPop(v14);
  v99 = v16;
LABEL_77:

  return v99;
}

- (void)dealloc
{
  NSObject *v3;
  NSUUID *uuid;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  NSUUID *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 136315394;
    v7 = "-[UAFAssetSet dealloc]";
    v8 = 2114;
    v9 = uuid;
    _os_log_impl(&dword_229282000, v3, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Asset set dealloc'd", buf, 0x16u);
  }

  v5.receiver = self;
  v5.super_class = (Class)UAFAssetSet;
  -[UAFAssetSet dealloc](&v5, sel_dealloc);
}

- (id)createAssetFromTrialInfo:(id)a3 assetName:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSUUID *uuid;
  const char *v12;
  uint64_t v13;
  NSUUID *v14;
  uint64_t v15;
  NSUUID *v16;
  NSUUID *v17;
  int v19;
  const char *v20;
  __int16 v21;
  NSUUID *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[UAFAssetSet _createAssetFromTrialInfo:assetName:fallback:validPathOnly:](self, "_createAssetFromTrialInfo:assetName:fallback:validPathOnly:", v6, v7, 0, 1);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uuid = self->_uuid;
      v19 = 136315650;
      v20 = "-[UAFAssetSet createAssetFromTrialInfo:assetName:]";
      v21 = 2114;
      v22 = uuid;
      v23 = 2112;
      v24 = v7;
      v12 = "%s %{public}@: _createAssetFromTrialInfo using primary for assetName %@ with valid path";
LABEL_13:
      _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v19, 0x20u);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
  -[UAFAssetSet _createAssetFromTrialInfo:assetName:fallback:validPathOnly:](self, "_createAssetFromTrialInfo:assetName:fallback:validPathOnly:", v6, v7, 1, 1);
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v9 = (void *)v13;
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = self->_uuid;
      v19 = 136315650;
      v20 = "-[UAFAssetSet createAssetFromTrialInfo:assetName:]";
      v21 = 2114;
      v22 = v14;
      v23 = 2112;
      v24 = v7;
      v12 = "%s %{public}@: _createAssetFromTrialInfo using fallback for assetName %@ with valid path";
      goto LABEL_13;
    }
LABEL_14:

    goto LABEL_15;
  }
  -[UAFAssetSet _createAssetFromTrialInfo:assetName:fallback:validPathOnly:](self, "_createAssetFromTrialInfo:assetName:fallback:validPathOnly:", v6, v7, 0, 0);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v9 = (void *)v15;
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = self->_uuid;
      v19 = 136315650;
      v20 = "-[UAFAssetSet createAssetFromTrialInfo:assetName:]";
      v21 = 2114;
      v22 = v16;
      v23 = 2112;
      v24 = v7;
      v12 = "%s %{public}@: _createAssetFromTrialInfo using primary for assetName %@ without valid path";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  -[UAFAssetSet _createAssetFromTrialInfo:assetName:fallback:validPathOnly:](self, "_createAssetFromTrialInfo:assetName:fallback:validPathOnly:", v6, v7, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v17 = self->_uuid;
      v19 = 136315650;
      v20 = "-[UAFAssetSet createAssetFromTrialInfo:assetName:]";
      v21 = 2114;
      v22 = v17;
      v23 = 2112;
      v24 = v7;
      v12 = "%s %{public}@: _createAssetFromTrialInfo using fallback for assetName %@ without valid path";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
LABEL_15:

  return v9;
}

- (id)_createAssetFromTrialInfo:(id)a3 assetName:(id)a4 fallback:(BOOL)a5 validPathOnly:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  id v11;
  __CFString **v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  UAFAsset *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  NSUUID *v39;
  void *v40;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  NSUUID *uuid;
  NSUUID *v58;
  UAFAsset *v59;
  void *v60;
  NSUUID *v62;
  _BOOL4 v63;
  id v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  NSUUID *v68;
  __int16 v69;
  void *v70;
  __int16 v71;
  int v72;
  uint64_t v73;

  v6 = a6;
  v7 = a5;
  v73 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = kUAFTrialFactorFallback;
  if (!v7)
    v12 = kUAFTrialFactor;
  objc_msgSend(v10, "objectForKeyedSubscript:", *v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TrialNamespace"));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13)
    v16 = v14 == 0;
  else
    v16 = 1;
  if (!v16)
  {
    -[TRIClient levelForFactor:withNamespaceName:](self->_client, "levelForFactor:withNamespaceName:", v13, v14);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      if (objc_msgSend(v18, "levelOneOfCase") == 101
        || objc_msgSend(v19, "levelOneOfCase") == 100)
      {
        v63 = v6;
        v20 = (void *)MEMORY[0x24BDBCED8];
        objc_msgSend(v19, "metadata");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "dictionaryWithDictionary:", v21);
        v22 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("TrialMAAssetType"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v23, CFSTR("com.apple.UnifiedAssetFramework.AssetType"));

        -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", CFSTR("Trial"), CFSTR("com.apple.UnifiedAssetFramework.Source"));
        v64 = v11;
        if (objc_msgSend(v19, "levelOneOfCase") != 101)
        {
          objc_msgSend(v19, "fileValue");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v40, "hasAsset"))
          {
            objc_msgSend(v19, "fileValue");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "asset");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "hasAssetId");

            if (!v44)
              goto LABEL_27;
            objc_msgSend(v19, "fileValue");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "asset");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "assetId");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v47, CFSTR("com.apple.UnifiedAssetFramework.AssetId"));

            v48 = (void *)MEMORY[0x24BDD17C8];
            objc_msgSend(v19, "fileValue");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "asset");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v49, "size"));
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v50, CFSTR("com.apple.UnifiedAssetFramework.ReportedDownloadSize"));

          }
LABEL_27:
          objc_msgSend(v19, "fileValue");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v34, "hasPath"))
          {
            objc_msgSend(v19, "fileValue");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "path");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v53 = objc_msgSend(v52, "length");

            if (v53)
            {
              objc_msgSend(v19, "fileValue");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:
              v54 = v38;
              objc_msgSend(v38, "path");
              v55 = objc_claimAutoreleasedReturnValue();

              if (v55)
                goto LABEL_40;
              goto LABEL_33;
            }
            goto LABEL_33;
          }
          goto LABEL_32;
        }
        objc_msgSend(v19, "directoryValue");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "hasAsset"))
        {
          objc_msgSend(v19, "directoryValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "asset");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(v26, "hasAssetId");

          if (!v27)
            goto LABEL_18;
          objc_msgSend(v19, "directoryValue");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "asset");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "assetId");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v30, CFSTR("com.apple.UnifiedAssetFramework.AssetId"));

          v31 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v19, "directoryValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "asset");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "stringWithFormat:", CFSTR("%llu"), objc_msgSend(v32, "size"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v22, "setObject:forKeyedSubscript:", v33, CFSTR("com.apple.UnifiedAssetFramework.ReportedDownloadSize"));

        }
LABEL_18:
        objc_msgSend(v19, "directoryValue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v34, "hasPath"))
        {
          objc_msgSend(v19, "directoryValue");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "path");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "length");

          if (v37)
          {
            objc_msgSend(v19, "directoryValue");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_30;
          }
LABEL_33:
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v56 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
          {
            uuid = self->_uuid;
            *(_DWORD *)buf = 136315650;
            v66 = "-[UAFAssetSet _createAssetFromTrialInfo:assetName:fallback:validPathOnly:]";
            v67 = 2114;
            v68 = uuid;
            v69 = 2112;
            v70 = v13;
            _os_log_impl(&dword_229282000, v56, OS_LOG_TYPE_DEFAULT, "%s %{public}@: nil path for factor %@", buf, 0x20u);
          }

          if (v63)
          {
            UAFGetLogCategory((id *)&UAFLogContextClient);
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
            {
              v58 = self->_uuid;
              *(_DWORD *)buf = 136315650;
              v66 = "-[UAFAssetSet _createAssetFromTrialInfo:assetName:fallback:validPathOnly:]";
              v67 = 2114;
              v68 = v58;
              v69 = 2112;
              v70 = v13;
              _os_log_impl(&dword_229282000, v55, OS_LOG_TYPE_DEFAULT, "%s %{public}@: validPathOnly nil path for factor %@", buf, 0x20u);
            }
            v17 = 0;
            v11 = v64;
            goto LABEL_41;
          }
          v55 = &stru_24F1F9848;
LABEL_40:
          v59 = [UAFAsset alloc];
          objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v55);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v64;
          v17 = -[UAFAsset initWithName:location:metadata:](v59, "initWithName:location:metadata:", v64, v60, v22);

LABEL_41:
LABEL_45:

          goto LABEL_46;
        }
LABEL_32:

        goto LABEL_33;
      }
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v62 = self->_uuid;
        *(_DWORD *)buf = 136315906;
        v66 = "-[UAFAssetSet _createAssetFromTrialInfo:assetName:fallback:validPathOnly:]";
        v67 = 2114;
        v68 = v62;
        v69 = 2112;
        v70 = v13;
        v71 = 1024;
        v72 = objc_msgSend(v19, "levelOneOfCase");
        _os_log_error_impl(&dword_229282000, v22, OS_LOG_TYPE_ERROR, "%s %{public}@: TRILevel is not a directory or file type: %@ %d", buf, 0x26u);
      }
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v39 = self->_uuid;
        *(_DWORD *)buf = 136315650;
        v66 = "-[UAFAssetSet _createAssetFromTrialInfo:assetName:fallback:validPathOnly:]";
        v67 = 2114;
        v68 = v39;
        v69 = 2112;
        v70 = v13;
        _os_log_impl(&dword_229282000, v22, OS_LOG_TYPE_DEFAULT, "%s %{public}@: No level for factor %@", buf, 0x20u);
      }
    }
    v17 = 0;
    goto LABEL_45;
  }
  v17 = 0;
LABEL_46:

  return v17;
}

- (id)createAssetFromMAAsset:(id)a3 assetName:(id)a4 experimentationEnabled:(BOOL)a5 experimentId:(id)a6
{
  _BOOL4 v7;
  id v9;
  void *v10;
  __CFString *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  __CFString **v25;
  const __CFString *v26;
  const __CFString *v27;
  UAFAsset *v28;
  void *v29;
  UAFAsset *v30;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *, void *);
  void *v35;
  id v36;
  id v37;

  v7 = a5;
  v9 = a3;
  v10 = (void *)MEMORY[0x24BDBCED8];
  v11 = (__CFString *)a6;
  v12 = a4;
  objc_msgSend(v10, "dictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("com.apple.UnifiedAssetFramework.AssetId"));

  objc_msgSend(v9, "assetType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("com.apple.UnifiedAssetFramework.AssetType"));

  objc_msgSend(v13, "setObject:forKeyedSubscript:", CFSTR("0"), CFSTR("com.apple.UnifiedAssetFramework.ReportedDownloadSize"));
  objc_msgSend(v9, "attributes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = MEMORY[0x24BDAC760];
  v33 = 3221225472;
  v34 = __84__UAFAssetSet_createAssetFromMAAsset_assetName_experimentationEnabled_experimentId___block_invoke;
  v35 = &unk_24F1F86E0;
  v17 = v13;
  v36 = v17;
  v18 = v9;
  v37 = v18;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", &v32);

  objc_msgSend(v18, "attributes", v32, v33, v34, v35);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("isRoot"));
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {

LABEL_5:
    if (objc_msgSend(v18, "wasPreinstalled"))
    {
      objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("YES"), CFSTR("preinstalled"));
      v25 = kUAFAssetMetadataSourceFactoryValue;
    }
    else
    {
      v25 = kUAFAssetMetadataSourceUnknownValue;
    }
    goto LABEL_8;
  }
  v21 = (void *)v20;
  objc_msgSend(v18, "attributes");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("isRoot"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("1"));

  if ((v24 & 1) == 0)
    goto LABEL_5;
  v25 = kUAFAssetMetadataSourceRootValue;
LABEL_8:
  objc_msgSend(v17, "setObject:forKeyedSubscript:", *v25, CFSTR("com.apple.UnifiedAssetFramework.Source"));
  if (v7)
    v26 = CFSTR("YES");
  else
    v26 = CFSTR("NO");
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v26, CFSTR("ExperimentationEnabled"));
  if (v11)
    v27 = v11;
  else
    v27 = &stru_24F1F9848;
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v27, CFSTR("ExperimentId"));

  v28 = [UAFAsset alloc];
  objc_msgSend(v18, "getLocalFileUrl");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = -[UAFAsset initWithName:location:metadata:](v28, "initWithName:location:metadata:", v12, v29, v17);

  return v30;
}

void __84__UAFAssetSet_createAssetFromMAAsset_assetName_experimentationEnabled_experimentId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v9);

  }
}

- (id)assetNamed:(id)a3 withUsage:(id)a4
{
  return -[UAFAssetSet assetNamed:withUsage:disableExperimentation:](self, "assetNamed:withUsage:disableExperimentation:", a3, a4, 0);
}

- (id)assetNamed:(id)a3 withUsage:(id)a4 disableExperimentation:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  _BOOL8 experimentationEnabled;
  NSString *experimentId;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSUUID *v19;
  id v20;
  UAFAssetSetExperiment *v21;
  UAFAssetSetExperiment *v22;
  UAFAutoAssetSet *cachingAutoAssetSet;
  id v24;
  NSUUID *uuid;
  UAFAssetSetConfiguration *cfg;
  UAFAssetSetExperiment *experiment;
  UAFAutoAssetSet *v28;
  UAFAutoAssetSet *v29;
  void *v30;
  NSObject *v31;
  void *v33;
  NSUUID *v34;
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  NSUUID *v39;
  __int16 v40;
  id v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v5 = a5;
  v44 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x22E2C6BC8]();
  if (v5)
  {
    experimentationEnabled = 0;
    experimentId = 0;
  }
  else
  {
    experimentationEnabled = self->_experimentationEnabled;
    experimentId = self->_experimentId;
  }
  v13 = experimentId;
  if (!+[UAFPreinstalledAssetsCache isEnabled](UAFPreinstalledAssetsCache, "isEnabled"))
  {
    v15 = 0;
    goto LABEL_12;
  }
  -[UAFAssetSetConfiguration getAutoAssets:](self->_cfg, "getAutoAssets:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15
    || (-[UAFAssetSet createAssetFromPreinstalledWithAutoAssetInfo:assetName:experimentationEnabled:experimentId:](self, "createAssetFromPreinstalledWithAutoAssetInfo:assetName:experimentationEnabled:experimentId:", v15, v8, experimentationEnabled, v13), (v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_12:
    +[UAFAssetSet autoAssets:usages:](UAFAssetSet, "autoAssets:usages:", self->_cfg, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v21 = self->_experiment;
      v22 = v21;
      if (v5)
      {

        v22 = 0;
      }
      cachingAutoAssetSet = self->_cachingAutoAssetSet;
      if (cachingAutoAssetSet)
      {
        v24 = 0;
      }
      else
      {
        uuid = self->_uuid;
        cfg = self->_cfg;
        experiment = self->_experiment;
        v35 = 0;
        +[UAFAssetSet autoAssetSet:usages:uuid:autoAssets:experiment:error:](UAFAssetSet, "autoAssetSet:usages:uuid:autoAssets:experiment:error:", cfg, v9, uuid, 0, experiment, &v35);
        v28 = (UAFAutoAssetSet *)objc_claimAutoreleasedReturnValue();
        v24 = v35;
        v29 = self->_cachingAutoAssetSet;
        self->_cachingAutoAssetSet = v28;

        cachingAutoAssetSet = self->_cachingAutoAssetSet;
        if (!cachingAutoAssetSet)
        {
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v31 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v34 = self->_uuid;
            -[UAFAssetSetConfiguration name](self->_cfg, "name");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315906;
            v37 = "-[UAFAssetSet assetNamed:withUsage:disableExperimentation:]";
            v38 = 2114;
            v39 = v34;
            v40 = 2114;
            v41 = v33;
            v42 = 2114;
            v43 = v24;
            _os_log_error_impl(&dword_229282000, v31, OS_LOG_TYPE_ERROR, "%s %{public}@: Auto assets for Asset %{public}@ cannot be locked:%{public}@", buf, 0x2Au);

          }
          v20 = 0;
          goto LABEL_25;
        }
      }
      -[UAFAutoAssetSet assetWithName:autoAssets:experiment:](cachingAutoAssetSet, "assetWithName:autoAssets:experiment:", v8, v14, v22);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30)
      {
        v20 = v30;
LABEL_25:

        goto LABEL_26;
      }

    }
    -[UAFAssetSetConfiguration isTrialAvailable](self->_cfg, "isTrialAvailable");
    v20 = 0;
    goto LABEL_26;
  }
  v17 = (void *)v16;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = self->_uuid;
    *(_DWORD *)buf = 136315650;
    v37 = "-[UAFAssetSet assetNamed:withUsage:disableExperimentation:]";
    v38 = 2114;
    v39 = v19;
    v40 = 2114;
    v41 = v8;
    _os_log_impl(&dword_229282000, v18, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Returning %{public}@ from MA Root", buf, 0x20u);
  }

  v20 = v17;
LABEL_26:

  objc_autoreleasePoolPop(v10);
  return v20;
}

- (id)assetSetIdForSELF:(BOOL)a3
{
  __CFString *v4;
  uint64_t v5;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  UAFAutoAssetSet *autoAssetSet;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (self->_factoryAssetsPresent)
  {
    v4 = CFSTR("Factory");
    goto LABEL_3;
  }
  v7 = a3;
  -[UAFAssetSetConfiguration autoAssetType](self->_cfg, "autoAssetType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
    {
      +[UAFAutoAssetSet catalogAssetSetID:](UAFAutoAssetSet, "catalogAssetSetID:", self->_name);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    autoAssetSet = self->_autoAssetSet;
    if (autoAssetSet)
    {
      -[UAFAutoAssetSet catalogAssetSetID](autoAssetSet, "catalogAssetSetID");
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      v4 = (__CFString *)v9;
      if (v9)
        goto LABEL_3;
    }
  }
  if (self->_client)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[UAFAssetSetConfiguration assets](self->_cfg, "assets", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (__CFString *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v4)
    {
      v12 = *(_QWORD *)v19;
LABEL_15:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v11);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        objc_msgSend(v14, "trialNamespace");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          break;
        if (v4 == (__CFString *)++v13)
        {
          v4 = (__CFString *)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
          if (v4)
            goto LABEL_15;
          goto LABEL_24;
        }
      }
      objc_msgSend(v14, "trialNamespace");
      v16 = objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_25;
      -[TRIClient rolloutIdentifiersWithNamespaceName:](self->_client, "rolloutIdentifiersWithNamespaceName:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "rolloutId");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

      v11 = (void *)v16;
    }
LABEL_24:

  }
  else
  {
LABEL_25:
    v4 = 0;
  }
LABEL_3:
  if (self->_rootsPresent)
  {
    -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("+roots"));
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v5;
  }
  return v4;
}

- (NSString)assetSetId
{
  return (NSString *)-[UAFAssetSet assetSetIdForSELF:](self, "assetSetIdForSELF:", 0);
}

- (id)namespacesOfAssetNames:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSUUID *uuid;
  NSString *name;
  id v18;
  void *v19;
  void *v20;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  const __CFString *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  NSUUID *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  NSString *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        -[NSDictionary objectForKeyedSubscript:](self->_assetNameToTrial, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13)
        {
          objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("TrialNamespace"));
          v15 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v15);
        }
        else
        {
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            uuid = self->_uuid;
            name = self->_name;
            *(_DWORD *)buf = 136315906;
            v30 = "-[UAFAssetSet namespacesOfAssetNames:error:]";
            v31 = 2114;
            v32 = uuid;
            v33 = 2112;
            v34 = v12;
            v35 = 2112;
            v36 = name;
            _os_log_impl(&dword_229282000, v15, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Asset name %@ does not exist in asset set %@", buf, 0x2Au);
          }
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    v18 = v6;
  }
  else
  {
    if (a4)
    {
      v19 = (void *)MEMORY[0x24BDD1540];
      v27 = *MEMORY[0x24BDD0FD8];
      v28 = CFSTR("No namespaces for assets");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), -1, v20);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    v18 = 0;
  }

  return v18;
}

- (BOOL)markAssetsProvisional:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSUUID *uuid;
  NSUUID *v19;
  NSObject *v20;
  NSUUID *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  NSUUID *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!self->_autoAssetSet)
  {
    if (self->_client)
    {
      -[UAFAssetSet namespacesOfAssetNames:error:](self, "namespacesOfAssetNames:error:", v6, a4);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = v8;
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
        if (v10)
        {
          v11 = v10;
          v23 = v6;
          v12 = *(_QWORD *)v25;
          v7 = 1;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v25 != v12)
                objc_enumerationMutation(v9);
              v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
              if ((-[TRIClient setFactorsProvisionalForNamespace:error:](self->_client, "setFactorsProvisionalForNamespace:error:", v14, a4) & 1) == 0)
              {
                if (a4)
                {
                  v15 = objc_msgSend(*a4, "code");
                  objc_msgSend(*a4, "localizedFailureReason");
                  v16 = (void *)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  v16 = 0;
                  v15 = 0;
                }
                UAFGetLogCategory((id *)&UAFLogContextClient);
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  uuid = self->_uuid;
                  *(_DWORD *)buf = 136316162;
                  v29 = "-[UAFAssetSet markAssetsProvisional:error:]";
                  v30 = 2114;
                  v31 = uuid;
                  v32 = 2112;
                  v33 = v14;
                  v34 = 2048;
                  v35 = v15;
                  v36 = 2112;
                  v37 = v16;
                  _os_log_impl(&dword_229282000, v17, OS_LOG_TYPE_DEFAULT, "%s %{public}@: setAssetsProvisional: setFactorsProvisionalForNamespace failed for namespace %@: %ld %@", buf, 0x34u);
                }

                v7 = 0;
              }
            }
            v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
          }
          while (v11);
          v6 = v23;
        }
        else
        {
          v7 = 1;
        }
        goto LABEL_26;
      }
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        v21 = self->_uuid;
        *(_DWORD *)buf = 136315394;
        v29 = "-[UAFAssetSet markAssetsProvisional:error:]";
        v30 = 2114;
        v31 = v21;
        _os_log_impl(&dword_229282000, v20, OS_LOG_TYPE_DEFAULT, "%s %{public}@: setAssetsProvisional: No namespaces for assets", buf, 0x16u);
      }

      v9 = 0;
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_uuid;
        *(_DWORD *)buf = 136315394;
        v29 = "-[UAFAssetSet markAssetsProvisional:error:]";
        v30 = 2114;
        v31 = v19;
        _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@: setAssetsProvisional: Not supported for MAAutoAssetSet assets", buf, 0x16u);
      }
    }
    v7 = 0;
LABEL_26:

    goto LABEL_27;
  }
  v7 = 1;
LABEL_27:

  return v7 & 1;
}

- (BOOL)markAssetsPromoted:(id)a3 error:(id *)a4
{
  id v6;
  char v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSUUID *v18;
  NSUUID *v19;
  NSObject *v20;
  NSUUID *uuid;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  NSUUID *v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (!self->_autoAssetSet)
  {
    if (self->_client)
    {
      -[UAFAssetSet namespacesOfAssetNames:error:](self, "namespacesOfAssetNames:error:", v6, a4);
      v8 = objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        UAFGetLogCategory((id *)&UAFLogContextClient);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          uuid = self->_uuid;
          *(_DWORD *)buf = 136315394;
          v29 = "-[UAFAssetSet markAssetsPromoted:error:]";
          v30 = 2114;
          v31 = uuid;
          _os_log_impl(&dword_229282000, v20, OS_LOG_TYPE_DEFAULT, "%s %{public}@: setAssetsPromoted: No namespaces for assets", buf, 0x16u);
        }

        v9 = 0;
        v7 = 0;
        goto LABEL_26;
      }
      v9 = v8;
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
      if (v10)
      {
        v11 = v10;
        v23 = v6;
        v12 = *(_QWORD *)v25;
        v7 = 1;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
            if ((-[TRIClient promoteFactorsForNamespace:error:](self->_client, "promoteFactorsForNamespace:error:", v14, a4) & 1) == 0)
            {
              if (a4)
              {
                v15 = objc_msgSend(*a4, "code");
                objc_msgSend(*a4, "localizedFailureReason");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v16 = 0;
                v15 = 0;
              }
              UAFGetLogCategory((id *)&UAFLogContextClient);
              v17 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                v18 = self->_uuid;
                *(_DWORD *)buf = 136316162;
                v29 = "-[UAFAssetSet markAssetsPromoted:error:]";
                v30 = 2114;
                v31 = v18;
                v32 = 2112;
                v33 = v14;
                v34 = 2048;
                v35 = v15;
                v36 = 2112;
                v37 = v16;
                _os_log_impl(&dword_229282000, v17, OS_LOG_TYPE_DEFAULT, "%s %{public}@: setAssetsPromoted: promoteFactorsForNamespace failed for namespace %@: %ld %@", buf, 0x34u);
              }

              v7 = 0;
            }
          }
          v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
        }
        while (v11);
        v6 = v23;
        goto LABEL_26;
      }
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v19 = self->_uuid;
        *(_DWORD *)buf = 136315394;
        v29 = "-[UAFAssetSet markAssetsPromoted:error:]";
        v30 = 2114;
        v31 = v19;
        _os_log_impl(&dword_229282000, v9, OS_LOG_TYPE_DEFAULT, "%s %{public}@: setAssetsPromoted: Not supported for MAAutoAssetSet assets", buf, 0x16u);
      }
    }
    v7 = 1;
LABEL_26:

    goto LABEL_27;
  }
  v7 = 1;
LABEL_27:

  return v7 & 1;
}

- (id)applyOSCompatibility:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UAFAssetSet *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSUUID *uuid;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSUUID *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSUUID *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  UAFAssetSet *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  uint8_t v56[128];
  uint8_t buf[4];
  const char *v58;
  __int16 v59;
  NSUUID *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  id v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[UAFAssetSetConfiguration metadataAsset](self->_cfg, "metadataAsset");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[UAFAssetSetConfiguration metadataAsset](self->_cfg, "metadataAsset");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      -[UAFAssetSetConfiguration metadataAsset](self->_cfg, "metadataAsset");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", v10);
      v50 = self;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "location");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = self;
      if (v12)
      {
        -[UAFAssetSetConfiguration metadataAsset](self->_cfg, "metadataAsset");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "location");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = 0;
        +[UAFAssetSetMetadata fromAssetDir:error:](UAFAssetSetMetadata, "fromAssetDir:error:", v16, &v55);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v55;

        if (v17)
        {
          if (!objc_msgSend(v17, "OSSupported"))
          {
            v48 = v17;
            UAFGetLogCategory((id *)&UAFLogContextClient);
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              uuid = self->_uuid;
              -[UAFAssetSetConfiguration name](self->_cfg, "name");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "minOSVersion");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v48, "maxOSVersion");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              +[UAFAssetSetMetadata OSVersion](UAFAssetSetMetadata, "OSVersion");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316418;
              v58 = "-[UAFAssetSet applyOSCompatibility:]";
              v59 = 2114;
              v60 = uuid;
              v61 = 2114;
              v62 = v20;
              v63 = 2114;
              v64 = v21;
              v65 = 2114;
              v66 = v22;
              v67 = 2114;
              v68 = v23;
              _os_log_impl(&dword_229282000, v18, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Asset set %{public}@ with minOSVersion %{public}@ and maxOSVersion %{public}@ incompatible with current OS Version %{public}@", buf, 0x3Eu);

              v13 = self;
            }

            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            -[UAFAssetSetConfiguration assets](v13->_cfg, "assets");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
            if (v25)
            {
              v26 = v25;
              v27 = 0;
              v28 = *(_QWORD *)v52;
              do
              {
                for (i = 0; i != v26; ++i)
                {
                  if (*(_QWORD *)v52 != v28)
                    objc_enumerationMutation(v24);
                  v30 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
                  if (objc_msgSend(v30, "ignoreOSCompatibility", v48))
                  {
                    objc_msgSend(v30, "name");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "objectForKeyedSubscript:", v31);
                    v32 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v32)
                    {
                      if (!v27)
                        v27 = (id)objc_opt_new();
                      objc_msgSend(v30, "name");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v4, "objectForKeyedSubscript:", v33);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "name");
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v27, "setObject:forKeyedSubscript:", v34, v35);

                      UAFGetLogCategory((id *)&UAFLogContextClient);
                      v36 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                      {
                        v37 = v50->_uuid;
                        objc_msgSend(v30, "name");
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        -[UAFAssetSetConfiguration name](v50->_cfg, "name");
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 136315906;
                        v58 = "-[UAFAssetSet applyOSCompatibility:]";
                        v59 = 2114;
                        v60 = v37;
                        v61 = 2114;
                        v62 = v38;
                        v63 = 2114;
                        v64 = v39;
                        _os_log_impl(&dword_229282000, v36, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Asset %{public}@ in asset set %{public}@ included as it ignores OS compatibility", buf, 0x2Au);

                      }
                    }
                  }
                }
                v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v56, 16);
              }
              while (v26);
            }
            else
            {
              v27 = 0;
            }

            v17 = v48;
            goto LABEL_31;
          }
        }
        else
        {
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v40 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            v42 = self->_uuid;
            -[UAFAssetSetConfiguration metadataAsset](self->_cfg, "metadataAsset");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[UAFAssetSetConfiguration name](self->_cfg, "name");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            -[UAFAssetSetConfiguration metadataAsset](self->_cfg, "metadataAsset");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "objectForKeyedSubscript:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "location");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316418;
            v58 = "-[UAFAssetSet applyOSCompatibility:]";
            v59 = 2114;
            v60 = v42;
            v17 = 0;
            v61 = 2114;
            v62 = v43;
            v63 = 2114;
            v64 = v44;
            v65 = 2112;
            v66 = v47;
            v67 = 2114;
            v68 = v49;
            _os_log_error_impl(&dword_229282000, v40, OS_LOG_TYPE_ERROR, "%s %{public}@: Failed to load asset set metadata from asset %{public}@ in asset set %{public}@ at location %@: %{public}@", buf, 0x3Eu);

          }
        }
        v27 = v4;
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {

    }
  }
  v27 = v4;
LABEL_32:

  return v27;
}

- (id)applyMinVersions:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSUUID *uuid;
  id v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  UAFAssetSet *v18;
  void *v19;
  int64_t v20;
  NSObject *v21;
  NSUUID *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSUUID *v28;
  NSObject *v29;
  NSObject *v30;
  NSUUID *v31;
  os_signpost_id_t spid;
  unint64_t v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  NSUUID *v46;
  __int16 v47;
  uint64_t v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 138543362;
    v44 = (const char *)uuid;
    _os_signpost_emit_with_name_impl(&dword_229282000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Min Versions", "%{public}@", buf, 0xCu);
  }

  if (self->_minVersions)
  {
    spid = v6;
    v34 = v6 - 1;
    v36 = (id)objc_opt_new();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v35 = v4;
    v10 = v4;
    v38 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
    if (v38)
    {
      v37 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v38; ++i)
        {
          if (*(_QWORD *)v40 != v37)
            objc_enumerationMutation(v10);
          v12 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](self->_minVersions, "objectForKeyedSubscript:", v12);
          v14 = objc_claimAutoreleasedReturnValue();
          if (!v14)
            goto LABEL_12;
          v15 = (void *)v14;
          objc_msgSend(v13, "metadata");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("version"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary objectForKeyedSubscript:](self->_minVersions, "objectForKeyedSubscript:", v12);
          v18 = self;
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = +[UAFPlatform compareVersion:with:](UAFPlatform, "compareVersion:with:", v17, v19);

          self = v18;
          if (v20 == -1)
          {
            UAFGetLogCategory((id *)&UAFLogContextClient);
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
            {
              v22 = v18->_uuid;
              objc_msgSend(v13, "metadata");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("version"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary objectForKeyedSubscript:](v18->_minVersions, "objectForKeyedSubscript:", v12);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316162;
              v44 = "-[UAFAssetSet applyMinVersions:]";
              v45 = 2114;
              v46 = v22;
              v47 = 2112;
              v48 = v12;
              v49 = 2112;
              v50 = v24;
              v51 = 2112;
              v52 = v25;
              _os_log_impl(&dword_229282000, v21, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Not included %@ as it's version %@ is less than the required minimum %@", buf, 0x34u);

              self = v18;
            }

          }
          else
          {
LABEL_12:
            objc_msgSend(v36, "setObject:forKeyedSubscript:", v13, v12);
          }

        }
        v38 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
      }
      while (v38);
    }

    UAFGetLogCategory((id *)&UAFLogContextClient);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v26;
    if (v34 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      v28 = self->_uuid;
      *(_DWORD *)buf = 138543362;
      v44 = (const char *)v28;
      _os_signpost_emit_with_name_impl(&dword_229282000, v27, OS_SIGNPOST_INTERVAL_END, spid, "Min Versions", "%{public}@", buf, 0xCu);
    }

    v4 = v35;
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      v31 = self->_uuid;
      *(_DWORD *)buf = 138543362;
      v44 = (const char *)v31;
      _os_signpost_emit_with_name_impl(&dword_229282000, v30, OS_SIGNPOST_INTERVAL_END, v6, "Min Versions", "%{public}@", buf, 0xCu);
    }

    v36 = v4;
  }

  return v36;
}

- (id)overlayRoots:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSUUID *uuid;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSUUID *v15;
  _QWORD v17[4];
  id v18;
  UAFAssetSet *v19;
  uint8_t buf[4];
  NSUUID *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (+[UAFPreinstalledAssetsCache isEnabled](UAFPreinstalledAssetsCache, "isEnabled"))
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_signpost_id_generate(v5);

    UAFGetLogCategory((id *)&UAFLogContextClient);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      uuid = self->_uuid;
      *(_DWORD *)buf = 138543362;
      v21 = uuid;
      _os_signpost_emit_with_name_impl(&dword_229282000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Overlay Roots", "%{public}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v4);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    -[UAFAssetSet getAutoAssetPreinstalled](self, "getAutoAssetPreinstalled");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "count"))
        self->_rootsPresent = 1;
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __28__UAFAssetSet_overlayRoots___block_invoke;
      v17[3] = &unk_24F1F8708;
      v18 = v10;
      v19 = self;
      objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v17);

    }
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v15 = self->_uuid;
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      _os_signpost_emit_with_name_impl(&dword_229282000, v14, OS_SIGNPOST_INTERVAL_END, v6, "Overlay Roots", "%{public}@", buf, 0xCu);
    }

  }
  else
  {
    v10 = v4;
  }

  return v10;
}

void __28__UAFAssetSet_overlayRoots___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, v5);
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 80);
    v8 = 136315650;
    v9 = "-[UAFAssetSet overlayRoots:]_block_invoke";
    v10 = 2114;
    v11 = v7;
    v12 = 2112;
    v13 = v5;
    _os_log_impl(&dword_229282000, v6, OS_LOG_TYPE_DEFAULT, "%s %{public}@: using autoasset root for %@", (uint8_t *)&v8, 0x20u);
  }

}

- (id)applyAssetTransformations:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UAFAssetSet overlayRoots:](self, "overlayRoots:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UAFAssetSet applyOSCompatibility:](self, "applyOSCompatibility:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UAFAssetSet applyMinVersions:](self, "applyMinVersions:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createAssets
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  unint64_t v7;
  NSUUID *uuid;
  UAFAutoAssetSet *autoAssetSet;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  NSUUID *v14;
  id v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSUUID *v19;
  NSObject *v20;
  NSUUID *v21;
  NSString *name;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  NSObject *v26;
  NSObject *v27;
  NSUUID *v28;
  NSUUID *v29;
  int v30;
  int v32;
  const char *v33;
  __int16 v34;
  NSUUID *v35;
  __int16 v36;
  NSString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v7 = v4 - 1;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uuid = self->_uuid;
    v32 = 138543362;
    v33 = (const char *)uuid;
    _os_signpost_emit_with_name_impl(&dword_229282000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "createAssets", "%{public}@", (uint8_t *)&v32, 0xCu);
  }

  autoAssetSet = self->_autoAssetSet;
  if (autoAssetSet)
  {
    -[UAFAutoAssetSet assets](autoAssetSet, "assets");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  if (!objc_msgSend(v10, "count"))
  {
    if (-[UAFAssetSetConfiguration isTrialAvailable](self->_cfg, "isTrialAvailable"))
    {
      -[UAFAssetSet getTrialAssets](self, "getTrialAssets");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[UAFAssetSet applyAssetTransformations:](self, "applyAssetTransformations:", v16);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        v19 = self->_uuid;
        v32 = 138543362;
        v33 = (const char *)v19;
        _os_signpost_emit_with_name_impl(&dword_229282000, v18, OS_SIGNPOST_INTERVAL_END, v4, "createAssets", "%{public}@", (uint8_t *)&v32, 0xCu);
      }

      if (objc_msgSend(v11, "count"))
      {
        UAFGetLogCategory((id *)&UAFLogContextClient);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = self->_uuid;
          name = self->_name;
          v32 = 136315650;
          v33 = "-[UAFAssetSet createAssets]";
          v34 = 2114;
          v35 = v21;
          v36 = 2114;
          v37 = name;
          v23 = "%s %{public}@: Preferring trial assets over preinstalled assets for assetset %{public}@";
          v24 = v20;
          v25 = 32;
LABEL_27:
          _os_log_impl(&dword_229282000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v32, v25);
          goto LABEL_28;
        }
        goto LABEL_28;
      }
    }
    else
    {
      v16 = (void *)objc_opt_new();
      -[UAFAssetSet applyAssetTransformations:](self, "applyAssetTransformations:", v16);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        v28 = self->_uuid;
        v32 = 138543362;
        v33 = (const char *)v28;
        _os_signpost_emit_with_name_impl(&dword_229282000, v27, OS_SIGNPOST_INTERVAL_END, v4, "createAssets", "%{public}@", (uint8_t *)&v32, 0xCu);
      }

      if (objc_msgSend(v11, "count"))
      {
        UAFGetLogCategory((id *)&UAFLogContextClient);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v29 = self->_uuid;
          v30 = objc_msgSend(v11, "count");
          v32 = 136315650;
          v33 = "-[UAFAssetSet createAssets]";
          v34 = 2114;
          v35 = v29;
          v36 = 1024;
          LODWORD(v37) = v30;
          v23 = "%s %{public}@: Returning %d transformed asset(s)";
          v24 = v20;
          v25 = 28;
          goto LABEL_27;
        }
LABEL_28:

        v15 = v11;
LABEL_30:

        goto LABEL_31;
      }
    }
    v15 = 0;
    goto LABEL_30;
  }
  -[UAFAssetSet applyAssetTransformations:](self, "applyAssetTransformations:", v10);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v7 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v14 = self->_uuid;
    v32 = 138543362;
    v33 = (const char *)v14;
    _os_signpost_emit_with_name_impl(&dword_229282000, v13, OS_SIGNPOST_INTERVAL_END, v4, "createAssets", "%{public}@", (uint8_t *)&v32, 0xCu);
  }

  if (objc_msgSend(v11, "count"))
  {
    v11 = v11;
    v15 = v11;
  }
  else
  {
    v15 = 0;
  }
LABEL_31:

  return v15;
}

- (id)getTrialAssets
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSUUID *uuid;
  void *v8;
  NSDictionary *assetNameToTrial;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSUUID *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  id v20;
  UAFAssetSet *v21;
  uint8_t buf[4];
  NSUUID *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  if (!self->_client)
    return 0;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    uuid = self->_uuid;
    *(_DWORD *)buf = 138543362;
    v23 = uuid;
    _os_signpost_emit_with_name_impl(&dword_229282000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "Trial Assets", "%{public}@", buf, 0xCu);
  }

  v8 = (void *)objc_opt_new();
  assetNameToTrial = self->_assetNameToTrial;
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __29__UAFAssetSet_getTrialAssets__block_invoke;
  v19 = &unk_24F1F8730;
  v10 = v8;
  v20 = v10;
  v21 = self;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](assetNameToTrial, "enumerateKeysAndObjectsUsingBlock:", &v16);
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v13 = self->_uuid;
    *(_DWORD *)buf = 138543362;
    v23 = v13;
    _os_signpost_emit_with_name_impl(&dword_229282000, v12, OS_SIGNPOST_INTERVAL_END, v4, "Trial Assets", "%{public}@", buf, 0xCu);
  }

  if (objc_msgSend(v10, "count", v16, v17, v18, v19))
    v14 = v10;
  else
    v14 = 0;

  return v14;
}

void __29__UAFAssetSet_getTrialAssets__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "createAssetFromTrialInfo:assetName:", a3, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

- (id)createAssetFromPreinstalledWithAutoAssetInfo:(id)a3 assetName:(id)a4 experimentationEnabled:(BOOL)a5 experimentId:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  NSString *name;
  int v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  NSString *v26;
  uint64_t v27;

  v7 = a5;
  v27 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[UAFAssetSetConfiguration autoAssetType](self->_cfg, "autoAssetType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("AssetSpecifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      +[UAFPreinstalledAssetsCache assetSpecifier:assetSetConfiguration:](UAFPreinstalledAssetsCache, "assetSpecifier:assetSetConfiguration:", v14, self->_cfg);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
      {
        -[UAFAssetSet createAssetFromMAAsset:assetName:experimentationEnabled:experimentId:](self, "createAssetFromMAAsset:assetName:experimentationEnabled:experimentId:", v15, v11, v7, v12);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v17 = v15;

      v18 = v17;
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        name = self->_name;
        v21 = 136315650;
        v22 = "-[UAFAssetSet createAssetFromPreinstalledWithAutoAssetInfo:assetName:experimentationEnabled:experimentId:]";
        v23 = 2114;
        v24 = v11;
        v25 = 2114;
        v26 = name;
        _os_log_error_impl(&dword_229282000, v17, OS_LOG_TYPE_ERROR, "%s No AutoAssetSpecifier for \"%{public}@\" asset in \"%{public}@\" asset set, skipping", (uint8_t *)&v21, 0x20u);
      }
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)getAutoAssetPreinstalled
{
  void *v3;
  void *v4;
  NSDictionary *assetNameToAutoAsset;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  NSDictionary *v18;
  uint64_t v19;
  id v20;
  void *v21;
  NSDictionary *v22;
  id v23;
  id v24;
  NSString *v25;
  NSString *experimentId;
  NSDictionary *v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  UAFAssetSet *v41;
  _QWORD v42[4];
  id v43;
  UAFAssetSet *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[4];
  id v50;
  UAFAssetSet *v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  -[UAFAssetSetConfiguration autoAssetType](self->_cfg, "autoAssetType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    assetNameToAutoAsset = self->_assetNameToAutoAsset;
    v49[0] = MEMORY[0x24BDAC760];
    v49[1] = 3221225472;
    v49[2] = __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke;
    v49[3] = &unk_24F1F8730;
    v6 = v3;
    v50 = v6;
    v51 = self;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](assetNameToAutoAsset, "enumerateKeysAndObjectsUsingBlock:", v49);
    if (!self->_experiment)
    {
      v33 = v6;
      goto LABEL_20;
    }
    +[UAFPreinstalledAssetsCache assetSpecifiersFromRoots:](UAFPreinstalledAssetsCache, "assetSpecifiersFromRoots:", self->_cfg);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v8)
    {
      v9 = v8;
      v10 = 0;
      v11 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v46 != v11)
            objc_enumerationMutation(v7);
          v13 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
          -[UAFAssetSetExperiment assetSpecifiers](self->_experiment, "assetSpecifiers");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "objectForKeyedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            v16 = objc_msgSend(v7, "containsObject:", v15);

            if (!v16)
              goto LABEL_15;
            v10 = 1;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v9);

      if ((v10 & 1) != 0)
      {
        v17 = (void *)objc_opt_new();
        v18 = self->_assetNameToAutoAsset;
        v19 = MEMORY[0x24BDAC760];
        v42[0] = MEMORY[0x24BDAC760];
        v42[1] = 3221225472;
        v42[2] = __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke_2;
        v42[3] = &unk_24F1F8730;
        v20 = v17;
        v43 = v20;
        v44 = self;
        -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v18, "enumerateKeysAndObjectsUsingBlock:", v42);
        v21 = (void *)objc_opt_new();
        v22 = self->_assetNameToAutoAsset;
        v38[0] = v19;
        v38[1] = 3221225472;
        v38[2] = __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke_3;
        v38[3] = &unk_24F1F8758;
        v39 = v20;
        v23 = v21;
        v40 = v23;
        v41 = self;
        v24 = v20;
        -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v22, "enumerateKeysAndObjectsUsingBlock:", v38);
        -[UAFAssetSetExperiment experimentId](self->_experiment, "experimentId");
        v25 = (NSString *)objc_claimAutoreleasedReturnValue();
        experimentId = self->_experimentId;
        self->_experimentId = v25;

        v27 = self->_assetNameToAutoAsset;
        v35[0] = v19;
        v35[1] = 3221225472;
        v35[2] = __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke_4;
        v35[3] = &unk_24F1F8730;
        v36 = v23;
        v28 = v6;
        v37 = v28;
        v29 = v23;
        -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v27, "enumerateKeysAndObjectsUsingBlock:", v35);
        v30 = v28;

LABEL_17:
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
LABEL_15:

    }
    v31 = v6;
    goto LABEL_17;
  }
  v32 = v3;
LABEL_21:

  return v3;
}

void __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  unsigned __int8 *v5;
  uint64_t v6;
  id v7;
  id v8;

  v5 = *(unsigned __int8 **)(a1 + 40);
  v6 = v5[88];
  v7 = a2;
  objc_msgSend(v5, "createAssetFromPreinstalledWithAutoAssetInfo:assetName:experimentationEnabled:experimentId:", a3, v7, v6, 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

}

void __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AssetSpecifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "assetSpecifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);

  }
}

void __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("AssetSpecifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, CFSTR("AssetSpecifier"));

      v9 = *(id **)(a1 + 48);
      objc_msgSend(v9[3], "experimentId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "createAssetFromPreinstalledWithAutoAssetInfo:assetName:experimentationEnabled:experimentId:", v5, v12, 1, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v11, v12);

    }
  }

}

void __39__UAFAssetSet_getAutoAssetPreinstalled__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v4, v5);

  }
}

- (void)mapAsset:(id)a3 queue:(id)a4 completion:(id)a5
{
  NSObject *v8;
  id v9;
  UAFAutoAssetSet *autoAssetSet;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  NSUUID *uuid;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  const __CFString *v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  NSUUID *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  autoAssetSet = self->_autoAssetSet;
  if (autoAssetSet)
  {
    -[UAFAutoAssetSet mapAsset:queue:completion:](autoAssetSet, "mapAsset:queue:completion:", a3, v8, v9);
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uuid = self->_uuid;
      *(_DWORD *)buf = 136315394;
      v23 = "-[UAFAssetSet mapAsset:queue:completion:]";
      v24 = 2114;
      v25 = uuid;
      _os_log_error_impl(&dword_229282000, v11, OS_LOG_TYPE_ERROR, "%s %{public}@: mapping assets is only supported for autoassets", buf, 0x16u);
    }

    if (v9)
    {
      v12 = (void *)MEMORY[0x24BDD1540];
      v20 = *MEMORY[0x24BDD0FC8];
      v21 = CFSTR("Not supported");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), 5000, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        dispatch_get_global_queue(0, 0);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __41__UAFAssetSet_mapAsset_queue_completion___block_invoke;
      v17[3] = &unk_24F1F7A40;
      v18 = v14;
      v19 = v9;
      v15 = v14;
      dispatch_async(v8, v17);

    }
  }

}

uint64_t __41__UAFAssetSet_mapAsset_queue_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (NSDictionary)usages
{
  return self->_usages;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (BOOL)experimentationEnabled
{
  return self->_experimentationEnabled;
}

- (NSString)experimentId
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (UAFAutoAssetSet)autoAssetSet
{
  return self->_autoAssetSet;
}

- (void)setAutoAssetSet:(id)a3
{
  objc_storeStrong((id *)&self->_autoAssetSet, a3);
}

- (NSError)autoAssetSetError
{
  return self->_autoAssetSetError;
}

- (void)setAutoAssetSetError:(id)a3
{
  objc_storeStrong((id *)&self->_autoAssetSetError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoAssetSetError, 0);
  objc_storeStrong((id *)&self->_autoAssetSet, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_usages, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetNameToAutoAsset, 0);
  objc_storeStrong((id *)&self->_assetNameToTrial, 0);
  objc_storeStrong((id *)&self->_minVersions, 0);
  objc_storeStrong((id *)&self->_cachingAutoAssetSet, 0);
  objc_storeStrong((id *)&self->_experiment, 0);
  objc_storeStrong((id *)&self->_cfg, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
