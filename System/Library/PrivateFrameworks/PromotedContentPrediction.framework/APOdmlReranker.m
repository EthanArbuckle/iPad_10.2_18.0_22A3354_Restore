@implementation APOdmlReranker

- (APOdmlReranker)init
{
  return (APOdmlReranker *)MEMORY[0x1E0DE7D20](self, sel_initWithPersonalizedAdsEnabled_placementType_, 1);
}

- (APOdmlReranker)initWithPersonalizedAdsEnabled:(BOOL)a3 placementType:(unint64_t)a4
{
  _BOOL8 v5;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  APOdmlReranker *v11;

  v5 = a3;
  objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetManagerForPlacementType_assetManagerType_(v7, v8, a4, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (APOdmlReranker *)objc_msgSend_initWithPersonalizedAdsEnabled_assetManager_placementType_(self, v10, v5, v9, a4);
  return v11;
}

- (APOdmlReranker)initWithPersonalizedAdsEnabled:(BOOL)a3 assetManager:(id)a4 placementType:(unint64_t)a5
{
  id v9;
  APOdmlReranker *v10;
  APOdmlReranker *v11;
  APOdmlUnfairLock *v12;
  const char *v13;
  uint64_t v14;
  APOdmlUnfairLock *rerankResponseLock;
  NSObject *v16;
  dispatch_group_t v17;
  OS_dispatch_group *rerankDispatchGroup;
  objc_super v20;

  v9 = a4;
  v20.receiver = self;
  v20.super_class = (Class)APOdmlReranker;
  v10 = -[APOdmlReranker init](&v20, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_isPersonalizedAdsEnabled = a3;
    objc_storeStrong((id *)&v10->_assetManager, a4);
    v12 = [APOdmlUnfairLock alloc];
    v14 = objc_msgSend_initWithOptions_(v12, v13, 1);
    rerankResponseLock = v11->_rerankResponseLock;
    v11->_rerankResponseLock = (APOdmlUnfairLock *)v14;

    OdmlLogForCategory(5uLL);
    v16 = objc_claimAutoreleasedReturnValue();
    v11->_ident = os_signpost_id_generate(v16);

    v11->_placementType = a5;
    v17 = dispatch_group_create();
    rerankDispatchGroup = v11->_rerankDispatchGroup;
    v11->_rerankDispatchGroup = (OS_dispatch_group *)v17;

  }
  return v11;
}

- (void)setAndRerankAds:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  os_signpost_id_t v9;
  NSObject *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  os_signpost_id_t v14;
  NSObject *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  os_signpost_id_t v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  _QWORD v27[5];
  id v28;
  uint8_t buf[16];

  v4 = a3;
  OdmlLogForCategory(5uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_ident(self, v6, v7);
  if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Head start", (const char *)&unk_1B6A07EB5, buf, 2u);
    }
  }

  OdmlLogForCategory(5uLL);
  v10 = objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend_ident(self, v11, v12);
  if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = v13;
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v14, "GCD Overhead", (const char *)&unk_1B6A07EB5, buf, 2u);
    }
  }

  OdmlLogForCategory(5uLL);
  v15 = objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend_ident(self, v16, v17);
  if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v19 = v18;
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v19, "Overall reranking", (const char *)&unk_1B6A07EB5, buf, 2u);
    }
  }

  objc_msgSend_rerankDispatchGroup(self, v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_rerankSerialQueue(APOdmlReranker, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = sub_1B69FB550;
  v27[3] = &unk_1E6A29610;
  v27[4] = self;
  v28 = v4;
  v26 = v4;
  dispatch_group_async(v22, v25, v27);

}

- (void)getRerankedAdsWithTimeLimit:(double)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  os_signpost_id_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  NSObject *v22;
  const char *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  NSObject *v29;
  _QWORD v30[6];
  _QWORD block[5];
  uint8_t buf[16];

  v6 = a4;
  OdmlLogForCategory(5uLL);
  v7 = objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend_ident(self, v8, v9);
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v7, OS_SIGNPOST_INTERVAL_END, v11, "Head start", (const char *)&unk_1B6A07EB5, buf, 2u);
    }
  }

  objc_msgSend_rerankResponseLock(self, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v14, v15, v16);
  objc_msgSend_setRerankResponse_(self, v17, (uint64_t)v6);

  objc_msgSend_unlock(v14, v18, v19);
  objc_msgSend_rerankDispatchGroup(self, v20, v21);
  v22 = objc_claimAutoreleasedReturnValue();
  objc_msgSend_rerankSerialQueue(APOdmlReranker, v23, v24);
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1B69FBA4C;
  block[3] = &unk_1E6A29570;
  block[4] = self;
  dispatch_group_async(v22, v25, block);

  objc_msgSend_rerankResponseTimeoutQueue(APOdmlReranker, v27, v28);
  v29 = objc_claimAutoreleasedReturnValue();
  v30[0] = v26;
  v30[1] = 3221225472;
  v30[2] = sub_1B69FBCC8;
  v30[3] = &unk_1E6A29E50;
  v30[4] = self;
  *(double *)&v30[5] = a3;
  dispatch_async(v29, v30);

}

- (id)predictAndExplore:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  os_signpost_id_t v9;
  const char *v10;
  uint64_t v11;
  APOdmlPredictor *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v34;
  const char *v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  os_signpost_id_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  APOdmlExplorer *v43;
  const char *v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  const char *v55;
  uint64_t *v56;
  void *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  int v66;
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  __int16 v70;
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  OdmlLogForCategory(5uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_ident(self, v6, v7);
  if ((unint64_t)(v8 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v9 = v8;
    if (os_signpost_enabled(v5))
    {
      v66 = 134283521;
      v67 = objc_msgSend_count(v4, v10, v11);
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v9, "Aggregated PTTR Prediction", "%{private}lu", (uint8_t *)&v66, 0xCu);
    }
  }

  v12 = [APOdmlPredictor alloc];
  objc_msgSend_assetManager(self, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_assetManager(self, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_currentMLModel(v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend_initWithResponses_assetManager_model_(v12, v22, (uint64_t)v4, v15, v21);

  objc_msgSend_predictTapThroughRate(v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v26;
  if (!v26)
  {
    OdmlLogForCategory(5uLL);
    v52 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = (void *)objc_opt_class();
      v66 = 138412546;
      v67 = (uint64_t)v53;
      v68 = 2112;
      v69 = 0;
      v54 = v53;
      _os_log_impl(&dword_1B69D6000, v52, OS_LOG_TYPE_ERROR, "[%@] Reranking Error: pttrArray %@ is empty or nil.", (uint8_t *)&v66, 0x16u);

    }
    v56 = &kAPOdmlRerankingPttrArrayNil;
    goto LABEL_16;
  }
  v30 = objc_msgSend_count(v26, v27, v28);
  v33 = objc_msgSend_count(v4, v31, v32);
  OdmlLogForCategory(5uLL);
  v34 = objc_claimAutoreleasedReturnValue();
  v37 = v34;
  if (v30 != v33)
  {
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      v57 = (void *)objc_opt_class();
      v58 = v57;
      v61 = objc_msgSend_count(v29, v59, v60);
      v64 = objc_msgSend_count(v4, v62, v63);
      v66 = 138412802;
      v67 = (uint64_t)v57;
      v68 = 2048;
      v69 = v61;
      v70 = 2048;
      v71 = v64;
      _os_log_impl(&dword_1B69D6000, v37, OS_LOG_TYPE_ERROR, "[%@] Reranking Error: pttrArray count %lu does not match rankableObjects count %lu.", (uint8_t *)&v66, 0x20u);

    }
    v56 = &kAPOdmlRerankingPttrArrayCountMismatch;
LABEL_16:
    objc_msgSend__handleError_(self, v55, *v56);
    v51 = 0;
    goto LABEL_17;
  }
  v38 = objc_msgSend_ident(self, v35, v36);
  if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v39 = v38;
    if (os_signpost_enabled(v37))
    {
      v42 = objc_msgSend_count(v4, v40, v41);
      v66 = 134283521;
      v67 = v42;
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v37, OS_SIGNPOST_INTERVAL_END, v39, "Aggregated PTTR Prediction", "%{private}lu", (uint8_t *)&v66, 0xCu);
    }
  }

  v43 = [APOdmlExplorer alloc];
  objc_msgSend_assetManager(self, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend_initWithRankableObjects_pttrArray_assetManager_(v43, v47, (uint64_t)v4, v29, v46);

  objc_msgSend_explore(v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v51;
}

- (BOOL)sendRerankResponseIfAvailable:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  os_signpost_id_t v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  void (**v34)(_QWORD, _QWORD, _QWORD);
  const char *v35;
  NSObject *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  unint64_t v43;
  const char *v44;
  uint64_t v45;
  unint64_t v46;
  const char *v47;
  double v48;
  const char *v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  void *v65;
  const char *v66;
  NSObject *v67;
  const char *v68;
  uint64_t v69;
  id v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  void *v84;
  const char *v85;
  NSObject *v86;
  NSObject *v87;
  const char *v88;
  uint64_t v89;
  double v90;
  NSObject *v91;
  NSObject *v92;
  void *v94;
  void *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  uint8_t v105[128];
  uint8_t buf[4];
  double v107;
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  OdmlLogForCategory(5uLL);
  v8 = objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_ident(self, v9, v10);
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v12 = v11;
    if (os_signpost_enabled(v8))
    {
      *(_DWORD *)buf = 134283521;
      v107 = COERCE_DOUBLE(objc_msgSend_count(v6, v13, v14));
      _os_signpost_emit_with_name_impl(&dword_1B69D6000, v8, OS_SIGNPOST_INTERVAL_END, v12, "Overall reranking", "%{private}lu", buf, 0xCu);
    }
  }

  objc_msgSend_rerankResponseLock(self, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lock(v17, v18, v19);
  objc_msgSend_rerankResponse(self, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend_now(MEMORY[0x1E0C99D68], v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_rerankingStartDate(self, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_timeIntervalSinceDate_(v25, v29, (uint64_t)v28);
    v31 = v30;

    objc_msgSend_rerankResponse(self, v32, v33);
    v34 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v94 = v7;
    ((void (**)(_QWORD, id, id))v34)[2](v34, v6, v7);

    objc_msgSend_setRerankResponse_(self, v35, 0);
    OdmlLogForCategory(5uLL);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B69D6000, v36, OS_LOG_TYPE_DEFAULT, "========== Reranking Summary ==========", buf, 2u);
    }

    v37 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend_originalAds(self, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = objc_msgSend_count(v40, v41, v42);

    v95 = v6;
    v46 = objc_msgSend_count(v6, v44, v45);
    if (v43 <= v46)
      objc_msgSend_arrayWithCapacity_(v37, v47, v46);
    else
      objc_msgSend_arrayWithCapacity_(v37, v47, v43);
    v48 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    objc_msgSend_originalAds(self, v49, v50);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v52, (uint64_t)&v100, v105, 16);
    if (v53)
    {
      v56 = v53;
      v57 = *(_QWORD *)v101;
      do
      {
        v58 = 0;
        do
        {
          if (*(_QWORD *)v101 != v57)
            objc_enumerationMutation(v51);
          v59 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend_adamID(*(void **)(*((_QWORD *)&v100 + 1) + 8 * v58), v54, v55);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v63 = objc_msgSend_intValue(v60, v61, v62);
          objc_msgSend_numberWithInt_(v59, v64, v63);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(*(void **)&v48, v66, (uint64_t)v65);

          ++v58;
        }
        while (v56 != v58);
        v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(v51, v54, (uint64_t)&v100, v105, 16);
      }
      while (v56);
    }

    OdmlLogForCategory(5uLL);
    v67 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v107 = v48;
      _os_log_impl(&dword_1B69D6000, v67, OS_LOG_TYPE_DEFAULT, "Original order: %@", buf, 0xCu);
    }

    objc_msgSend_removeAllObjects(*(void **)&v48, v68, v69);
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v70 = v95;
    v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v71, (uint64_t)&v96, v104, 16);
    if (v72)
    {
      v75 = v72;
      v76 = *(_QWORD *)v97;
      do
      {
        v77 = 0;
        do
        {
          if (*(_QWORD *)v97 != v76)
            objc_enumerationMutation(v70);
          v78 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend_adamID(*(void **)(*((_QWORD *)&v96 + 1) + 8 * v77), v73, v74);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = objc_msgSend_intValue(v79, v80, v81);
          objc_msgSend_numberWithInt_(v78, v83, v82);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(*(void **)&v48, v85, (uint64_t)v84);

          ++v77;
        }
        while (v75 != v77);
        v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v73, (uint64_t)&v96, v104, 16);
      }
      while (v75);
    }

    OdmlLogForCategory(5uLL);
    v86 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v107 = v48;
      _os_log_impl(&dword_1B69D6000, v86, OS_LOG_TYPE_DEFAULT, "Reranked order: %@", buf, 0xCu);
    }

    OdmlLogForCategory(5uLL);
    v87 = objc_claimAutoreleasedReturnValue();
    v7 = v94;
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_description(v94, v88, v89);
      v90 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138412290;
      v107 = v90;
      _os_log_impl(&dword_1B69D6000, v87, OS_LOG_TYPE_DEFAULT, "Reranking Error %@", buf, 0xCu);

    }
    OdmlLogForCategory(5uLL);
    v91 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v107 = v31 * 1000.0;
      _os_log_impl(&dword_1B69D6000, v91, OS_LOG_TYPE_DEFAULT, "Reranking Duration %f ms", buf, 0xCu);
    }

    OdmlLogForCategory(5uLL);
    v92 = objc_claimAutoreleasedReturnValue();
    v6 = v95;
    if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B69D6000, v92, OS_LOG_TYPE_DEFAULT, "=======================================", buf, 2u);
    }

  }
  objc_msgSend_unlock(v17, v23, v24);

  return v22 != 0;
}

- (void)rerankResponseTimeout
{
  objc_msgSend__handleError_(self, a2, 2001);
}

- (void)_handleError:(int64_t)a3
{
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  int v14;
  NSObject *v15;
  id v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  int v24;
  id v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E0CB35C8], a2, (uint64_t)CFSTR("APOdmlRerankingErrorDomain"), a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setRerankerError_(self, v6, (uint64_t)v5);

  objc_msgSend_rerankerError(self, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_originalAds(self, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_sendRerankResponseIfAvailable_error_(self, v13, (uint64_t)v12, v9);

  if (v14)
  {
    OdmlLogForCategory(5uLL);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v24 = 138412546;
      v25 = (id)objc_opt_class();
      v26 = 2048;
      v27 = a3;
      v16 = v25;
      _os_log_impl(&dword_1B69D6000, v15, OS_LOG_TYPE_ERROR, "[%@] Reranking Error: %ld.", (uint8_t *)&v24, 0x16u);

    }
    objc_msgSend_rerankingStartDate(self, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_date(MEMORY[0x1E0C99D68], v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v23, (uint64_t)v9, 0, 0, v19, v22);

  }
}

+ (OS_dispatch_queue)rerankSerialQueue
{
  if (qword_1ED532E98 != -1)
    dispatch_once(&qword_1ED532E98, &unk_1E6A29E70);
  return (OS_dispatch_queue *)(id)qword_1ED532E90;
}

+ (OS_dispatch_queue)rerankResponseTimeoutQueue
{
  if (qword_1ED532E80 != -1)
    dispatch_once(&qword_1ED532E80, &unk_1E6A29E90);
  return (OS_dispatch_queue *)(id)qword_1ED532E88;
}

- (id)rerankResponse
{
  return self->_rerankResponse;
}

- (void)setRerankResponse:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)originalAds
{
  return self->_originalAds;
}

- (void)setOriginalAds:(id)a3
{
  objc_storeStrong((id *)&self->_originalAds, a3);
}

- (NSArray)rerankedAds
{
  return self->_rerankedAds;
}

- (void)setRerankedAds:(id)a3
{
  objc_storeStrong((id *)&self->_rerankedAds, a3);
}

- (NSError)rerankerError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRerankerError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSDate)rerankingStartDate
{
  return self->_rerankingStartDate;
}

- (void)setRerankingStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_rerankingStartDate, a3);
}

- (APOdmlAssetManager)assetManager
{
  return self->_assetManager;
}

- (void)setAssetManager:(id)a3
{
  objc_storeStrong((id *)&self->_assetManager, a3);
}

- (APOdmlUnfairLock)rerankResponseLock
{
  return self->_rerankResponseLock;
}

- (void)setRerankResponseLock:(id)a3
{
  objc_storeStrong((id *)&self->_rerankResponseLock, a3);
}

- (unint64_t)ident
{
  return self->_ident;
}

- (BOOL)isPersonalizedAdsEnabled
{
  return self->_isPersonalizedAdsEnabled;
}

- (OS_dispatch_group)rerankDispatchGroup
{
  return (OS_dispatch_group *)objc_getProperty(self, a2, 80, 1);
}

- (unint64_t)placementType
{
  return self->_placementType;
}

- (void)setPlacementType:(unint64_t)a3
{
  self->_placementType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rerankDispatchGroup, 0);
  objc_storeStrong((id *)&self->_rerankResponseLock, 0);
  objc_storeStrong((id *)&self->_assetManager, 0);
  objc_storeStrong((id *)&self->_rerankingStartDate, 0);
  objc_storeStrong((id *)&self->_rerankerError, 0);
  objc_storeStrong((id *)&self->_rerankedAds, 0);
  objc_storeStrong((id *)&self->_originalAds, 0);
  objc_storeStrong(&self->_rerankResponse, 0);
}

@end
