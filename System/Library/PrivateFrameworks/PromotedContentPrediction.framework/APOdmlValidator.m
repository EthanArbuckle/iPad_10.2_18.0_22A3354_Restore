@implementation APOdmlValidator

+ (int64_t)permissionCheck:(id)a3 personalizedAdsEnabled:(BOOL)a4 trialKillswitch:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  int64_t *v25;
  NSObject *v26;
  void *v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  int64_t v34;
  const char *v36;
  int v37;
  const char *v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  char v52;
  const char *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  id v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  char isAllowed;
  NSObject *v64;
  void *v65;
  id v66;
  NSObject *v67;
  NSObject *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  NSObject *v72;
  void *v73;
  id v74;
  NSObject *v75;
  NSObject *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  int64_t *v80;
  NSObject *v81;
  void *v82;
  id v83;
  NSObject *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  void *v89;
  id v90;
  const char *v91;
  uint64_t v92;
  void *v93;
  NSObject *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  os_signpost_id_t spid;
  id v99;
  id obj;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint8_t buf[4];
  uint64_t v106;
  __int16 v107;
  void *v108;
  _BYTE v109[128];
  uint64_t v110;

  v5 = a5;
  v110 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  OdmlLogForCategory(5uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);

  OdmlLogForCategory(5uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134283521;
    v106 = objc_msgSend_count(v7, v13, v14);
    _os_signpost_emit_with_name_impl(&dword_1B69D6000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Permission Check", "%{private}lu", buf, 0xCu);
  }

  if (!a4)
  {
    OdmlLogForCategory(5uLL);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v106 = (uint64_t)v27;
      v28 = v27;
      _os_log_impl(&dword_1B69D6000, v26, OS_LOG_TYPE_DEFAULT, "[%@] Cannot rerank if Personalized Ads is disabled.", buf, 0xCu);

    }
    OdmlLogForCategory(5uLL);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      v33 = objc_msgSend_count(v7, v31, v32);
      *(_DWORD *)buf = 134283521;
      v106 = v33;
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v30, OS_SIGNPOST_INTERVAL_END, v9, "Permission Check", "%{private}lu", buf, 0xCu);
    }

    v25 = &kAPOdmlPersonalizedAdsDisabled;
    goto LABEL_18;
  }
  if (v5)
  {
    OdmlLogForCategory(5uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v106 = (uint64_t)v18;
      v19 = v18;
      _os_log_impl(&dword_1B69D6000, v17, OS_LOG_TYPE_DEFAULT, "[%@] Reranking is disabled on Trial.", buf, 0xCu);

    }
    OdmlLogForCategory(5uLL);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      v24 = objc_msgSend_count(v7, v22, v23);
      *(_DWORD *)buf = 134283521;
      v106 = v24;
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v21, OS_SIGNPOST_INTERVAL_END, v9, "Permission Check", "%{private}lu", buf, 0xCu);
    }

    v25 = &kAPOdmlRerankingDisabledWithTrial;
    goto LABEL_18;
  }
  if (objc_msgSend_isInternalInstall(MEMORY[0x1E0CB3898], v15, v16))
    v37 = objc_msgSend_BOOLForKey_(APOdmlDefaults, v36, (uint64_t)CFSTR("ODMLAllowListDisabled"));
  else
    v37 = 0;
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v7;
  v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v38, (uint64_t)&v101, v109, 16);
  if (!v39)
    goto LABEL_37;
  v42 = v39;
  v43 = *(_QWORD *)v102;
  spid = v9;
  v99 = v7;
  while (2)
  {
    for (i = 0; i != v42; ++i)
    {
      if (*(_QWORD *)v102 != v43)
        objc_enumerationMutation(obj);
      v45 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
      objc_msgSend_odmlResponse(v45, v40, v41, spid);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v46)
      {
        OdmlLogForCategory(5uLL);
        v72 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          v73 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v106 = (uint64_t)v73;
          v74 = v73;
          _os_log_impl(&dword_1B69D6000, v72, OS_LOG_TYPE_DEFAULT, "[%@] ODML Response not found.", buf, 0xCu);

        }
        OdmlLogForCategory(5uLL);
        v75 = objc_claimAutoreleasedReturnValue();
        v76 = v75;
        v7 = v99;
        if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
        {
          v79 = objc_msgSend_count(obj, v77, v78);
          *(_DWORD *)buf = 134283521;
          v106 = v79;
          _os_signpost_emit_with_name_impl(&dword_1B69D6000, v76, OS_SIGNPOST_INTERVAL_END, spid, "Permission Check", "%{private}lu", buf, 0xCu);
        }
        v80 = &kAPOdmlRerankingResponseNotFound;
        goto LABEL_61;
      }
      objc_msgSend_odmlResponse(v45, v47, v48);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = objc_msgSend_odmlEnabled(v49, v50, v51);

      if ((v52 & 1) == 0)
      {
        OdmlLogForCategory(5uLL);
        v81 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          v82 = (void *)objc_opt_class();
          *(_DWORD *)buf = 138412290;
          v106 = (uint64_t)v82;
          v83 = v82;
          _os_log_impl(&dword_1B69D6000, v81, OS_LOG_TYPE_DEFAULT, "[%@] Reranking is disabled on the server.", buf, 0xCu);

        }
        OdmlLogForCategory(5uLL);
        v84 = objc_claimAutoreleasedReturnValue();
        v76 = v84;
        v7 = v99;
        if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v84))
        {
          v87 = objc_msgSend_count(obj, v85, v86);
          *(_DWORD *)buf = 134283521;
          v106 = v87;
          _os_signpost_emit_with_name_impl(&dword_1B69D6000, v76, OS_SIGNPOST_INTERVAL_END, spid, "Permission Check", "%{private}lu", buf, 0xCu);
        }
        v80 = &kAPOdmlRerankingDisabledWithServer;
        goto LABEL_61;
      }
      if (!v37)
      {
        objc_msgSend_sharedInstance(APOdmlAllowList, v53, v54);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_adamID(v45, v59, v60);
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        isAllowed = objc_msgSend_isAllowed_(v58, v62, (uint64_t)v61);

        if ((isAllowed & 1) != 0)
          continue;
        OdmlLogForCategory(5uLL);
        v88 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
        {
          v89 = (void *)objc_opt_class();
          v90 = v89;
          objc_msgSend_adamID(v45, v91, v92);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v106 = (uint64_t)v89;
          v107 = 2112;
          v108 = v93;
          _os_log_impl(&dword_1B69D6000, v88, OS_LOG_TYPE_DEFAULT, "[%@] Allowlist doesn't include %@.", buf, 0x16u);

        }
        OdmlLogForCategory(5uLL);
        v94 = objc_claimAutoreleasedReturnValue();
        v76 = v94;
        v7 = v99;
        if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v94))
        {
          v97 = objc_msgSend_count(obj, v95, v96);
          *(_DWORD *)buf = 134283521;
          v106 = v97;
          _os_signpost_emit_with_name_impl(&dword_1B69D6000, v76, OS_SIGNPOST_INTERVAL_END, spid, "Permission Check", "%{private}lu", buf, 0xCu);
        }
        v80 = &kAPOdmlRerankingNotPermittedErrorCode;
LABEL_61:

        v34 = *v80;
        goto LABEL_19;
      }
      OdmlLogForCategory(5uLL);
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        v56 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138412290;
        v106 = (uint64_t)v56;
        v57 = v56;
        _os_log_impl(&dword_1B69D6000, v55, OS_LOG_TYPE_DEFAULT, "[%@] Allowlist is disabled and thus allowlist check will be bypassed.", buf, 0xCu);

      }
    }
    v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v101, v109, 16);
    v9 = spid;
    v7 = v99;
    if (v42)
      continue;
    break;
  }
LABEL_37:

  OdmlLogForCategory(5uLL);
  v64 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    v65 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138412290;
    v106 = (uint64_t)v65;
    v66 = v65;
    _os_log_impl(&dword_1B69D6000, v64, OS_LOG_TYPE_DEFAULT, "[%@] Reranking permission is granted. Reranking will start soon.", buf, 0xCu);

  }
  OdmlLogForCategory(5uLL);
  v67 = objc_claimAutoreleasedReturnValue();
  v68 = v67;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v67))
  {
    v71 = objc_msgSend_count(obj, v69, v70);
    *(_DWORD *)buf = 134283521;
    v106 = v71;
    _os_signpost_emit_with_name_impl(&dword_1B69D6000, v68, OS_SIGNPOST_INTERVAL_END, v9, "Permission Check", "%{private}lu", buf, 0xCu);
  }

  v25 = &kAPOdmlRerankingPermitted;
LABEL_18:
  v34 = *v25;
LABEL_19:

  return v34;
}

@end
