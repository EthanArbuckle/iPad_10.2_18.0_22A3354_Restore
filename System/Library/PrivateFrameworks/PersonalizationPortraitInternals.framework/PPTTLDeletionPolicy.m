@implementation PPTTLDeletionPolicy

- (PPTTLDeletionPolicy)initWithRules:(id)a3 namedEntityStore:(id)a4 topicStore:(id)a5 locationStore:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PPTTLDeletionPolicy *v15;
  PPTTLDeletionPolicy *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PPTTLDeletionPolicy;
  v15 = -[PPTTLDeletionPolicy init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_rules, a3);
    objc_storeStrong((id *)&v16->_namedEntityStore, a4);
    objc_storeStrong((id *)&v16->_topicStore, a5);
    objc_storeStrong((id *)&v16->_locationStore, a6);
  }

  return v16;
}

- (BOOL)applyPolicyWithError:(id *)a3 shouldContinueBlock:(id)a4
{
  unsigned int (**v6)(_QWORD);
  void *v7;
  __int128 v8;
  id v9;
  BOOL v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  _BOOL4 v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  NSObject *v55;
  void *v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  BOOL v61;
  NSObject *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  void *v68;
  BOOL v69;
  NSObject *v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  NSObject *v76;
  void *v77;
  uint64_t v78;
  id *v79;
  __int128 v81;
  id *v82;
  id obj;
  uint64_t v84;
  uint64_t v85;
  unsigned int (**v86)(_QWORD);
  void *context;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t v98[128];
  uint8_t buf[4];
  id v100;
  __int16 v101;
  id v102;
  __int16 v103;
  id v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v6 = (unsigned int (**)(_QWORD))a4;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[NSArray _pas_shuffledArrayUsingRng:](self->_rules, "_pas_shuffledArrayUsingRng:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
  if (!v84)
  {

    v9 = 0;
    v10 = 1;
    goto LABEL_89;
  }
  obj = v7;
  v9 = 0;
  v10 = 1;
  v85 = *(_QWORD *)v95;
  *(_QWORD *)&v8 = 138412546;
  v81 = v8;
  v86 = v6;
  v82 = a3;
  do
  {
    v11 = 0;
    do
    {
      if (*(_QWORD *)v95 != v85)
        objc_enumerationMutation(obj);
      v12 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * v11);
      context = (void *)MEMORY[0x1C3BD6630]();
      if (!v6[2](v6))
      {
        v27 = v9;
LABEL_85:
        objc_autoreleasePoolPop(context);
        v9 = v27;
        v79 = v82;
        goto LABEL_86;
      }
      pp_default_log_handle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v100 = v12;
        _os_log_impl(&dword_1C392E000, v13, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: Performing Named Entity cleanup for rule: %@", buf, 0xCu);
      }

      objc_msgSend(v12, "bundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {

LABEL_12:
        objc_msgSend(v12, "bundleIdentifier", v81);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "groupIdentifier");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "maxAgeSeconds");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "doubleValue");
        v20 = v19;
        v92 = v9;
        v21 = v16;
        v22 = v17;
        if (self)
        {
          v23 = (void *)objc_opt_new();
          objc_msgSend(v23, "dateByAddingTimeInterval:", -v20);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = -[PPLocalNamedEntityStore deleteAllNamedEntitiesFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:](self->_namedEntityStore, "deleteAllNamedEntitiesFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:", v21, v22, v24, 0, &v92);
          if (!v25)
          {
            pp_default_log_handle();
            v26 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v100 = v21;
              v101 = 2112;
              v102 = v22;
              v103 = 2112;
              v104 = v92;
              _os_log_error_impl(&dword_1C392E000, v26, OS_LOG_TYPE_ERROR, "PPMaintenance failed to age-out named entity extractions from %@ with groupId %@: %@", buf, 0x20u);
            }

            v6 = v86;
          }

        }
        else
        {
          v25 = 0;
        }

        v27 = v92;
        if (!v25)
          goto LABEL_80;
        goto LABEL_19;
      }
      objc_msgSend(v12, "groupIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
        goto LABEL_12;
      objc_msgSend(v12, "maxAgeSeconds");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "doubleValue");
      v93 = v9;
      if (self)
      {
        v58 = v57;
        v59 = (void *)objc_opt_new();
        objc_msgSend(v59, "dateByAddingTimeInterval:", -v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue();

        v61 = -[PPLocalNamedEntityStore deleteAllNamedEntitiesOlderThanDate:deletedCount:error:](self->_namedEntityStore, "deleteAllNamedEntitiesOlderThanDate:deletedCount:error:", v60, 0, &v93);
        if (!v61)
        {
          pp_default_log_handle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v81;
            v100 = v60;
            v101 = 2112;
            v102 = v93;
            _os_log_error_impl(&dword_1C392E000, v62, OS_LOG_TYPE_ERROR, "PPMaintenance failed to age-out named entity extractions older than %@: %@", buf, 0x16u);
          }

        }
        v63 = v93;
      }
      else
      {
        v61 = 0;
        v63 = v9;
      }
      v27 = v63;

      if (!v61)
      {
LABEL_80:
        v10 = 0;
        goto LABEL_85;
      }
LABEL_19:
      if (!v6[2](v6))
      {
        v10 = 1;
        goto LABEL_85;
      }
      pp_default_log_handle();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v100 = v12;
        _os_log_impl(&dword_1C392E000, v28, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: Performing Topic cleanup for rule: %@", buf, 0xCu);
      }

      objc_msgSend(v12, "bundleIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (v29)
      {

LABEL_25:
        objc_msgSend(v12, "bundleIdentifier", v81);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "groupIdentifier");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "maxAgeSeconds");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "doubleValue");
        v35 = v34;
        v90 = v27;
        v36 = v31;
        if (self)
        {
          v37 = v32;
          v38 = (void *)objc_opt_new();
          objc_msgSend(v38, "dateByAddingTimeInterval:", -v35);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = -[PPLocalTopicStore deleteAllTopicsFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:](self->_topicStore, "deleteAllTopicsFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:", v36, v37, v39, 0, &v90);
          if (!v40)
          {
            pp_default_log_handle();
            v41 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v81;
              v100 = v36;
              v101 = 2112;
              v102 = v90;
              _os_log_error_impl(&dword_1C392E000, v41, OS_LOG_TYPE_ERROR, "PPMaintenance failed to age-out topic extractions from %@: %@", buf, 0x16u);
            }

          }
        }
        else
        {
          v40 = 0;
        }

        v42 = v90;
        v6 = v86;
        if (!v40)
          goto LABEL_82;
        goto LABEL_32;
      }
      objc_msgSend(v12, "groupIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
        goto LABEL_25;
      objc_msgSend(v12, "maxAgeSeconds");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "doubleValue");
      v91 = v27;
      if (self)
      {
        v66 = v65;
        v67 = (void *)objc_opt_new();
        objc_msgSend(v67, "dateByAddingTimeInterval:", -v66);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        v69 = -[PPLocalTopicStore deleteAllTopicsOlderThanDate:deletedCount:error:](self->_topicStore, "deleteAllTopicsOlderThanDate:deletedCount:error:", v68, 0, &v91);
        if (!v69)
        {
          pp_default_log_handle();
          v70 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v81;
            v100 = v68;
            v101 = 2112;
            v102 = v91;
            _os_log_error_impl(&dword_1C392E000, v70, OS_LOG_TYPE_ERROR, "PPMaintenance failed to age-out topic extractions older than %@: %@", buf, 0x16u);
          }

        }
        v71 = v91;
      }
      else
      {
        v69 = 0;
        v71 = v27;
      }
      v42 = v71;

      if (!v69)
      {
LABEL_82:
        v10 = 0;
LABEL_84:
        v27 = v42;
        goto LABEL_85;
      }
LABEL_32:
      if (!v6[2](v6))
      {
        v10 = 1;
        goto LABEL_84;
      }
      pp_default_log_handle();
      v43 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v100 = v12;
        _os_log_impl(&dword_1C392E000, v43, OS_LOG_TYPE_DEFAULT, "PPMaintenance: TTLBasedDonationCleanup: Performing Location cleanup for rule: %@", buf, 0xCu);
      }

      objc_msgSend(v12, "bundleIdentifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (v44)
      {

LABEL_38:
        objc_msgSend(v12, "bundleIdentifier", v81);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "groupIdentifier");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "maxAgeSeconds");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "doubleValue");
        v50 = v49;
        v88 = v42;
        v51 = v46;
        v52 = v47;
        if (self)
        {
          v53 = (void *)objc_opt_new();
          objc_msgSend(v53, "dateByAddingTimeInterval:", -v50);
          v54 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = -[PPLocalLocationStore deleteAllLocationsFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:](self->_locationStore, "deleteAllLocationsFromSourcesWithBundleId:groupId:olderThan:deletedCount:error:", v51, v52, v54, 0, &v88);
          if (!v10)
          {
            pp_default_log_handle();
            v55 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v100 = v51;
              v101 = 2112;
              v102 = v52;
              v103 = 2112;
              v104 = v88;
              _os_log_error_impl(&dword_1C392E000, v55, OS_LOG_TYPE_ERROR, "PPMaintenance failed to age-out location extractions from %@ with groupId %@: %@", buf, 0x20u);
            }

          }
        }
        else
        {
          v10 = 0;
        }

        v9 = v88;
        v42 = v52;
        goto LABEL_45;
      }
      objc_msgSend(v12, "groupIdentifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
        goto LABEL_38;
      objc_msgSend(v12, "maxAgeSeconds");
      v51 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "doubleValue");
      v89 = v42;
      if (self)
      {
        v73 = v72;
        v74 = (void *)objc_opt_new();
        objc_msgSend(v74, "dateByAddingTimeInterval:", -v73);
        v75 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = -[PPLocalLocationStore deleteAllLocationsOlderThanDate:deletedCount:error:](self->_locationStore, "deleteAllLocationsOlderThanDate:deletedCount:error:", v75, 0, &v89);
        if (!v10)
        {
          pp_default_log_handle();
          v76 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v81;
            v100 = v75;
            v101 = 2112;
            v102 = v89;
            _os_log_error_impl(&dword_1C392E000, v76, OS_LOG_TYPE_ERROR, "PPMaintenance failed to age-out location extractions older than %@: %@", buf, 0x16u);
          }

        }
        v77 = v89;
      }
      else
      {
        v10 = 0;
        v77 = v42;
      }
      v9 = v77;
LABEL_45:

      objc_autoreleasePoolPop(context);
      ++v11;
    }
    while (v84 != v11);
    v78 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v98, 16);
    v79 = v82;
    v84 = v78;
  }
  while (v78);
LABEL_86:

  if (v79 && !v10)
  {
    v9 = objc_retainAutorelease(v9);
    v10 = 0;
    *v79 = v9;
  }
LABEL_89:

  return v10;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPTTLDeletionPolicy rules.count: %tu>"), -[NSArray count](self->_rules, "count"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationStore, 0);
  objc_storeStrong((id *)&self->_topicStore, 0);
  objc_storeStrong((id *)&self->_namedEntityStore, 0);
  objc_storeStrong((id *)&self->_rules, 0);
}

+ (id)defaultPolicy
{
  PPTTLDeletionPolicyRule *v2;
  PPTTLDeletionPolicyRule *v3;
  uint64_t v4;
  uint64_t v5;
  PPTTLDeletionPolicyRule *v6;
  PPTTLDeletionPolicyRule *v7;
  PPTTLDeletionPolicyRule *v8;
  PPTTLDeletionPolicyRule *v9;
  PPTTLDeletionPolicyRule *v10;
  PPTTLDeletionPolicyRule *v11;
  PPTTLDeletionPolicyRule *v12;
  PPTTLDeletionPolicyRule *v13;
  PPTTLDeletionPolicyRule *v14;
  PPTTLDeletionPolicyRule *v15;
  PPTTLDeletionPolicyRule *v16;
  PPTTLDeletionPolicyRule *v17;
  PPTTLDeletionPolicyRule *v18;
  PPTTLDeletionPolicyRule *v19;
  PPTTLDeletionPolicyRule *v20;
  PPTTLDeletionPolicyRule *v21;
  PPTTLDeletionPolicyRule *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  PPTTLDeletionPolicy *v28;
  PPTTLDeletionPolicyRule *v30;
  PPTTLDeletionPolicyRule *v31;
  _QWORD v32[12];

  v32[11] = *MEMORY[0x1E0C80C00];
  v31 = -[PPTTLDeletionPolicyRule initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:]([PPTTLDeletionPolicyRule alloc], "initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:", 0, 0, &unk_1E7E5C088);
  v32[0] = v31;
  v2 = [PPTTLDeletionPolicyRule alloc];
  v30 = -[PPTTLDeletionPolicyRule initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:](v2, "initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:", *MEMORY[0x1E0D70E78], *MEMORY[0x1E0D70EF8], &unk_1E7E5C098);
  v32[1] = v30;
  v3 = [PPTTLDeletionPolicyRule alloc];
  v4 = *MEMORY[0x1E0D70E50];
  v5 = *MEMORY[0x1E0D70EF0];
  v6 = -[PPTTLDeletionPolicyRule initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:](v3, "initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:", *MEMORY[0x1E0D70E50], *MEMORY[0x1E0D70EF0], &unk_1E7E5C0A8);
  v32[2] = v6;
  v7 = [PPTTLDeletionPolicyRule alloc];
  v8 = -[PPTTLDeletionPolicyRule initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:](v7, "initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:", *MEMORY[0x1E0D70DC8], v5, &unk_1E7E5C0A8);
  v32[3] = v8;
  v9 = [PPTTLDeletionPolicyRule alloc];
  v10 = -[PPTTLDeletionPolicyRule initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:](v9, "initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:", v4, *MEMORY[0x1E0D70EE8], &unk_1E7E5C098);
  v32[4] = v10;
  v11 = [PPTTLDeletionPolicyRule alloc];
  v12 = -[PPTTLDeletionPolicyRule initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:](v11, "initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:", *MEMORY[0x1E0D70E48], 0, &unk_1E7E5C098);
  v32[5] = v12;
  v13 = [PPTTLDeletionPolicyRule alloc];
  v14 = -[PPTTLDeletionPolicyRule initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:](v13, "initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:", *MEMORY[0x1E0D70E58], 0, &unk_1E7E5C098);
  v32[6] = v14;
  v15 = [PPTTLDeletionPolicyRule alloc];
  v16 = -[PPTTLDeletionPolicyRule initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:](v15, "initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:", CFSTR("PortraitBundleIdWildCardMatchingAll"), *MEMORY[0x1E0D70ED0], &unk_1E7E5C098);
  v32[7] = v16;
  v17 = [PPTTLDeletionPolicyRule alloc];
  v18 = -[PPTTLDeletionPolicyRule initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:](v17, "initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:", CFSTR("PortraitBundleIdWildCardMatchingAll"), *MEMORY[0x1E0D70ED8], &unk_1E7E5C098);
  v32[8] = v18;
  v19 = [PPTTLDeletionPolicyRule alloc];
  v20 = -[PPTTLDeletionPolicyRule initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:](v19, "initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:", *MEMORY[0x1E0D70DE8], *MEMORY[0x1E0D70EB8], &unk_1E7E5C098);
  v32[9] = v20;
  v21 = [PPTTLDeletionPolicyRule alloc];
  v22 = -[PPTTLDeletionPolicyRule initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:](v21, "initWithBundleIdentifier:groupIdentifier:maxAgeSeconds:", *MEMORY[0x1E0D70E20], 0, &unk_1E7E5C098);
  v32[10] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 11);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  +[PPLocalNamedEntityStore defaultStore](PPLocalNamedEntityStore, "defaultStore");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPLocalTopicStore defaultStore](PPLocalTopicStore, "defaultStore");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[PPLocalLocationStore defaultStore](PPLocalLocationStore, "defaultStore");
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = (void *)v26;
  v28 = 0;
  if (v24 && v25 && v26)
    v28 = -[PPTTLDeletionPolicy initWithRules:namedEntityStore:topicStore:locationStore:]([PPTTLDeletionPolicy alloc], "initWithRules:namedEntityStore:topicStore:locationStore:", v23, v24, v25, v26);

  return v28;
}

@end
