@implementation UAFAssetSetExperiment

- (UAFAssetSetExperiment)initWithConfiguration:(id)a3 uuid:(id)a4
{
  id v6;
  id v7;
  UAFAssetSetExperiment *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSUUID **p_uuid;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  NSDictionary *assetSpecifiers;
  void *v31;
  void *v32;
  uint64_t v33;
  NSString *experimentId;
  NSObject *v35;
  NSObject *v36;
  const char *v37;
  UAFAssetSetExperiment *v38;
  NSObject *v39;
  NSObject *v40;
  const char *v41;
  NSObject *v42;
  NSObject *v43;
  const char *v44;
  void *v46;
  void *v47;
  void *v48;
  NSUUID **v49;
  os_signpost_id_t v50;
  id v51;
  id v52;
  objc_super v53;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  uint64_t v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v53.receiver = self;
  v53.super_class = (Class)UAFAssetSetExperiment;
  v8 = -[UAFAssetSetExperiment init](&v53, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "trialProject");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = (void *)v9;
      objc_msgSend(v6, "trialNamespace");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v38 = 0;
LABEL_31:

        goto LABEL_32;
      }
      v12 = (void *)v11;
      objc_msgSend(v6, "trialFactor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        p_uuid = &v8->_uuid;
        objc_storeStrong((id *)&v8->_uuid, a4);
        UAFGetLogCategory((id *)&UAFLogContextClient);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = os_signpost_id_generate(v15);

        UAFGetLogCategory((id *)&UAFLogContextClient);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v17;
        v19 = v16 - 1;
        if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
        {
          v20 = (const char *)*p_uuid;
          *(_DWORD *)buf = 138543362;
          v55 = v20;
          _os_signpost_emit_with_name_impl(&dword_229282000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Experiment AutoAssets", "%{public}@", buf, 0xCu);
        }

        objc_msgSend(v6, "trialProject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[UAFCommonUtilities trialClientWithProject:](UAFCommonUtilities, "trialClientWithProject:", v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v49 = &v8->_uuid;
          v50 = v16;
          objc_msgSend(v6, "trialNamespace");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "trialFactor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          +[UAFCommonUtilities getDirectoryPath:trialNamespace:trialFactor:](UAFCommonUtilities, "getDirectoryPath:trialNamespace:trialFactor:", v10, v22, v23);
          v24 = objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", v24, 1);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "URLByAppendingPathComponent:", CFSTR("experiment.plist"));
            v26 = objc_claimAutoreleasedReturnValue();

            v52 = 0;
            +[UAFAssetSetExperimentConfiguration fromContentsOfURL:error:](UAFAssetSetExperimentConfiguration, "fromContentsOfURL:error:", v26, &v52);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v51 = v52;
            if (v51)
            {
              UAFGetLogCategory((id *)&UAFLogContextClient);
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 136315650;
                v55 = "-[UAFAssetSetExperiment initWithConfiguration:uuid:]";
                v56 = 2112;
                v57 = v26;
                v58 = 2114;
                v59 = v51;
                _os_log_error_impl(&dword_229282000, v28, OS_LOG_TYPE_ERROR, "%s Could not load asset set experiment at %@: %{public}@", buf, 0x20u);
              }

            }
            v48 = (void *)v26;
            objc_msgSend(v27, "assetSpecifiers", v27);
            v29 = objc_claimAutoreleasedReturnValue();
            assetSpecifiers = v8->_assetSpecifiers;
            v8->_assetSpecifiers = (NSDictionary *)v29;

            objc_msgSend(v6, "trialNamespace");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            +[UAFCommonUtilities experimentIdentifiersTrialClient:trialNamespace:](UAFCommonUtilities, "experimentIdentifiersTrialClient:trialNamespace:", v10, v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v32, "experimentId");
            v33 = objc_claimAutoreleasedReturnValue();
            experimentId = v8->_experimentId;
            v8->_experimentId = (NSString *)v33;

            UAFGetLogCategory((id *)&UAFLogContextClient);
            v35 = objc_claimAutoreleasedReturnValue();
            v36 = v35;
            if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
            {
              v37 = (const char *)*v49;
              *(_DWORD *)buf = 138543362;
              v55 = v37;
              _os_signpost_emit_with_name_impl(&dword_229282000, v36, OS_SIGNPOST_INTERVAL_END, v50, "Experiment AutoAssets", "%{public}@", buf, 0xCu);
            }

            v38 = v8;
          }
          else
          {
            UAFGetLogCategory((id *)&UAFLogContextClient);
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = v42;
            if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
            {
              v44 = (const char *)*v49;
              *(_DWORD *)buf = 138543362;
              v55 = v44;
              _os_signpost_emit_with_name_impl(&dword_229282000, v43, OS_SIGNPOST_INTERVAL_END, v50, "Experiment AutoAssets", "%{public}@", buf, 0xCu);
            }

            v38 = v8;
            v24 = 0;
          }
        }
        else
        {
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v6, "trialProject");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v55 = "-[UAFAssetSetExperiment initWithConfiguration:uuid:]";
            v56 = 2114;
            v57 = (uint64_t)v46;
            _os_log_error_impl(&dword_229282000, v39, OS_LOG_TYPE_ERROR, "%s Could not create trial client for project %{public}@", buf, 0x16u);

          }
          UAFGetLogCategory((id *)&UAFLogContextClient);
          v40 = objc_claimAutoreleasedReturnValue();
          v24 = v40;
          if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
          {
            v41 = (const char *)*p_uuid;
            *(_DWORD *)buf = 138543362;
            v55 = v41;
            _os_signpost_emit_with_name_impl(&dword_229282000, v24, OS_SIGNPOST_INTERVAL_END, v16, "Experiment AutoAssets", "%{public}@", buf, 0xCu);
          }
          v38 = 0;
        }

        goto LABEL_31;
      }
    }
  }
  v38 = 0;
LABEL_32:

  return v38;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_storeStrong((id *)&self->_experimentId, a3);
}

- (NSDictionary)assetSpecifiers
{
  return self->_assetSpecifiers;
}

- (void)setAssetSpecifiers:(id)a3
{
  objc_storeStrong((id *)&self->_assetSpecifiers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetSpecifiers, 0);
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
