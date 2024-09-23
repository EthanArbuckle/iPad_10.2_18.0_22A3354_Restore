@implementation UAFAutoAssetSet

+ (id)getConcurrentQueue
{
  if (_MergedGlobals_5 != -1)
    dispatch_once(&_MergedGlobals_5, &__block_literal_global_7);
  return (id)qword_2540B1CB8;
}

void __37__UAFAutoAssetSet_getConcurrentQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UAFAutoAssetSet.Concurrent", MEMORY[0x24BDAC9C0]);
  v1 = (void *)qword_2540B1CB8;
  qword_2540B1CB8 = (uint64_t)v0;

}

+ (id)getClientName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "executablePath");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

+ (id)getLockReason:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v4, "assetSetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoAssetSetClientName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("UAFAssetSet lock of %@ for %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)getMapReason:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  objc_msgSend(v4, "assetSetIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoAssetSetClientName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "stringWithFormat:", CFSTR("UAFAssetSet map of %@ for %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)autoAssetEntryToAsset:(id)a3 withAssetName:(id)a4 experimentationEnabled:(BOOL)a5 experimentId:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  uint64_t v34;
  void *v35;
  void *v36;
  char isKindOfClass;
  void *v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  UAFAsset *v42;
  void *v44;
  _BOOL4 v45;
  __CFString *v46;
  id v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v45 = a5;
  v54 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v47 = a4;
  v46 = (__CFString *)a6;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v8, "assetID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("com.apple.UnifiedAssetFramework.AssetId"));

  objc_msgSend(v8, "fullAssetSelector");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("com.apple.UnifiedAssetFramework.AssetType"));

  objc_msgSend(v8, "fullAssetSelector");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assetSpecifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("com.apple.UnifiedAssetFramework.AssetSpecifier"));

  objc_msgSend(v9, "setObject:forKeyedSubscript:", CFSTR("MA"), CFSTR("com.apple.UnifiedAssetFramework.Source"));
  objc_msgSend(v8, "assetAttributes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("_DownloadSize"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "longLongValue");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringValue");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v9;
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("com.apple.UnifiedAssetFramework.ReportedDownloadSize"));

  objc_msgSend(v8, "localContentURL");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localContentURL");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    objc_msgSend(v8, "localContentURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "scheme");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v25 = (void *)MEMORY[0x24BDBCF48];
      objc_msgSend(v8, "localContentURL");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "absoluteString");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "fileURLWithPath:isDirectory:", v27, 1);
      v28 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v28;
    }
  }
  v44 = v20;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  objc_msgSend(v8, "assetAttributes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v50 != v32)
          objc_enumerationMutation(v29);
        v34 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v8, "assetAttributes");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "objectForKeyedSubscript:", v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v8, "assetAttributes");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "objectForKeyedSubscript:", v34);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v39, v34);

        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v31);
  }

  if (v45)
    v40 = CFSTR("YES");
  else
    v40 = CFSTR("NO");
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v40, CFSTR("ExperimentationEnabled"));
  if (v46)
    v41 = v46;
  else
    v41 = &stru_24F1F9848;
  objc_msgSend(v48, "setObject:forKeyedSubscript:", v41, CFSTR("ExperimentId"));
  v42 = -[UAFAsset initWithName:location:metadata:]([UAFAsset alloc], "initWithName:location:metadata:", v47, v44, v48);

  return v42;
}

- (UAFAutoAssetSet)initWithAssetSetName:(id)a3 autoAssets:(id)a4 uuid:(id)a5 experiment:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  UAFAutoAssetSet *v17;
  UAFAutoAssetSet *v18;
  id v19;
  id v20;
  NSString *assetSetName;
  void *v22;
  uint64_t v23;
  id v24;
  MAAutoAssetSet *autoAssetSet;
  BOOL v26;
  id v27;
  uint64_t v28;
  NSMutableDictionary *assets;
  MAAutoAssetSetStatus *autoAssetSetStatus;
  UAFAutoAssetSet *v31;
  NSObject *v32;
  MAAutoAssetSet *v33;
  NSUUID *uuid;
  NSString *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  objc_super v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  NSUUID *v45;
  __int16 v46;
  NSUUID *v47;
  __int16 v48;
  NSString *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v41.receiver = self;
  v41.super_class = (Class)UAFAutoAssetSet;
  v17 = -[UAFAutoAssetSet init](&v41, sel_init);
  v18 = v17;
  if (v17)
  {
    v37 = v13;
    v38 = v16;
    v19 = v15;
    if (a7)
      *a7 = 0;
    objc_storeStrong((id *)&v17->_uuid, a5);
    objc_storeStrong((id *)&v18->_assetSetName, a3);
    v20 = objc_alloc(MEMORY[0x24BE66BD8]);
    assetSetName = v18->_assetSetName;
    +[UAFAutoAssetSet getConcurrentQueue](UAFAutoAssetSet, "getConcurrentQueue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v23 = objc_msgSend(v20, "initLockerUsingClientDomain:forAssetSetIdentifier:usingDesiredPolicyCategory:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), assetSetName, 0, v22, &v40);
    v24 = v40;
    autoAssetSet = v18->_autoAssetSet;
    v18->_autoAssetSet = (MAAutoAssetSet *)v23;

    if (a7)
      *a7 = objc_retainAutorelease(v24);
    if (!v18->_autoAssetSet || v24)
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v32 = objc_claimAutoreleasedReturnValue();
      v13 = v37;
      v15 = v19;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        uuid = v18->_uuid;
        v36 = v18->_assetSetName;
        *(_DWORD *)buf = 136316162;
        v43 = "-[UAFAutoAssetSet initWithAssetSetName:autoAssets:uuid:experiment:error:]";
        v44 = 2114;
        v45 = uuid;
        v46 = 2114;
        v47 = uuid;
        v48 = 2114;
        v49 = v36;
        v50 = 2114;
        v51 = v24;
        _os_log_error_impl(&dword_229282000, v32, OS_LOG_TYPE_ERROR, "%s %{public}@: %{public}@ Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x34u);
      }

      v33 = v18->_autoAssetSet;
      v18->_autoAssetSet = 0;

      v31 = 0;
      v16 = v38;
    }
    else
    {
      v39 = 0;
      v26 = -[UAFAutoAssetSet lockAutoAssets:](v18, "lockAutoAssets:", &v39);
      v27 = v39;
      v24 = v27;
      v15 = v19;
      if (v26)
      {
        v16 = v38;
        if (v14)
        {
          -[UAFAutoAssetSet loadAutoAssets:experiment:experimentActivated:](v18, "loadAutoAssets:experiment:experimentActivated:", v14, v38, &v18->_experimentActivated);
          v28 = objc_claimAutoreleasedReturnValue();
          assets = v18->_assets;
          v18->_assets = (NSMutableDictionary *)v28;

          autoAssetSetStatus = v18->_autoAssetSetStatus;
          v18->_autoAssetSetStatus = 0;

        }
        v31 = v18;
      }
      else
      {
        v16 = v38;
        if (a7)
        {
          v24 = objc_retainAutorelease(v27);
          v31 = 0;
          *a7 = v24;
        }
        else
        {
          v31 = 0;
        }
      }
      v13 = v37;
    }

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (BOOL)lockAutoAssets:(id *)a3
{
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  NSUUID *uuid;
  MAAutoAssetSet *autoAssetSet;
  void *v11;
  MAAutoAssetSetStatus *v12;
  NSString *v13;
  MAAutoAssetSetStatus *autoAssetSetStatus;
  NSObject *v15;
  NSObject *v16;
  NSUUID *v17;
  MAAutoAssetSetStatus *v18;
  void *v19;
  NSString *v20;
  NSString *atomicInstance;
  NSString *v22;
  NSString *catalogAssetSetID;
  NSObject *v24;
  NSString *assetSetName;
  NSUUID *v26;
  NSString *v27;
  BOOL v28;
  NSObject *v29;
  NSUUID *v31;
  NSString *v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  NSUUID *v37;
  __int16 v38;
  NSUUID *v39;
  __int16 v40;
  NSString *v41;
  __int16 v42;
  NSString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (a3)
    *a3 = 0;
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
    v35 = (const char *)uuid;
    _os_signpost_emit_with_name_impl(&dword_229282000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "Lock AutoAssets", "%{public}@", buf, 0xCu);
  }

  autoAssetSet = self->_autoAssetSet;
  +[UAFAutoAssetSet getLockReason:](UAFAutoAssetSet, "getLockReason:", autoAssetSet);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0;
  -[MAAutoAssetSet lockAtomicSync:forAtomicInstance:error:](autoAssetSet, "lockAtomicSync:forAtomicInstance:error:", v11, 0, &v33);
  v12 = (MAAutoAssetSetStatus *)objc_claimAutoreleasedReturnValue();
  v13 = (NSString *)v33;
  autoAssetSetStatus = self->_autoAssetSetStatus;
  self->_autoAssetSetStatus = v12;

  UAFGetLogCategory((id *)&UAFLogContextClient);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v17 = self->_uuid;
    *(_DWORD *)buf = 138543362;
    v35 = (const char *)v17;
    _os_signpost_emit_with_name_impl(&dword_229282000, v16, OS_SIGNPOST_INTERVAL_END, v6, "Lock AutoAssets", "%{public}@", buf, 0xCu);
  }

  v18 = self->_autoAssetSetStatus;
  if (v18
    && (-[MAAutoAssetSetStatus latestDownloadedAtomicInstance](v18, "latestDownloadedAtomicInstance"),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v19)
    && !v13)
  {
    -[MAAutoAssetSetStatus latestDownloadedAtomicInstance](self->_autoAssetSetStatus, "latestDownloadedAtomicInstance");
    v20 = (NSString *)objc_claimAutoreleasedReturnValue();
    atomicInstance = self->_atomicInstance;
    self->_atomicInstance = v20;

    -[MAAutoAssetSetStatus downloadedCatalogCachedAssetSetID](self->_autoAssetSetStatus, "downloadedCatalogCachedAssetSetID");
    v22 = (NSString *)objc_claimAutoreleasedReturnValue();
    catalogAssetSetID = self->_catalogAssetSetID;
    self->_catalogAssetSetID = v22;

    UAFGetLogCategory((id *)&UAFLogContextClient);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v26 = self->_uuid;
      assetSetName = self->_assetSetName;
      v27 = self->_atomicInstance;
      *(_DWORD *)buf = 136316162;
      v35 = "-[UAFAutoAssetSet lockAutoAssets:]";
      v36 = 2114;
      v37 = v26;
      v38 = 2114;
      v39 = v26;
      v40 = 2114;
      v41 = assetSetName;
      v42 = 2114;
      v43 = v27;
      _os_log_impl(&dword_229282000, v24, OS_LOG_TYPE_DEFAULT, "%s %{public}@: %{public}@ Locked asset set %{public}@ atomic instance %{public}@", buf, 0x34u);
    }

    v28 = 1;
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      v31 = self->_uuid;
      v32 = self->_assetSetName;
      *(_DWORD *)buf = 136316162;
      v35 = "-[UAFAutoAssetSet lockAutoAssets:]";
      v36 = 2114;
      v37 = v31;
      v38 = 2114;
      v39 = v31;
      v40 = 2114;
      v41 = v32;
      v42 = 2114;
      v43 = v13;
      _os_log_error_impl(&dword_229282000, v29, OS_LOG_TYPE_ERROR, "%s %{public}@: %{public}@ Could not lock asset set %{public}@: %{public}@", buf, 0x34u);
    }

    v28 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v13);
  }

  return v28;
}

- (id)loadAutoAssets:(id)a3 experiment:(id)a4 experimentActivated:(BOOL *)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSUUID *uuid;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  NSObject *v50;
  NSObject *v51;
  id v52;
  NSObject *v53;
  NSObject *v54;
  NSUUID *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t n;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  NSObject *v70;
  NSObject *v71;
  NSUUID *v72;
  NSObject *v73;
  NSObject *v74;
  NSUUID *v75;
  NSUUID *v77;
  NSString *assetSetName;
  NSUUID *v79;
  NSString *v80;
  id v81;
  unint64_t v82;
  os_signpost_id_t spid;
  id obj;
  UAFAutoAssetSet *v85;
  void *v86;
  BOOL *v87;
  void *v88;
  void *v89;
  id v90;
  _QWORD v91[4];
  id v92;
  _BYTE *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _QWORD v98[4];
  id v99;
  id v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _BYTE v117[128];
  _BYTE v118[128];
  uint8_t v119[128];
  uint8_t v120[4];
  NSUUID *v121;
  _BYTE v122[128];
  uint8_t v123[128];
  _BYTE buf[24];
  uint64_t (*v125)(uint64_t, uint64_t);
  __int128 v126;
  uint64_t v127;

  v127 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v90 = a4;
  v85 = self;
  v86 = v8;
  if (v8)
  {
    if (self->_autoAssetSetStatus)
    {
      v87 = a5;
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v9 = objc_claimAutoreleasedReturnValue();
      spid = os_signpost_id_generate(v9);

      UAFGetLogCategory((id *)&UAFLogContextClient);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      v82 = spid - 1;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        uuid = self->_uuid;
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = uuid;
        _os_signpost_emit_with_name_impl(&dword_229282000, v11, OS_SIGNPOST_INTERVAL_BEGIN, spid, "Load AutoAssets", "%{public}@", buf, 0xCu);
      }

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v125 = __Block_byref_object_copy__2;
      *(_QWORD *)&v126 = __Block_byref_object_dispose__2;
      *((_QWORD *)&v126 + 1) = 0;
      v13 = (void *)objc_opt_new();
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v14 = v8;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v114;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v114 != v16)
              objc_enumerationMutation(v14);
            v18 = *(_QWORD *)(*((_QWORD *)&v113 + 1) + 8 * i);
            objc_msgSend(v14, "objectForKeyedSubscript:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("AssetSpecifier"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, v20);

          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v113, v123, 16);
        }
        while (v15);
      }

      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      -[MAAutoAssetSetStatus latestDowloadedAtomicInstanceEntries](v85->_autoAssetSetStatus, "latestDowloadedAtomicInstanceEntries");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v110;
        do
        {
          for (j = 0; j != v22; ++j)
          {
            if (*(_QWORD *)v110 != v23)
              objc_enumerationMutation(v21);
            v25 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * j);
            objc_msgSend(v25, "fullAssetSelector");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "assetSpecifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            if (v28)
            {
              if (!*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
              {
                v29 = objc_opt_new();
                v30 = *(void **)(*(_QWORD *)&buf[8] + 40);
                *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v29;

              }
              +[UAFAutoAssetSet autoAssetEntryToAsset:withAssetName:experimentationEnabled:experimentId:](UAFAutoAssetSet, "autoAssetEntryToAsset:withAssetName:experimentationEnabled:experimentId:", v25, v28, v90 != 0, 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setObject:forKeyedSubscript:", v31, v28);

            }
          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v109, v122, 16);
        }
        while (v22);
      }

      if (!v90
        || (objc_msgSend(v90, "assetSpecifiers"), (v32 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
        || (objc_msgSend(v90, "experimentId"),
            v33 = (void *)objc_claimAutoreleasedReturnValue(),
            v34 = v33 == 0,
            v33,
            v32,
            v34))
      {
        UAFGetLogCategory((id *)&UAFLogContextClient);
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = v53;
        if (v82 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v53))
        {
          v55 = v85->_uuid;
          *(_DWORD *)v120 = 138543362;
          v121 = v55;
          _os_signpost_emit_with_name_impl(&dword_229282000, v54, OS_SIGNPOST_INTERVAL_END, spid, "Load AutoAssets", "%{public}@", v120, 0xCu);
        }

        v52 = *(id *)(*(_QWORD *)&buf[8] + 40);
        goto LABEL_78;
      }
      v35 = (void *)objc_opt_new();
      v89 = (void *)objc_opt_new();
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      -[MAAutoAssetSetStatus latestDowloadedAtomicInstanceEntries](v85->_autoAssetSetStatus, "latestDowloadedAtomicInstanceEntries");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
      if (v37)
      {
        v38 = *(_QWORD *)v106;
        do
        {
          for (k = 0; k != v37; ++k)
          {
            if (*(_QWORD *)v106 != v38)
              objc_enumerationMutation(v36);
            v40 = *(void **)(*((_QWORD *)&v105 + 1) + 8 * k);
            objc_msgSend(v40, "fullAssetSelector");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "assetSpecifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v89, "addObject:", v42);

            objc_msgSend(v90, "assetSpecifiers");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "fullAssetSelector");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "assetSpecifier");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKeyedSubscript:", v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            if (v46)
              objc_msgSend(v35, "addObject:", v46);

          }
          v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v105, v119, 16);
        }
        while (v37);
      }

      *v87 = 1;
      v101 = 0u;
      v102 = 0u;
      v103 = 0u;
      v104 = 0u;
      obj = v35;
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v118, 16);
      if (v47)
      {
        v48 = *(_QWORD *)v102;
        while (2)
        {
          for (m = 0; m != v47; ++m)
          {
            if (*(_QWORD *)v102 != v48)
              objc_enumerationMutation(obj);
            if ((objc_msgSend(v89, "containsObject:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * m)) & 1) == 0)
            {
              *v87 = 0;
              goto LABEL_57;
            }
          }
          v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v101, v118, 16);
          if (v47)
            continue;
          break;
        }
      }
LABEL_57:

      if (objc_msgSend(obj, "count"))
      {
        if (*v87)
        {
          v56 = (void *)objc_opt_new();
          objc_msgSend(v90, "assetSpecifiers");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v98[0] = MEMORY[0x24BDAC760];
          v98[1] = 3221225472;
          v98[2] = __65__UAFAutoAssetSet_loadAutoAssets_experiment_experimentActivated___block_invoke;
          v98[3] = &unk_24F1F7BF8;
          v58 = v56;
          v99 = v58;
          v81 = v13;
          v100 = v81;
          objc_msgSend(v57, "enumerateKeysAndObjectsUsingBlock:", v98);

          v88 = (void *)objc_opt_new();
          v96 = 0u;
          v97 = 0u;
          v94 = 0u;
          v95 = 0u;
          -[MAAutoAssetSetStatus latestDowloadedAtomicInstanceEntries](v85->_autoAssetSetStatus, "latestDowloadedAtomicInstanceEntries");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v94, v117, 16);
          if (v60)
          {
            v61 = *(_QWORD *)v95;
            do
            {
              for (n = 0; n != v60; ++n)
              {
                if (*(_QWORD *)v95 != v61)
                  objc_enumerationMutation(v59);
                v63 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * n);
                objc_msgSend(v63, "fullAssetSelector");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v64, "assetSpecifier");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "objectForKeyedSubscript:", v65);
                v66 = (void *)objc_claimAutoreleasedReturnValue();

                if (v66)
                {
                  objc_msgSend(v90, "experimentId");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  +[UAFAutoAssetSet autoAssetEntryToAsset:withAssetName:experimentationEnabled:experimentId:](UAFAutoAssetSet, "autoAssetEntryToAsset:withAssetName:experimentationEnabled:experimentId:", v63, v66, 1, v67);
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v88, "setObject:forKeyedSubscript:", v68, v66);

                }
              }
              v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v94, v117, 16);
            }
            while (v60);
          }

          v91[0] = MEMORY[0x24BDAC760];
          v91[1] = 3221225472;
          v91[2] = __65__UAFAutoAssetSet_loadAutoAssets_experiment_experimentActivated___block_invoke_2;
          v91[3] = &unk_24F1F7C20;
          v69 = v88;
          v92 = v69;
          v93 = buf;
          objc_msgSend(v81, "enumerateKeysAndObjectsUsingBlock:", v91);
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v70 = objc_claimAutoreleasedReturnValue();
          v71 = v70;
          if (v82 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
          {
            v72 = v85->_uuid;
            *(_DWORD *)v120 = 138543362;
            v121 = v72;
            _os_signpost_emit_with_name_impl(&dword_229282000, v71, OS_SIGNPOST_INTERVAL_END, spid, "Load AutoAssets", "%{public}@", v120, 0xCu);
          }

          v52 = *(id *)(*(_QWORD *)&buf[8] + 40);
LABEL_77:

LABEL_78:
          _Block_object_dispose(buf, 8);

          goto LABEL_79;
        }
      }
      else
      {
        *v87 = 0;
      }
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v73 = objc_claimAutoreleasedReturnValue();
      v74 = v73;
      if (v82 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v73))
      {
        v75 = v85->_uuid;
        *(_DWORD *)v120 = 138543362;
        v121 = v75;
        _os_signpost_emit_with_name_impl(&dword_229282000, v74, OS_SIGNPOST_INTERVAL_END, spid, "Load AutoAssets", "%{public}@", v120, 0xCu);
      }

      v52 = *(id *)(*(_QWORD *)&buf[8] + 40);
      goto LABEL_77;
    }
  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v50 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
    {
      v77 = self->_uuid;
      assetSetName = self->_assetSetName;
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[UAFAutoAssetSet loadAutoAssets:experiment:experimentActivated:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v77;
      *(_WORD *)&buf[22] = 2114;
      v125 = (uint64_t (*)(uint64_t, uint64_t))v77;
      LOWORD(v126) = 2114;
      *(_QWORD *)((char *)&v126 + 2) = assetSetName;
      _os_log_error_impl(&dword_229282000, v50, OS_LOG_TYPE_ERROR, "%s %{public}@: %{public}@ Could not load asset set %{public}@ as autoAssets is unexpectedly nil", buf, 0x2Au);
    }

    if (self->_autoAssetSetStatus)
      goto LABEL_51;
  }
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v51 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
  {
    v79 = self->_uuid;
    v80 = self->_assetSetName;
    *(_DWORD *)buf = 136315906;
    *(_QWORD *)&buf[4] = "-[UAFAutoAssetSet loadAutoAssets:experiment:experimentActivated:]";
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v79;
    *(_WORD *)&buf[22] = 2114;
    v125 = (uint64_t (*)(uint64_t, uint64_t))v79;
    LOWORD(v126) = 2114;
    *(_QWORD *)((char *)&v126 + 2) = v80;
    _os_log_error_impl(&dword_229282000, v51, OS_LOG_TYPE_ERROR, "%s %{public}@: %{public}@ Could not load asset set %{public}@ as _autoAssetSetStatus is unexpectedly nil", buf, 0x2Au);
  }

LABEL_51:
  v52 = 0;
LABEL_79:

  return v52;
}

void __65__UAFAutoAssetSet_loadAutoAssets_experiment_experimentActivated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = *(void **)(a1 + 40);
  v6 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);

}

void __65__UAFAutoAssetSet_loadAutoAssets_experiment_experimentActivated___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    {
      v5 = objc_opt_new();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setObject:forKeyedSubscript:", v8, v9);

  }
}

- (void)dealloc
{
  void *v3;
  NSUUID *v4;
  void *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSUUID *uuid;
  MAAutoAssetSet *autoAssetSet;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSUUID *v15;
  objc_super v16;
  _QWORD v17[4];
  NSUUID *v18;
  id v19;
  uint8_t buf[4];
  NSUUID *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x22E2C6BC8](self, a2);
  v4 = self->_uuid;
  -[UAFAutoAssetSet atomicInstance](self, "atomicInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_signpost_id_generate(v6);

    UAFGetLogCategory((id *)&UAFLogContextClient);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      uuid = self->_uuid;
      *(_DWORD *)buf = 138543362;
      v21 = uuid;
      _os_signpost_emit_with_name_impl(&dword_229282000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "Unlock AutoAssets", "%{public}@", buf, 0xCu);
    }

    autoAssetSet = self->_autoAssetSet;
    +[UAFAutoAssetSet getLockReason:](UAFAutoAssetSet, "getLockReason:", autoAssetSet);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __26__UAFAutoAssetSet_dealloc__block_invoke;
    v17[3] = &unk_24F1F7C48;
    v18 = v4;
    v19 = v5;
    -[MAAutoAssetSet endAtomicLock:ofAtomicInstance:completion:](autoAssetSet, "endAtomicLock:ofAtomicInstance:completion:", v12, v19, v17);

    UAFGetLogCategory((id *)&UAFLogContextClient);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      v15 = self->_uuid;
      *(_DWORD *)buf = 138543362;
      v21 = v15;
      _os_signpost_emit_with_name_impl(&dword_229282000, v14, OS_SIGNPOST_INTERVAL_END, v7, "Unlock AutoAssets", "%{public}@", buf, 0xCu);
    }

  }
  objc_autoreleasePoolPop(v3);
  v16.receiver = self;
  v16.super_class = (Class)UAFAutoAssetSet;
  -[UAFAutoAssetSet dealloc](&v16, sel_dealloc);
}

void __26__UAFAutoAssetSet_dealloc__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v12 = 136315906;
      v13 = "-[UAFAutoAssetSet dealloc]_block_invoke";
      v14 = 2114;
      v15 = v8;
      v16 = 2114;
      v17 = v5;
      v18 = 2114;
      v19 = v9;
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s %{public}@ Failed to unlock asset set %{public}@ instance %{public}@", (uint8_t *)&v12, 0x2Au);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(_QWORD *)(a1 + 40);
    v12 = 136315906;
    v13 = "-[UAFAutoAssetSet dealloc]_block_invoke";
    v14 = 2114;
    v15 = v10;
    v16 = 2114;
    v17 = v5;
    v18 = 2114;
    v19 = v11;
    _os_log_impl(&dword_229282000, v7, OS_LOG_TYPE_DEFAULT, "%s %{public}@ Unlocked asset set %{public}@ atomic instance %{public}@", (uint8_t *)&v12, 0x2Au);
  }

}

- (id)assetWithName:(id)a3 autoAssets:(id)a4 experiment:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSUUID *uuid;
  NSString *assetSetName;
  int v15;
  const char *v16;
  __int16 v17;
  NSUUID *v18;
  __int16 v19;
  NSUUID *v20;
  __int16 v21;
  NSString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  if (self->_autoAssetSetStatus)
  {
    LOBYTE(v15) = 0;
    -[UAFAutoAssetSet loadAutoAssets:experiment:experimentActivated:](self, "loadAutoAssets:experiment:experimentActivated:", a4, a5, &v15);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uuid = self->_uuid;
      assetSetName = self->_assetSetName;
      v15 = 136315906;
      v16 = "-[UAFAutoAssetSet assetWithName:autoAssets:experiment:]";
      v17 = 2114;
      v18 = uuid;
      v19 = 2114;
      v20 = uuid;
      v21 = 2114;
      v22 = assetSetName;
      _os_log_error_impl(&dword_229282000, v11, OS_LOG_TYPE_ERROR, "%s %{public}@: %{public}@ Could not load asset set %{public}@ as _autoAssetSetStatus is unexpectedly nil", (uint8_t *)&v15, 0x2Au);
    }

    v10 = 0;
  }

  return v10;
}

+ (id)catalogAssetSetID:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_alloc(MEMORY[0x24BE66BD8]);
  +[UAFAutoAssetSet getClientName](UAFAutoAssetSet, "getClientName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UAFAutoAssetSet getConcurrentQueue](UAFAutoAssetSet, "getConcurrentQueue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v7 = (void *)objc_msgSend(v4, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), v5, v3, 0, v6, &v22);
  v8 = v22;

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v21 = 0;
    objc_msgSend(v7, "currentSetStatusSync:", &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v21;
    if (v8)
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        v24 = "+[UAFAutoAssetSet catalogAssetSetID:]";
        v25 = 2114;
        v26 = v3;
        v27 = 2114;
        v28 = v8;
        v14 = "%s Could not get status of auto asset set %{public}@ : %{public}@";
        v15 = v13;
        v16 = 32;
LABEL_11:
        _os_log_impl(&dword_229282000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else
    {
      objc_msgSend(v12, "downloadedCatalogCachedAssetSetID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v17 = v19;
        if (!objc_msgSend(v19, "isEqualToString:", v3))
          goto LABEL_14;
        UAFGetLogCategory((id *)&UAFLogContextClient);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136315138;
          v24 = "+[UAFAutoAssetSet catalogAssetSetID:]";
          _os_log_fault_impl(&dword_229282000, v20, OS_LOG_TYPE_FAULT, "%s MA AutoAssetSet's assetSetID is same as assetSetName", buf, 0xCu);
        }

        UAFGetLogCategory((id *)&UAFLogContextClient);
        v13 = objc_claimAutoreleasedReturnValue();
        UAFFaultCapture((uint64_t)v13, (uint64_t)kUAFABCMissingAssetSetIDFailure, (uint64_t)v3, 0);
LABEL_13:

LABEL_14:
        v10 = v17;

        v11 = v10;
        goto LABEL_15;
      }
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v24 = "+[UAFAutoAssetSet catalogAssetSetID:]";
        v25 = 2114;
        v26 = v3;
        v14 = "%s MA AutoAssetSet's downloadedCatalogCachedAssetSetID is nil for asset set - %{public}@";
        v15 = v13;
        v16 = 22;
        goto LABEL_11;
      }
    }
    v17 = 0;
    goto LABEL_13;
  }
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v24 = "+[UAFAutoAssetSet catalogAssetSetID:]";
    v25 = 2114;
    v26 = v3;
    v27 = 2114;
    v28 = v8;
    _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s Could not initialize auto asset set %{public}@ : %{public}@", buf, 0x20u);
  }
  v11 = 0;
LABEL_15:

  return v11;
}

- (id)getMAAutoAssetDownloadErrorsSync
{
  id v3;
  MAAutoAssetSet *autoAssetSet;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSUUID *uuid;
  NSString *v9;
  NSUUID *v10;
  NSString *assetSetName;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  NSUUID *v23;
  __int16 v24;
  NSString *v25;
  __int16 v26;
  NSObject *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD14E0]);
  autoAssetSet = self->_autoAssetSet;
  if (autoAssetSet)
  {
    v19 = 0;
    -[MAAutoAssetSet currentSetStatusSync:](autoAssetSet, "currentSetStatusSync:", &v19);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v19;
    if (v6)
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v7 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
LABEL_12:

LABEL_13:
        goto LABEL_14;
      }
      uuid = self->_uuid;
      -[MAAutoAssetSet summary](self->_autoAssetSet, "summary");
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315906;
      v21 = "-[UAFAutoAssetSet getMAAutoAssetDownloadErrorsSync]";
      v22 = 2114;
      v23 = uuid;
      v24 = 2114;
      v25 = v9;
      v26 = 2114;
      v27 = v6;
      _os_log_error_impl(&dword_229282000, v7, OS_LOG_TYPE_ERROR, "%s %{public}@: Could not get the current status of auto asset  %{public}@ : %{public}@", buf, 0x2Au);
    }
    else
    {
      objc_msgSend(v5, "availableForUseError");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v5, "availableForUseError");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "numberWithLong:", objc_msgSend(v14, "code"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v15);

      }
      objc_msgSend(v5, "newerVersionError");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
        goto LABEL_13;
      v17 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v5, "newerVersionError");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "numberWithLong:", -[NSObject code](v7, "code"));
      v9 = (NSString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v9);
    }

    goto LABEL_12;
  }
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v10 = self->_uuid;
    assetSetName = self->_assetSetName;
    *(_DWORD *)buf = 136315650;
    v21 = "-[UAFAutoAssetSet getMAAutoAssetDownloadErrorsSync]";
    v22 = 2114;
    v23 = v10;
    v24 = 2114;
    v25 = assetSetName;
    _os_log_error_impl(&dword_229282000, v6, OS_LOG_TYPE_ERROR, "%s %{public}@: Did not have auto asset set object for set %{public}@ when attempting to gather errors", buf, 0x20u);
  }
LABEL_14:

  return v3;
}

- (void)mapAsset:(id)a3 queue:(id)a4 completion:(id)a5
{
  NSString *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void (**v15)(_QWORD, _QWORD);
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  NSString *v21;
  id v22;
  void *v23;
  NSString *v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSUUID *v29;
  NSString *v30;
  NSString *atomicInstance;
  void *v32;
  void *v33;
  NSString *v34;
  NSString *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  const __CFString **v41;
  uint64_t *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  NSObject *v47;
  NSUUID *uuid;
  NSString *assetSetName;
  NSUUID *v50;
  NSString *v51;
  NSUUID *v52;
  NSString *v53;
  NSUUID *v54;
  NSString *v55;
  NSUUID *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  NSString *v61;
  id v62;
  _QWORD v63[5];
  id v64;
  id v65;
  _QWORD v66[4];
  id v67;
  id v68;
  uint64_t v69;
  const __CFString *v70;
  uint64_t v71;
  const __CFString *v72;
  uint64_t v73;
  const __CFString *v74;
  uint8_t buf[4];
  const char *v76;
  __int16 v77;
  NSUUID *v78;
  __int16 v79;
  NSString *v80;
  __int16 v81;
  NSString *v82;
  uint64_t v83;

  v83 = *MEMORY[0x24BDAC8D0];
  v8 = (NSString *)a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  v12 = v11;
  if (!v11)
  {
    +[UAFAutoAssetSet getConcurrentQueue](UAFAutoAssetSet, "getConcurrentQueue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v66[0] = MEMORY[0x24BDAC760];
  v66[1] = 3221225472;
  v66[2] = __45__UAFAutoAssetSet_mapAsset_queue_completion___block_invoke;
  v66[3] = &unk_24F1F7C70;
  v13 = v10;
  v68 = v13;
  v14 = v12;
  v67 = v14;
  v15 = (void (**)(_QWORD, _QWORD))MEMORY[0x22E2C6D60](v66);
  -[UAFAutoAssetSet assets](self, "assets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      uuid = self->_uuid;
      assetSetName = self->_assetSetName;
      *(_DWORD *)buf = 136315906;
      v76 = "-[UAFAutoAssetSet mapAsset:queue:completion:]";
      v77 = 2114;
      v78 = uuid;
      v79 = 2114;
      v80 = v8;
      v81 = 2114;
      v82 = assetSetName;
      _os_log_error_impl(&dword_229282000, v38, OS_LOG_TYPE_ERROR, "%s %{public}@: Asset %{public}@ not found in asset set %{public}@", buf, 0x2Au);
    }

    v39 = (void *)MEMORY[0x24BDD1540];
    v73 = *MEMORY[0x24BDD0FC8];
    v74 = CFSTR("No asset found");
    v40 = (void *)MEMORY[0x24BDBCE70];
    v41 = &v74;
    v42 = &v73;
    goto LABEL_17;
  }
  objc_msgSend(v17, "metadata");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("com.apple.UnifiedAssetFramework.AssetType"));
  v19 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
    {
      v50 = self->_uuid;
      v51 = self->_assetSetName;
      *(_DWORD *)buf = 136315906;
      v76 = "-[UAFAutoAssetSet mapAsset:queue:completion:]";
      v77 = 2114;
      v78 = v50;
      v79 = 2114;
      v80 = v8;
      v81 = 2114;
      v82 = v51;
      _os_log_error_impl(&dword_229282000, v43, OS_LOG_TYPE_ERROR, "%s %{public}@: Asset %{public}@ in asset set %{public}@ has no asset type", buf, 0x2Au);
    }

    v39 = (void *)MEMORY[0x24BDD1540];
    v71 = *MEMORY[0x24BDD0FC8];
    v72 = CFSTR("No asset type found");
    v40 = (void *)MEMORY[0x24BDBCE70];
    v41 = &v72;
    v42 = &v71;
LABEL_17:
    objc_msgSend(v40, "dictionaryWithObjects:forKeys:count:", v41, v42, 1);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), 5001, v19);
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, NSString *))v15)[2](v15, v21);
    goto LABEL_29;
  }
  objc_msgSend(v17, "metadata");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("com.apple.UnifiedAssetFramework.AssetSpecifier"));
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    v60 = v13;
    v61 = v8;
    v22 = objc_alloc(MEMORY[0x24BE66BD8]);
    +[UAFAutoAssetSet getClientName](UAFAutoAssetSet, "getClientName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = self->_assetSetName;
    v65 = 0;
    v25 = objc_msgSend(v22, "initUsingClientDomain:forClientName:forAssetSetIdentifier:comprisedOfEntries:completingFromQueue:error:", CFSTR("com.apple.UnifiedAssetFramework"), v23, v24, 0, v14, &v65);
    v62 = v65;

    v59 = (void *)v25;
    if (v25)
    {
      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE66BD0]), "initForAssetType:withAssetSpecifier:", v19, v21);
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = v27;
      v58 = v14;
      if (v26)
      {
        v57 = v26;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v29 = self->_uuid;
          objc_msgSend(v26, "summary");
          v30 = (NSString *)objc_claimAutoreleasedReturnValue();
          atomicInstance = self->_atomicInstance;
          *(_DWORD *)buf = 136315906;
          v76 = "-[UAFAutoAssetSet mapAsset:queue:completion:]";
          v77 = 2114;
          v78 = v29;
          v79 = 2114;
          v80 = v30;
          v81 = 2114;
          v82 = atomicInstance;
          _os_log_impl(&dword_229282000, v28, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Mapping %{public}@ from atomic instance %{public}@", buf, 0x2Au);

        }
        v32 = v59;
        +[UAFAutoAssetSet getMapReason:](UAFAutoAssetSet, "getMapReason:", v59);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = self->_atomicInstance;
        v63[0] = MEMORY[0x24BDAC760];
        v63[1] = 3221225472;
        v63[2] = __45__UAFAutoAssetSet_mapAsset_queue_completion___block_invoke_212;
        v63[3] = &unk_24F1F7C98;
        v63[4] = self;
        v64 = v60;
        v35 = v34;
        v13 = v60;
        v36 = v57;
        objc_msgSend(v59, "mapLockedAtomicEntry:forAtomicInstance:mappingSelector:completion:", v33, v35, v57, v63);

        v8 = v61;
        v37 = v62;
      }
      else
      {
        v36 = 0;
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          v56 = self->_uuid;
          *(_DWORD *)buf = 136315906;
          v76 = "-[UAFAutoAssetSet mapAsset:queue:completion:]";
          v77 = 2114;
          v78 = v56;
          v79 = 2114;
          v80 = v19;
          v81 = 2114;
          v82 = v21;
          _os_log_error_impl(&dword_229282000, v28, OS_LOG_TYPE_ERROR, "%s %{public}@: Could not create selector for asset type: %{public}@ specifier: %{public}@", buf, 0x2Au);
        }

        v37 = v62;
        ((void (**)(_QWORD, id))v15)[2](v15, v62);
        v13 = v60;
        v8 = v61;
        v32 = v59;
      }

      v14 = v58;
    }
    else
    {
      UAFGetLogCategory((id *)&UAFLogContextClient);
      v47 = objc_claimAutoreleasedReturnValue();
      v13 = v60;
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v54 = self->_uuid;
        v55 = self->_assetSetName;
        *(_DWORD *)buf = 136315906;
        v76 = "-[UAFAutoAssetSet mapAsset:queue:completion:]";
        v77 = 2114;
        v78 = v54;
        v79 = 2114;
        v80 = v55;
        v81 = 2114;
        v82 = (NSString *)v62;
        _os_log_error_impl(&dword_229282000, v47, OS_LOG_TYPE_ERROR, "%s %{public}@: Error initializing MAAutoAssetSet for %{public}@: %{public}@", buf, 0x2Au);
      }

      v37 = v62;
      ((void (**)(_QWORD, id))v15)[2](v15, v62);
      v8 = v61;
      v32 = 0;
    }

  }
  else
  {
    UAFGetLogCategory((id *)&UAFLogContextClient);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
    {
      v52 = self->_uuid;
      v53 = self->_assetSetName;
      *(_DWORD *)buf = 136315906;
      v76 = "-[UAFAutoAssetSet mapAsset:queue:completion:]";
      v77 = 2114;
      v78 = v52;
      v79 = 2114;
      v80 = v8;
      v81 = 2114;
      v82 = v53;
      _os_log_error_impl(&dword_229282000, v44, OS_LOG_TYPE_ERROR, "%s %{public}@: Asset %{public}@ in asset set %{public}@ has no asset specifier", buf, 0x2Au);
    }

    v45 = (void *)MEMORY[0x24BDD1540];
    v69 = *MEMORY[0x24BDD0FC8];
    v70 = CFSTR("No asset specifier found");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v70, &v69, 1);
    v21 = (NSString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("com.apple.UnifiedAssetFramework"), 5001, v21);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v15)[2](v15, v46);

  }
LABEL_29:

}

void __45__UAFAutoAssetSet_mapAsset_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __45__UAFAutoAssetSet_mapAsset_queue_completion___block_invoke_2;
    v6[3] = &unk_24F1F7A40;
    v8 = v4;
    v7 = v3;
    dispatch_async(v5, v6);

  }
}

uint64_t __45__UAFAutoAssetSet_mapAsset_queue_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __45__UAFAutoAssetSet_mapAsset_queue_completion___block_invoke_212(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  UAFGetLogCategory((id *)&UAFLogContextClient);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    objc_msgSend(v8, "assetSpecifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136316162;
    v14 = "-[UAFAutoAssetSet mapAsset:queue:completion:]_block_invoke";
    v15 = 2114;
    v16 = v11;
    v17 = 2114;
    v18 = v12;
    v19 = 2114;
    v20 = v7;
    v21 = 2114;
    v22 = v9;
    _os_log_impl(&dword_229282000, v10, OS_LOG_TYPE_DEFAULT, "%s %{public}@: Mapped specifier %{public}@ from atomic instance %{public}@ with error: %{public}@", (uint8_t *)&v13, 0x34u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (MAAutoAssetSet)autoAssetSet
{
  return self->_autoAssetSet;
}

- (void)setAutoAssetSet:(id)a3
{
  objc_storeStrong((id *)&self->_autoAssetSet, a3);
}

- (MAAutoAssetSetStatus)autoAssetSetStatus
{
  return self->_autoAssetSetStatus;
}

- (void)setAutoAssetSetStatus:(id)a3
{
  objc_storeStrong((id *)&self->_autoAssetSetStatus, a3);
}

- (NSString)atomicInstance
{
  return self->_atomicInstance;
}

- (void)setAtomicInstance:(id)a3
{
  objc_storeStrong((id *)&self->_atomicInstance, a3);
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)assetSetName
{
  return self->_assetSetName;
}

- (void)setAssetSetName:(id)a3
{
  objc_storeStrong((id *)&self->_assetSetName, a3);
}

- (NSMutableDictionary)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_storeStrong((id *)&self->_assets, a3);
}

- (BOOL)experimentActivated
{
  return self->_experimentActivated;
}

- (NSString)catalogAssetSetID
{
  return self->_catalogAssetSetID;
}

- (void)setCatalogAssetSetID:(id)a3
{
  objc_storeStrong((id *)&self->_catalogAssetSetID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_catalogAssetSetID, 0);
  objc_storeStrong((id *)&self->_assets, 0);
  objc_storeStrong((id *)&self->_assetSetName, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_atomicInstance, 0);
  objc_storeStrong((id *)&self->_autoAssetSetStatus, 0);
  objc_storeStrong((id *)&self->_autoAssetSet, 0);
}

@end
