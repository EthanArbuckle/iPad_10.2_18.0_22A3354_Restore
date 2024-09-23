@implementation PGRelatedComputer

- (PGRelatedComputer)initWithWorkingContext:(id)a3 blockedFeatures:(id)a4
{
  id v7;
  id v8;
  PGRelatedComputer *v9;
  PGRelatedComputer *v10;
  uint64_t v11;
  OS_os_log *loggingConnection;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGRelatedComputer;
  v9 = -[PGRelatedComputer init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workingContext, a3);
    objc_storeStrong((id *)&v10->_blockedFeatures, a4);
    objc_msgSend(v7, "loggingConnection");
    v11 = objc_claimAutoreleasedReturnValue();
    loggingConnection = v10->_loggingConnection;
    v10->_loggingConnection = (OS_os_log *)v11;

  }
  return v10;
}

- (id)relatedCollectionsForAsset:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  OS_os_log *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  PGManagerWorkingContext *workingContext;
  os_signpost_id_t v18;
  unint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  uint32_t denom;
  uint32_t numer;
  NSObject *v25;
  NSObject *v26;
  id v27;
  void *v28;
  void *v29;
  NSObject *v30;
  const char *v32;
  id v33;
  uint64_t v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  PGRelatedComputer *v40;
  __int128 *v41;
  uint8_t *v42;
  unint64_t v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  mach_timebase_info info;
  uint8_t v51[4];
  const char *v52;
  __int16 v53;
  double v54;
  __int128 v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (v10)
  {
    v12 = self->_loggingConnection;
    v13 = os_signpost_id_generate((os_log_t)v12);
    v14 = v12;
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RelatedForAsset", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v34 = mach_absolute_time();
    *(_QWORD *)buf = 0;
    v45 = buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__64889;
    v48 = __Block_byref_object_dispose__64890;
    v49 = 0;
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v10, 3, 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v35, "count") == 1)
    {
      *(_QWORD *)&v55 = 0;
      *((_QWORD *)&v55 + 1) = &v55;
      v56 = 0x3032000000;
      v57 = __Block_byref_object_copy__64889;
      v58 = __Block_byref_object_dispose__64890;
      v59 = 0;
      objc_msgSend(v35, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      workingContext = self->_workingContext;
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __74__PGRelatedComputer_relatedCollectionsForAsset_relatedType_options_error___block_invoke;
      v36[3] = &unk_1E8435160;
      v41 = &v55;
      v33 = v16;
      v37 = v33;
      v38 = v10;
      v39 = v11;
      v40 = self;
      v42 = buf;
      v43 = a4;
      -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v36);
      v18 = v13;
      v19 = v13 - 1;
      if (*(_QWORD *)(*((_QWORD *)&v55 + 1) + 40))
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "loggingConnection");
        v21 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v32 = *(const char **)(*((_QWORD *)&v55 + 1) + 40);
          *(_DWORD *)v51 = 138412290;
          v52 = v32;
          _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "Error occured: %@", v51, 0xCu);
        }

        if (a6)
          *a6 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v55 + 1) + 40));
      }
      v22 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v25 = v15;
      v26 = v25;
      if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
      {
        *(_WORD *)v51 = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v26, OS_SIGNPOST_INTERVAL_END, v18, "RelatedForAsset", ", v51, 2u);
      }

      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v51 = 136315394;
        v52 = "RelatedForAsset";
        v53 = 2048;
        v54 = (float)((float)((float)((float)(v22 - v34) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v51, 0x16u);
      }
      v27 = *((id *)v45 + 5);

      _Block_object_dispose(&v55, 8);
    }
    else
    {
      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot find asset collection for inAsset %@"), v10);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -3, v28);
        *a6 = (id)objc_claimAutoreleasedReturnValue();

      }
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "loggingConnection");
      v30 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        LODWORD(v55) = 138412290;
        *(_QWORD *)((char *)&v55 + 4) = v10;
        _os_log_error_impl(&dword_1CA237000, v30, OS_LOG_TYPE_ERROR, "Cannot find asset collection for inAsset %@", (uint8_t *)&v55, 0xCu);
      }

      v27 = 0;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (id)relatedCollectionsForMoment:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  return -[PGRelatedComputer relatedCollectionsForMoment:relatedType:options:generateTitles:error:](self, "relatedCollectionsForMoment:relatedType:options:generateTitles:error:", a3, a4, a5, 1, a6);
}

- (id)relatedCollectionsForMoment:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 generateTitles:(BOOL)a6 error:(id *)a7
{
  id v12;
  id v13;
  OS_os_log *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  PGManagerWorkingContext *workingContext;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint32_t denom;
  uint32_t numer;
  NSObject *v24;
  NSObject *v25;
  id v26;
  const char *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  PGRelatedComputer *v33;
  uint64_t *v34;
  uint8_t *v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  mach_timebase_info info;
  uint8_t v51[4];
  const char *v52;
  __int16 v53;
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  if (v12)
  {
    v14 = self->_loggingConnection;
    v15 = os_signpost_id_generate((os_log_t)v14);
    v16 = v14;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RelatedForMoment", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v29 = mach_absolute_time();
    *(_QWORD *)buf = 0;
    v45 = buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__64889;
    v48 = __Block_byref_object_dispose__64890;
    v49 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__64889;
    v42 = __Block_byref_object_dispose__64890;
    v43 = 0;
    workingContext = self->_workingContext;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __90__PGRelatedComputer_relatedCollectionsForMoment_relatedType_options_generateTitles_error___block_invoke;
    v30[3] = &unk_1E8435188;
    v34 = &v38;
    v31 = v12;
    v36 = a4;
    v35 = buf;
    v32 = v13;
    v33 = self;
    v37 = a6;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v30);
    if (v39[5])
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "loggingConnection");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v28 = (const char *)v39[5];
        *(_DWORD *)v51 = 138412290;
        v52 = v28;
        _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "Error occured: %@", v51, 0xCu);
      }

      if (a7)
        *a7 = objc_retainAutorelease((id)v39[5]);
    }
    v21 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v24 = v17;
    v25 = v24;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)v51 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v25, OS_SIGNPOST_INTERVAL_END, v15, "RelatedForMoment", ", v51, 2u);
    }

    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v51 = 136315394;
      v52 = "RelatedForMoment";
      v53 = 2048;
      v54 = (float)((float)((float)((float)(v21 - v29) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v51, 0x16u);
    }
    v26 = *((id *)v45 + 5);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)relatedCollectionsForHighlight:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 generateTitles:(BOOL)a6 error:(id *)a7
{
  id v12;
  id v13;
  OS_os_log *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  PGManagerWorkingContext *workingContext;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint32_t denom;
  uint32_t numer;
  NSObject *v24;
  NSObject *v25;
  id v26;
  const char *v28;
  uint64_t v29;
  _QWORD v30[4];
  id v31;
  id v32;
  PGRelatedComputer *v33;
  uint64_t *v34;
  uint8_t *v35;
  unint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  mach_timebase_info info;
  uint8_t v51[4];
  const char *v52;
  __int16 v53;
  double v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  if (v12)
  {
    v14 = self->_loggingConnection;
    v15 = os_signpost_id_generate((os_log_t)v14);
    v16 = v14;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RelatedForHighlight", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v29 = mach_absolute_time();
    *(_QWORD *)buf = 0;
    v45 = buf;
    v46 = 0x3032000000;
    v47 = __Block_byref_object_copy__64889;
    v48 = __Block_byref_object_dispose__64890;
    v49 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3032000000;
    v41 = __Block_byref_object_copy__64889;
    v42 = __Block_byref_object_dispose__64890;
    v43 = 0;
    workingContext = self->_workingContext;
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __93__PGRelatedComputer_relatedCollectionsForHighlight_relatedType_options_generateTitles_error___block_invoke;
    v30[3] = &unk_1E8435188;
    v34 = &v38;
    v31 = v12;
    v36 = a4;
    v35 = buf;
    v32 = v13;
    v33 = self;
    v37 = a6;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v30);
    if (v39[5])
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "loggingConnection");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v28 = (const char *)v39[5];
        *(_DWORD *)v51 = 138412290;
        v52 = v28;
        _os_log_error_impl(&dword_1CA237000, v20, OS_LOG_TYPE_ERROR, "Error occured: %@", v51, 0xCu);
      }

      if (a7)
        *a7 = objc_retainAutorelease((id)v39[5]);
    }
    v21 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v24 = v17;
    v25 = v24;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)v51 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v25, OS_SIGNPOST_INTERVAL_END, v15, "RelatedForHighlight", ", v51, 2u);
    }

    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v51 = 136315394;
      v52 = "RelatedForHighlight";
      v53 = 2048;
      v54 = (float)((float)((float)((float)(v21 - v29) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v51, 0x16u);
    }
    v26 = *((id *)v45 + 5);

    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v26 = 0;
  }

  return v26;
}

- (id)relatedCollectionsForAssetCollection:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 curationContext:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  OS_os_log *v13;
  id v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  PGManagerWorkingContext *workingContext;
  id v24;
  uint64_t v25;
  uint32_t denom;
  uint32_t numer;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  id v31;
  _QWORD v33[5];
  id v34;
  id v35;
  id v36;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  double v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a5;
  if (v11)
  {
    v13 = self->_loggingConnection;
    v14 = a6;
    v15 = os_signpost_id_generate((os_log_t)v13);
    v16 = v13;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "RelatedForAssetCollection", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v18 = mach_absolute_time();
    -[PGRelatedComputer _upNextCollectionsForAssetCollection:options:curationContext:error:](self, "_upNextCollectionsForAssetCollection:options:curationContext:error:", v11, v12, v14, a7);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend(v12, "fetchLimit");
    if (v20)
    {
      v21 = v20;
      if (objc_msgSend(v19, "count") > v20)
      {
        objc_msgSend(v19, "subarrayWithRange:", 0, v21);
        v22 = objc_claimAutoreleasedReturnValue();

        v19 = (void *)v22;
      }
    }
    workingContext = self->_workingContext;
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __100__PGRelatedComputer_relatedCollectionsForAssetCollection_relatedType_options_curationContext_error___block_invoke;
    v33[3] = &unk_1E8435410;
    v33[4] = self;
    v34 = v12;
    v24 = v19;
    v35 = v24;
    v36 = v11;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v33);
    v25 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v28 = v17;
    v29 = v28;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v29, OS_SIGNPOST_INTERVAL_END, v15, "RelatedForAssetCollection", ", buf, 2u);
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "RelatedForAssetCollection";
      v40 = 2048;
      v41 = (float)((float)((float)((float)(v25 - v18) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v30 = v36;
    v31 = v24;

  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)relatedCollectionsForDefaultAssetCollection:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 curationContext:(id)a6 error:(id *)a7
{
  return -[PGRelatedComputer _relatedCollectionsForDefaultAssetCollection:relatedType:options:assetCollectionForKeywords:curationContext:error:](self, "_relatedCollectionsForDefaultAssetCollection:relatedType:options:assetCollectionForKeywords:curationContext:error:", a3, a4, a5, 0, a6, a7);
}

- (id)_upNextCollectionsForAssetCollection:(id)a3 options:(id)a4 curationContext:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  PGCurationOptions *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  PGUpNextMemoriesGenerationRequest *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  PGUpNextMemoriesGenerationRequest *v42;
  PGMusicCurationOptions *v43;
  PGMusicCurationOptions *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  PGRelated *v59;
  void *v61;
  void *v62;
  void *v63;
  PGMusicCurationOptions *v64;
  PGUpNextMemoriesGenerationRequest *v65;
  id v66;
  id v67;
  id v68;
  id *v69;
  void *v70;
  void *v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[4];
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v12;
  v72 = v13;
  v69 = a6;
  if (objc_msgSend(v10, "assetCollectionType") == 3)
  {
    objc_msgSend(v10, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v85[0] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v85, 1);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    goto LABEL_22;
  }
  if (objc_msgSend(v10, "assetCollectionType") == 6)
  {
    objc_msgSend(v13, "librarySpecificFetchOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchMomentsInHighlight:options:", v10, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v18, "count"))
    {
      v19 = 0;
      do
      {
        objc_msgSend(v18, "objectAtIndexedSubscript:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v21);

        ++v19;
      }
      while (v19 < objc_msgSend(v18, "count"));
    }

    v16 = 0;
  }
  else
  {
    if (objc_msgSend(v10, "assetCollectionType") == 4)
    {
      objc_msgSend(v10, "localIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      goto LABEL_22;
    }
    v66 = v11;
    v22 = -[PGCurationOptions initWithDuration:]([PGCurationOptions alloc], "initWithDuration:", 8);
    -[PGManagerWorkingContext curationManager](self->_workingContext, "curationManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = v10;
    objc_msgSend(v23, "curatedAssetsForAssetCollection:options:curationContext:progressBlock:", v10, v22, v12, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0u;
    v80 = 0u;
    v81 = 0u;
    v82 = 0u;
    v26 = v24;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v80 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "localIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v79, v84, 16);
      }
      while (v28);
    }

    v32 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(v72, "librarySpecificFetchOptions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "fetchMomentsForAssetsWithLocalIdentifiers:options:", v25, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (objc_msgSend(v34, "count"))
    {
      v35 = 0;
      do
      {
        objc_msgSend(v34, "objectAtIndexedSubscript:", v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "uuid");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v37);

        ++v35;
      }
      while (v35 < objc_msgSend(v34, "count"));
    }

    v16 = 0;
    v11 = v66;
    v10 = v67;
  }
  v13 = v72;
LABEL_22:
  v38 = [PGUpNextMemoriesGenerationRequest alloc];
  objc_msgSend(v11, "filteringLocalIdentifiers");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v11, "fetchLimit");
  objc_msgSend(v13, "librarySpecificFetchOptions");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[PGUpNextMemoriesGenerationRequest initWithRootMemoryLocalIdentifier:momentUUIDs:memoryLocalIdentifiersToAvoid:targetUpNextMemoryCount:sharingFilter:](v38, "initWithRootMemoryLocalIdentifier:momentUUIDs:memoryLocalIdentifiersToAvoid:targetUpNextMemoryCount:sharingFilter:", v16, v15, v39, v40, objc_msgSend(v41, "sharingFilter"));

  v43 = [PGMusicCurationOptions alloc];
  v44 = -[PGMusicCurationOptions initWithOptionsDictionary:](v43, "initWithOptionsDictionary:", MEMORY[0x1E0C9AA70]);
  -[PGUpNextMemoriesGenerationRequest fetchMemoryLocalIdentifiersWithWorkingContext:musicCurationOptions:error:](v42, "fetchMemoryLocalIdentifiersWithWorkingContext:musicCurationOptions:error:", self->_workingContext, v44, v69);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v64 = v44;
    v65 = v42;
    v68 = v10;
    v70 = v16;
    objc_msgSend(v13, "librarySpecificFetchOptions");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setIncludeLocalMemories:", 1);
    v47 = (void *)MEMORY[0x1E0CD1630];
    objc_msgSend(v45, "memoryLocalIdentifiers");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v46;
    objc_msgSend(v47, "fetchAssetCollectionsWithLocalIdentifiers:options:", v48, v46);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __88__PGRelatedComputer__upNextCollectionsForAssetCollection_options_curationContext_error___block_invoke;
    v77[3] = &unk_1E84351B0;
    v51 = v50;
    v78 = v51;
    v61 = v49;
    objc_msgSend(v49, "enumerateObjectsUsingBlock:", v77);
    v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v76 = 0u;
    v63 = v45;
    objc_msgSend(v45, "memoryLocalIdentifiers");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
    if (v54)
    {
      v55 = v54;
      v56 = *(_QWORD *)v74;
      do
      {
        for (j = 0; j != v55; ++j)
        {
          if (*(_QWORD *)v74 != v56)
            objc_enumerationMutation(v53);
          objc_msgSend(v51, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * j));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = -[PGRelated initWithMemory:needsDebugInfo:]([PGRelated alloc], "initWithMemory:needsDebugInfo:", v58, 0);
          objc_msgSend(v52, "addObject:", v59);

        }
        v55 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v73, v83, 16);
      }
      while (v55);
    }

    v10 = v68;
    v13 = v72;
    v16 = v70;
    v44 = v64;
    v42 = v65;
    v45 = v63;
  }
  else
  {
    v52 = 0;
  }

  return v52;
}

- (id)_relatedCollectionsForDefaultAssetCollection:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 assetCollectionForKeywords:(id)a6 curationContext:(id)a7 error:(id *)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  OS_os_log *v17;
  os_signpost_id_t v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  PGCurationOptions *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t j;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  unint64_t v44;
  _QWORD *v45;
  void *v46;
  uint64_t v47;
  _QWORD *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  char v55;
  void *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t k;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint32_t numer;
  uint32_t denom;
  NSObject *v75;
  NSObject *v76;
  void *v77;
  id v79;
  os_signpost_id_t spid;
  uint64_t v81;
  unint64_t v82;
  id v83;
  PGCurationOptions *v84;
  NSObject *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  id obj;
  PGRelatedComputer *v93;
  void *v94;
  id v95;
  _QWORD *v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  unint64_t v101;
  id v102;
  id v103;
  uint64_t v104;
  uint64_t v105;
  char v106;
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
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v125;
  __int16 v126;
  double v127;
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  _BYTE v131[128];
  uint64_t v132;

  v132 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v88 = v13;
  if (v13)
  {
    v17 = self->_loggingConnection;
    v18 = os_signpost_id_generate((os_log_t)v17);
    v19 = v17;
    v20 = v19;
    v82 = v18 - 1;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "RelatedForDefaultAssetCollection", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    spid = v18;
    v81 = mach_absolute_time();
    v85 = v20;
    if (v15)
    {
      PGMomentsForAssetCollection((uint64_t)v15);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v86 = 0;
    }
    v21 = (void *)objc_msgSend(v14, "copy");
    objc_msgSend(v21, "setUseDiversity:", 0);
    v90 = v21;
    objc_msgSend(v21, "setFetchLimit:", objc_msgSend(v14, "fetchLimit") + 2);
    v22 = -[PGCurationOptions initWithDuration:]([PGCurationOptions alloc], "initWithDuration:", 8);
    v93 = self;
    -[PGManagerWorkingContext curationManager](self->_workingContext, "curationManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = v16;
    v84 = v22;
    objc_msgSend(v23, "curatedAssetsForAssetCollection:options:curationContext:progressBlock:", v13, v22, v16, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v24, "count"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = 0u;
    v120 = 0u;
    v121 = 0u;
    v122 = 0u;
    v26 = v24;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v120;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v120 != v29)
            objc_enumerationMutation(v26);
          objc_msgSend(*(id *)(*((_QWORD *)&v119 + 1) + 8 * i), "localIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v119, v131, 16);
      }
      while (v28);
    }

    v32 = (void *)MEMORY[0x1E0CD13B8];
    -[PGManagerWorkingContext photoLibrary](v93->_workingContext, "photoLibrary");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "librarySpecificFetchOptions");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "fetchMomentsForAssetsWithLocalIdentifiers:options:", v25, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = 0u;
    v116 = 0u;
    v117 = 0u;
    v118 = 0u;
    obj = v35;
    v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v130, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v116;
      while (2)
      {
        for (j = 0; j != v37; ++j)
        {
          if (*(_QWORD *)v116 != v38)
            objc_enumerationMutation(obj);
          -[PGRelatedComputer relatedCollectionsForMoment:relatedType:options:generateTitles:error:](v93, "relatedCollectionsForMoment:relatedType:options:generateTitles:error:", *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * j), a4, v90, 0, a8);
          v40 = objc_claimAutoreleasedReturnValue();
          if (!v40)
          {
            v103 = 0;
            v77 = obj;
            v42 = obj;
            v16 = v83;
            goto LABEL_80;
          }
          v41 = (void *)v40;
          objc_msgSend(v94, "addObject:", v40);

        }
        v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v130, 16);
        if (v37)
          continue;
        break;
      }
    }

    PGMomentsForAssetCollection((uint64_t)v13);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v14;
    v43 = objc_msgSend(v14, "fetchLimit");
    if (v43)
      v44 = v43;
    else
      v44 = 64;
    v45 = malloc_type_calloc(8uLL, objc_msgSend(v94, "count"), 0x2C97B642uLL);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v44);
    v102 = v15;
    v103 = (id)objc_claimAutoreleasedReturnValue();
    v89 = 0;
    v101 = v44;
    if (v44 <= 1)
      v47 = 1;
    else
      v47 = v44;
    v87 = v47;
    v48 = v45;
    v97 = v26;
    v98 = v25;
    v96 = v45;
    do
    {
      if (objc_msgSend(v103, "count") >= v101)
        break;
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v95 = v94;
      v100 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v111, v129, 16);
      if (v100)
      {
        v49 = 0;
        v99 = *(_QWORD *)v112;
LABEL_34:
        v50 = 0;
        while (1)
        {
          if (*(_QWORD *)v112 != v99)
            objc_enumerationMutation(v95);
          v104 = v50;
          v105 = v49;
          v51 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v50);
          v52 = v48[v49];
          while (v52 < objc_msgSend(v51, "count"))
          {
            objc_msgSend(v51, "objectAtIndexedSubscript:", v52);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "highlight");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v46, "containsObject:", v54);

            v109 = 0u;
            v110 = 0u;
            v107 = 0u;
            v108 = 0u;
            objc_msgSend(v53, "moments");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v107, v128, 16);
            if (v57)
            {
              v58 = v57;
              v59 = *(_QWORD *)v108;
              v106 = v55;
              while (2)
              {
                for (k = 0; k != v58; ++k)
                {
                  if (*(_QWORD *)v108 != v59)
                    objc_enumerationMutation(v56);
                  v61 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * k);
                  if ((objc_msgSend(v42, "containsObject:", v61) & 1) != 0
                    || (objc_msgSend(v46, "containsObject:", v61) & 1) != 0)
                  {

                    ++v52;
                    goto LABEL_51;
                  }
                }
                v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v107, v128, 16);
                v55 = v106;
                if (v58)
                  continue;
                break;
              }
            }

            ++v52;
            if ((v55 & 1) == 0)
            {
              objc_msgSend(v53, "highlight");
              v62 = (void *)objc_claimAutoreleasedReturnValue();

              if (v62)
              {
                objc_msgSend(v53, "highlight");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "addObject:", v63);

              }
              objc_msgSend(v53, "moments");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "addObjectsFromArray:", v64);

              if (v102)
              {
                objc_msgSend(v53, "highlight");
                v65 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = (void *)MEMORY[0x1E0C99E60];
                if (v65)
                {
                  objc_msgSend(v53, "highlight");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "setWithObject:", v67);
                }
                else
                {
                  objc_msgSend(v53, "moments");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "setWithArray:", v67);
                }
                v68 = (void *)objc_claimAutoreleasedReturnValue();

                if ((objc_msgSend(v68, "containsObject:", v88) & 1) != 0
                  || objc_msgSend(v86, "intersectsSet:", v68))
                {
                  objc_msgSend(obj, "objectAtIndexedSubscript:", v105);
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  -[PGRelatedComputer _relatedCollectionBetweenMoment:andAssetCollection:relatedType:needsDebugInfo:needsDiversityInfo:](v93, "_relatedCollectionBetweenMoment:andAssetCollection:relatedType:needsDebugInfo:needsDiversityInfo:", v69, v102, a4, 1, 0);
                  v70 = objc_claimAutoreleasedReturnValue();

                  v53 = (void *)v70;
                  goto LABEL_61;
                }

              }
              else
              {
LABEL_61:
                objc_msgSend(v103, "addObject:", v53);
              }

              break;
            }
LABEL_51:

          }
          v48 = v96;
          v96[v105] = v52;
          v15 = v102;
          v26 = v97;
          v25 = v98;
          if (objc_msgSend(v103, "count") >= v101 || v102 && objc_msgSend(v103, "count"))
            break;
          v49 = v105 + 1;
          v50 = v104 + 1;
          if (v104 + 1 == v100)
          {
            v71 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v111, v129, 16);
            v100 = v71;
            if (v71)
              goto LABEL_34;
            break;
          }
        }
      }

      ++v89;
    }
    while (v89 != v87);
    if (v48)
      free(v48);
    v72 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v75 = v85;
    v76 = v75;
    v16 = v83;
    if (v82 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v75))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v76, OS_SIGNPOST_INTERVAL_END, spid, "RelatedForDefaultAssetCollection", ", buf, 2u);
    }

    if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v125 = "RelatedForDefaultAssetCollection";
      v126 = 2048;
      v127 = (float)((float)((float)((float)(v72 - v81) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v76, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    v14 = v79;
    v77 = obj;
LABEL_80:

  }
  else
  {
    v103 = 0;
  }

  return v103;
}

- (id)relatedCollectionsForMemoryTripOrWeekend:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 curationContext:(id)a6 error:(id *)a7
{
  return -[PGRelatedComputer _relatedCollectionsForMemoryTripOrWeekend:relatedType:options:assetCollectionForKeywords:curationContext:error:](self, "_relatedCollectionsForMemoryTripOrWeekend:relatedType:options:assetCollectionForKeywords:curationContext:error:", a3, a4, a5, 0, a6, a7);
}

- (id)_relatedCollectionsForMemoryTripOrWeekend:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 assetCollectionForKeywords:(id)a6 curationContext:(id)a7 error:(id *)a8
{
  id v14;
  OS_os_log *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  void *v38;
  id v39;
  unint64_t v40;
  void *v41;
  PGManagerWorkingContext *workingContext;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  uint64_t v53;
  uint32_t numer;
  uint32_t denom;
  NSObject *v56;
  NSObject *v57;
  uint64_t v59;
  os_signpost_id_t spid;
  void *v61;
  NSObject *v62;
  unint64_t v63;
  void *v64;
  void *v65;
  PGRelatedComputer *v66;
  id v67;
  id v68;
  unint64_t v69;
  void *v70;
  id v71;
  id obj;
  id obja;
  void *v74;
  void *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _QWORD v84[4];
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  id v92;
  id v93;
  uint8_t *v94;
  unint64_t v95;
  BOOL v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  uint8_t buf[8];
  uint8_t *v102;
  uint64_t v103;
  unint64_t v104;
  mach_timebase_info info;
  uint8_t v106[4];
  const char *v107;
  __int16 v108;
  double v109;
  _BYTE v110[128];
  _BYTE v111[128];
  void *v112;
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v68 = a5;
  v71 = a6;
  v67 = a7;
  v75 = v14;
  if (v14)
  {
    v66 = self;
    v15 = self->_loggingConnection;
    v16 = os_signpost_id_generate((os_log_t)v15);
    v17 = v15;
    v18 = v17;
    spid = v16;
    v63 = v16 - 1;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "RelatedForMemoryTripOrWeekend", ", buf, 2u);
    }
    v62 = v18;

    info = 0;
    mach_timebase_info(&info);
    v59 = mach_absolute_time();
    objc_msgSend(v75, "cls_localStartDate");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "filteringLocalIdentifiers");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "fetchLimit");
    *(_QWORD *)buf = 0;
    v102 = buf;
    v103 = 0x2020000000;
    v104 = v69 - (v69 >> 1);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v75, "photoLibrary");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v68, "mutableCopy");
    objc_msgSend(v20, "setFetchLimit:", 2 * objc_msgSend(v68, "fetchLimit"));
    v61 = v20;
    -[PGRelatedComputer _relatedCollectionsForDefaultAssetCollection:relatedType:options:assetCollectionForKeywords:curationContext:error:](self, "_relatedCollectionsForDefaultAssetCollection:relatedType:options:assetCollectionForKeywords:curationContext:error:", v75, a4, v20, v71, v67, a8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v21, "mutableCopy");

    v99 = 0u;
    v100 = 0u;
    v97 = 0u;
    v98 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v98;
      v26 = *MEMORY[0x1E0D72F60];
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v98 != v25)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * i);
          if (objc_msgSend(v28, "memoryTripTitleType") != 0x7FFFFFFFFFFFFFFFLL
            && (!objc_msgSend(v28, "memoryTripTitleType") && objc_msgSend(v75, "subcategory") == 205
             || objc_msgSend(v28, "memoryTripTitleType") == 1 && objc_msgSend(v75, "subcategory") == 206))
          {
            objc_msgSend(v28, "highlight");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = v29;
            if (v29)
            {
              v31 = v29;
            }
            else
            {
              objc_msgSend(v28, "moments");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "firstObject");
              v31 = (id)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend(v31, "cls_localStartDate");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "timeIntervalSinceDate:", v74);
            v35 = v34;

            v36 = -v35;
            if (v35 >= 0.0)
              v36 = v35;
            if (v36 >= v26)
            {
              if (v71)
                objc_msgSend(v28, "_addKeywords:forRelatedType:", &unk_1E84EA948, 128);
              objc_msgSend(v70, "addObject:", v28);
              objc_msgSend(v28, "highlight");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v112 = v37;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v112, 1);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v38;
              if (!v38)
              {
                objc_msgSend(v28, "moments");
                obj = (id)objc_claimAutoreleasedReturnValue();
                v39 = obj;
              }
              objc_msgSend(v19, "addObjectsFromArray:", v39);
              if (!v38)

            }
          }
        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v97, v113, 16);
      }
      while (v24);
    }

    objc_msgSend(v23, "removeObjectsInArray:", v70);
    v40 = objc_msgSend(v70, "count");
    if (v40 < *((_QWORD *)v102 + 3))
    {
      -[PGManagerWorkingContext serviceManager](v66->_workingContext, "serviceManager");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      workingContext = v66->_workingContext;
      v84[0] = MEMORY[0x1E0C809B0];
      v84[1] = 3221225472;
      v84[2] = __132__PGRelatedComputer__relatedCollectionsForMemoryTripOrWeekend_relatedType_options_assetCollectionForKeywords_curationContext_error___block_invoke;
      v84[3] = &unk_1E8435200;
      v85 = v75;
      v94 = buf;
      v86 = v70;
      v87 = v74;
      v95 = v69;
      v88 = v23;
      v43 = v41;
      v89 = v43;
      v90 = v64;
      v91 = v19;
      v92 = v65;
      v93 = v71;
      v96 = v71 != 0;
      -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v84);

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v70);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    obja = v23;
    v45 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v80, v111, 16);
    if (v45)
    {
      v46 = *(_QWORD *)v81;
LABEL_35:
      v47 = 0;
      while (1)
      {
        if (*(_QWORD *)v81 != v46)
          objc_enumerationMutation(obja);
        v48 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * v47);
        v76 = 0u;
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        objc_msgSend(v48, "moments");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v110, 16);
        if (v50)
        {
          v51 = *(_QWORD *)v77;
          while (2)
          {
            for (j = 0; j != v50; ++j)
            {
              if (*(_QWORD *)v77 != v51)
                objc_enumerationMutation(v49);
              if ((objc_msgSend(v19, "containsObject:", *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * j)) & 1) != 0)
              {

                goto LABEL_49;
              }
            }
            v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v76, v110, 16);
            if (v50)
              continue;
            break;
          }
        }

        objc_msgSend(v44, "addObject:", v48);
        if (objc_msgSend(v44, "count") >= v69)
          break;
LABEL_49:
        if (++v47 == v45)
        {
          v45 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v80, v111, 16);
          if (v45)
            goto LABEL_35;
          break;
        }
      }
    }

    v53 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v56 = v62;
    v57 = v56;
    if (v63 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
    {
      *(_WORD *)v106 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v57, OS_SIGNPOST_INTERVAL_END, spid, "RelatedForMemoryTripOrWeekend", ", v106, 2u);
    }

    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v106 = 136315394;
      v107 = "RelatedForMemoryTripOrWeekend";
      v108 = 2048;
      v109 = (float)((float)((float)((float)(v53 - v59) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v57, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v106, 0x16u);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v44 = 0;
  }

  return v44;
}

- (id)relatedCollectionsForPersonLocalIdentifiers:(id)a3 relatedType:(unint64_t)a4 options:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  OS_os_log *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  PGManagerWorkingContext *workingContext;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint32_t denom;
  uint32_t numer;
  NSObject *v22;
  NSObject *v23;
  id v24;
  const char *v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  PGRelatedComputer *v30;
  id v31;
  uint64_t *v32;
  uint8_t *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[8];
  uint8_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  mach_timebase_info info;
  uint8_t v48[4];
  const char *v49;
  __int16 v50;
  double v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  if (v10 && objc_msgSend(v10, "count"))
  {
    v12 = self->_loggingConnection;
    v13 = os_signpost_id_generate((os_log_t)v12);
    v14 = v12;
    v15 = v14;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "RelatedForPersonLocalIdentifiers", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v27 = mach_absolute_time();
    *(_QWORD *)buf = 0;
    v42 = buf;
    v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__64889;
    v45 = __Block_byref_object_dispose__64890;
    v46 = 0;
    v35 = 0;
    v36 = &v35;
    v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__64889;
    v39 = __Block_byref_object_dispose__64890;
    v40 = 0;
    workingContext = self->_workingContext;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __91__PGRelatedComputer_relatedCollectionsForPersonLocalIdentifiers_relatedType_options_error___block_invoke;
    v28[3] = &unk_1E8435228;
    v32 = &v35;
    v33 = buf;
    v34 = a4;
    v29 = v10;
    v30 = self;
    v31 = v11;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v28);
    if (v36[5])
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "loggingConnection");
      v18 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v26 = (const char *)v36[5];
        *(_DWORD *)v48 = 138412290;
        v49 = v26;
        _os_log_error_impl(&dword_1CA237000, v18, OS_LOG_TYPE_ERROR, "Error occured: %@", v48, 0xCu);
      }

      if (a6)
        *a6 = objc_retainAutorelease((id)v36[5]);
    }
    v19 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v22 = v15;
    v23 = v22;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)v48 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v23, OS_SIGNPOST_INTERVAL_END, v13, "RelatedForPersonLocalIdentifiers", ", v48, 2u);
    }

    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v48 = 136315394;
      v49 = "RelatedForPersonLocalIdentifiers";
      v50 = 2048;
      v51 = (float)((float)((float)((float)(v19 - v27) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v48, 0x16u);
    }
    v24 = *((id *)v42 + 5);

    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v24 = (id)MEMORY[0x1E0C9AA60];
  }

  return v24;
}

- (id)relatedCollectionBetweenAsset:(id)a3 andAssetCollection:(id)a4 relatedType:(unint64_t)a5 needsDebugInfo:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  PGManagerWorkingContext *workingContext;
  _QWORD v16[4];
  id v17;
  id v18;
  PGRelatedComputer *v19;
  uint64_t *v20;
  unint64_t v21;
  BOOL v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__64889;
    v27 = __Block_byref_object_dispose__64890;
    v28 = 0;
    workingContext = self->_workingContext;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __97__PGRelatedComputer_relatedCollectionBetweenAsset_andAssetCollection_relatedType_needsDebugInfo___block_invoke;
    v16[3] = &unk_1E8435250;
    v17 = v10;
    v22 = a6;
    v18 = v12;
    v19 = self;
    v20 = &v23;
    v21 = a5;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v16);
    v13 = (id)v24[5];

    _Block_object_dispose(&v23, 8);
  }

  return v13;
}

- (id)_relatedCollectionBetweenMoment:(id)a3 andAssetCollection:(id)a4 relatedType:(unint64_t)a5 needsDebugInfo:(BOOL)a6 needsDiversityInfo:(BOOL)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  PGManagerWorkingContext *workingContext;
  _QWORD v18[4];
  id v19;
  id v20;
  PGRelatedComputer *v21;
  uint64_t *v22;
  unint64_t v23;
  BOOL v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = v13;
  v15 = 0;
  if (v12 && v13)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__64889;
    v30 = __Block_byref_object_dispose__64890;
    v31 = 0;
    workingContext = self->_workingContext;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __118__PGRelatedComputer__relatedCollectionBetweenMoment_andAssetCollection_relatedType_needsDebugInfo_needsDiversityInfo___block_invoke;
    v18[3] = &unk_1E8435278;
    v19 = v12;
    v24 = a6;
    v25 = a7;
    v20 = v14;
    v21 = self;
    v22 = &v26;
    v23 = a5;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v18);
    v15 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
  }

  return v15;
}

- (id)_relatedCollectionBetweenHighlight:(id)a3 andAssetCollection:(id)a4 relatedType:(unint64_t)a5 needsDebugInfo:(BOOL)a6 needsDiversityInfo:(BOOL)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  PGManagerWorkingContext *workingContext;
  _QWORD v18[4];
  id v19;
  id v20;
  PGRelatedComputer *v21;
  uint64_t *v22;
  unint64_t v23;
  BOOL v24;
  BOOL v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v12 = a3;
  v13 = a4;
  v14 = v13;
  v15 = 0;
  if (v12 && v13)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__64889;
    v30 = __Block_byref_object_dispose__64890;
    v31 = 0;
    workingContext = self->_workingContext;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __121__PGRelatedComputer__relatedCollectionBetweenHighlight_andAssetCollection_relatedType_needsDebugInfo_needsDiversityInfo___block_invoke;
    v18[3] = &unk_1E8435278;
    v19 = v12;
    v24 = a6;
    v25 = a7;
    v20 = v14;
    v21 = self;
    v22 = &v26;
    v23 = a5;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v18);
    v15 = (id)v27[5];

    _Block_object_dispose(&v26, 8);
  }

  return v15;
}

- (id)relatedCollectionBetweenAssetCollection:(id)a3 andAssetCollection:(id)a4 relatedType:(unint64_t)a5 curationContext:(id)a6 needsDebugInfo:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;

  v7 = a7;
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = 0;
  if (v12 && v13)
  {
    if (objc_msgSend(v12, "assetCollectionType") == 3)
    {
      -[PGRelatedComputer _relatedCollectionBetweenMoment:andAssetCollection:relatedType:needsDebugInfo:needsDiversityInfo:](self, "_relatedCollectionBetweenMoment:andAssetCollection:relatedType:needsDebugInfo:needsDiversityInfo:", v12, v13, a5, v7, 1);
      v16 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v15 = (void *)v16;
      goto LABEL_21;
    }
    if (objc_msgSend(v12, "assetCollectionType") == 6)
    {
      -[PGRelatedComputer _relatedCollectionBetweenHighlight:andAssetCollection:relatedType:needsDebugInfo:needsDiversityInfo:](self, "_relatedCollectionBetweenHighlight:andAssetCollection:relatedType:needsDebugInfo:needsDiversityInfo:", v12, v13, a5, v7, 1);
      v16 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (objc_msgSend(v12, "assetCollectionType") == 4)
    {
      v17 = v12;
      v18 = objc_msgSend(v17, "subcategory");
      if ((unint64_t)(v18 - 205) > 1)
      {
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", v17, 0);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "fetchedObjects");
        v22 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "photoLibrary");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "librarySpecificFetchOptions");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v24, "setFetchLimit:", 2);
        v32 = (void *)v22;
        v30 = v24;
        objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAssets:withType:options:", v22, 3, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "count") == 1)
        {
          objc_msgSend(v25, "firstObject");
          v26 = v25;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGRelatedComputer _relatedCollectionBetweenMoment:andAssetCollection:relatedType:needsDebugInfo:needsDiversityInfo:](self, "_relatedCollectionBetweenMoment:andAssetCollection:relatedType:needsDebugInfo:needsDiversityInfo:", v27, v13, a5, v7, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = v26;
          v21 = 0;
        }
        else
        {
          v34 = 0;
          -[PGRelatedComputer _relatedCollectionsForDefaultAssetCollection:relatedType:options:assetCollectionForKeywords:curationContext:error:](self, "_relatedCollectionsForDefaultAssetCollection:relatedType:options:assetCollectionForKeywords:curationContext:error:", v17, a5 & 0xFFFFFFFFFFFFFFF5, 0, v13, v14, &v34);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v34;
          objc_msgSend(v28, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v20 = v31;

      }
      else
      {
        if (v18 == 205)
          v19 = a5 & 0xFFFFFFFFFFFFFFF5;
        else
          v19 = a5;
        v35 = 0;
        -[PGRelatedComputer _relatedCollectionsForMemoryTripOrWeekend:relatedType:options:assetCollectionForKeywords:curationContext:error:](self, "_relatedCollectionsForMemoryTripOrWeekend:relatedType:options:assetCollectionForKeywords:curationContext:error:", v17, v19, 0, v13, v14, &v35);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v35;
        objc_msgSend(v20, "firstObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v33 = 0;
      -[PGRelatedComputer _relatedCollectionsForDefaultAssetCollection:relatedType:options:assetCollectionForKeywords:curationContext:error:](self, "_relatedCollectionsForDefaultAssetCollection:relatedType:options:assetCollectionForKeywords:curationContext:error:", v12, a5 & 0xFFFFFFFFFFFFFFF5, 0, v13, v14, &v33);
      v17 = (id)objc_claimAutoreleasedReturnValue();
      v21 = v33;
      objc_msgSend(v17, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_21:

  return v15;
}

- (id)_postProcessMatchingResults:(id)a3 inGraph:(id)a4 matchingOptions:(id)a5 options:(id)a6
{
  id v10;
  id v11;
  id v12;
  OS_os_log *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  int8x8_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8x8_t v24;
  unint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  unint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t j;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  uint64_t v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t m;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t n;
  id v68;
  uint64_t v69;
  uint8x8_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  uint64_t v74;
  id v75;
  NSSet *v76;
  void *v77;
  id v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t jj;
  uint64_t v83;
  void *v84;
  id v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t kk;
  void *v90;
  PGRelated *v91;
  void *v92;
  char v93;
  uint64_t v94;
  void *v95;
  const __CFString *v96;
  id v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t mm;
  uint64_t v103;
  void *v104;
  PGRelated *v105;
  void *v106;
  char v107;
  void *v108;
  PGRelated *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  char v114;
  PGRelated *v115;
  id v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t nn;
  void *v121;
  PGRelated *v122;
  void *v123;
  char v124;
  void *v125;
  void *v126;
  NSObject *v127;
  PGRelated *v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  double v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t ii;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  uint64_t v144;
  uint32_t numer;
  uint32_t denom;
  NSObject *v147;
  NSObject *v148;
  os_signpost_id_t spid;
  uint64_t v151;
  void *v152;
  void *v153;
  NSObject *v154;
  unint64_t v155;
  void *v156;
  void *v157;
  id v158;
  PGRelated *v159;
  void *v160;
  unint64_t v161;
  unint64_t v162;
  void *v163;
  id v164;
  id v165;
  id v166;
  id v167;
  void *v168;
  void *v169;
  void *v170;
  id v171;
  unsigned int v172;
  int8x8_t v173;
  uint64_t v174;
  void *v175;
  NSSet *v176;
  PGRelatedComputer *v177;
  void *v178;
  void *v179;
  id obj;
  id obja;
  id objb;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  id v189;
  id v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  PGRelated *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  _QWORD v200[4];
  id v201;
  id v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  mach_timebase_info info;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  _QWORD v248[3];
  _BYTE v249[128];
  _BYTE v250[128];
  _BYTE v251[128];
  _BYTE v252[128];
  _BYTE v253[128];
  _BYTE v254[128];
  _BYTE v255[128];
  _BYTE v256[128];
  _BYTE v257[128];
  void *v258;
  uint8_t v259[128];
  uint8_t buf[4];
  const char *v261;
  __int16 v262;
  double v263;
  uint64_t v264;

  v264 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v158 = a4;
  v11 = a5;
  v12 = a6;
  v177 = self;
  v13 = self->_loggingConnection;
  v14 = os_signpost_id_generate((os_log_t)v13);
  v15 = v13;
  v16 = v15;
  v155 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "RelatedPostProcessing", ", buf, 2u);
  }
  spid = v14;
  v154 = v16;

  info = 0;
  mach_timebase_info(&info);
  v151 = mach_absolute_time();
  v196 = v11;
  v17 = (int8x8_t)objc_msgSend(v11, "relatedType");
  objc_msgSend(v12, "filteringLocalIdentifiers");
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v157 = v12;
  v18 = objc_msgSend(v12, "fetchLimit");
  v235 = 0u;
  v236 = 0u;
  v19 = 64;
  if (v18)
    v19 = v18;
  v162 = v19;
  v237 = 0uLL;
  v238 = 0uLL;
  v20 = v10;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v235, v257, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v236;
    v24 = (uint8x8_t)vcnt_s8(v17);
    v24.i16[0] = vaddlv_u8(v24);
    v25 = v24.u32[0];
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v236 != v23)
          objc_enumerationMutation(v20);
        if (v25 >= 2)
        {
          v27 = *(void **)(*((_QWORD *)&v235 + 1) + 8 * i);
          objc_msgSend(v27, "event");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "contentScore");
          v30 = v29;

          objc_msgSend(v27, "score");
          objc_msgSend(v27, "setScore:", (v30 * 0.1 + 0.9) * v31);
        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v235, v257, 16);
    }
    while (v22);
  }
  v173 = v17;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v197 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraph defaultMatchingSortDescriptors](PGGraph, "defaultMatchingSortDescriptors");
  v156 = v20;
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sortedArrayUsingDescriptors:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");
  if (v33 >= 0x40)
    v34 = 64;
  else
    v34 = v33;
  v152 = v32;
  objc_msgSend(v32, "subarrayWithRange:", 0, v34);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v231 = 0u;
  v232 = 0u;
  v233 = 0u;
  v234 = 0u;
  -[PGRelatedComputer _weekendsForTargetDomain:inGraph:](v177, "_weekendsForTargetDomain:inGraph:", objc_msgSend(v196, "targetEventDomain"), v158);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v187 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v231, v256, 16);
  if (v187)
  {
    v183 = *(_QWORD *)v232;
    do
    {
      v38 = 0;
      do
      {
        if (*(_QWORD *)v232 != v183)
          objc_enumerationMutation(obj);
        v191 = v38;
        v39 = *(void **)(*((_QWORD *)&v231 + 1) + 8 * v38);
        v227 = 0u;
        v228 = 0u;
        v229 = 0u;
        v230 = 0u;
        v40 = v39;
        v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v227, v255, 16);
        if (v41)
        {
          v42 = v41;
          v43 = *(_QWORD *)v228;
          do
          {
            for (j = 0; j != v42; ++j)
            {
              if (*(_QWORD *)v228 != v43)
                objc_enumerationMutation(v40);
              v45 = objc_msgSend(*(id *)(*((_QWORD *)&v227 + 1) + 8 * j), "identifier");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v45);
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "setObject:forKeyedSubscript:", v40, v46);

              objc_msgSend(v199, "addIndex:", v45);
            }
            v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v227, v255, 16);
          }
          while (v42);
        }

        v38 = v191 + 1;
      }
      while (v191 + 1 != v187);
      v187 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v231, v256, 16);
    }
    while (v187);
  }

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v223 = 0u;
  v224 = 0u;
  v225 = 0u;
  v226 = 0u;
  -[PGRelatedComputer _tripsForTargetDomain:inGraph:](v177, "_tripsForTargetDomain:inGraph:", objc_msgSend(v196, "targetEventDomain"), v158);
  obja = (id)objc_claimAutoreleasedReturnValue();
  v188 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v223, v254, 16);
  if (v188)
  {
    v184 = *(_QWORD *)v224;
    do
    {
      v47 = 0;
      do
      {
        if (*(_QWORD *)v224 != v184)
          objc_enumerationMutation(obja);
        v192 = v47;
        v48 = *(void **)(*((_QWORD *)&v223 + 1) + 8 * v47);
        v219 = 0u;
        v220 = 0u;
        v221 = 0u;
        v222 = 0u;
        v49 = v48;
        v50 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v219, v253, 16);
        if (v50)
        {
          v51 = v50;
          v52 = *(_QWORD *)v220;
          do
          {
            for (k = 0; k != v51; ++k)
            {
              if (*(_QWORD *)v220 != v52)
                objc_enumerationMutation(v49);
              v54 = objc_msgSend(*(id *)(*((_QWORD *)&v219 + 1) + 8 * k), "identifier");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v54);
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "setObject:forKeyedSubscript:", v49, v55);

              objc_msgSend(v35, "addIndex:", v54);
            }
            v51 = objc_msgSend(v49, "countByEnumeratingWithState:objects:count:", &v219, v253, 16);
          }
          while (v51);
        }

        v47 = v192 + 1;
      }
      while (v192 + 1 != v188);
      v188 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v223, v254, 16);
    }
    while (v188);
  }

  v217 = 0u;
  v218 = 0u;
  v215 = 0u;
  v216 = 0u;
  v56 = v175;
  v193 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v215, v252, 16);
  if (v193)
  {
    v57 = *(_QWORD *)v216;
    v185 = *(_QWORD *)v216;
    v189 = v56;
    do
    {
      for (m = 0; m != v193; ++m)
      {
        if (*(_QWORD *)v216 != v57)
          objc_enumerationMutation(v56);
        objc_msgSend(*(id *)(*((_QWORD *)&v215 + 1) + 8 * m), "event");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "identifier");

        if (objc_msgSend(v35, "containsIndex:", v60))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v179, "addObject:", v62);
          if ((unint64_t)objc_msgSend(v179, "countForObject:", v62) >= 2)
          {
            v213 = 0u;
            v214 = 0u;
            v211 = 0u;
            v212 = 0u;
            v63 = v62;
            v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v211, v251, 16);
            if (v64)
            {
              v65 = v64;
              v66 = *(_QWORD *)v212;
              do
              {
                for (n = 0; n != v65; ++n)
                {
                  if (*(_QWORD *)v212 != v66)
                    objc_enumerationMutation(v63);
                  objc_msgSend(v198, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v211 + 1) + 8 * n), "identifier"));
                }
                v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v211, v251, 16);
              }
              while (v65);
            }

            v57 = v185;
            v56 = v189;
          }

        }
      }
      v193 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v215, v252, 16);
    }
    while (v193);
  }

  -[PGManagerWorkingContext photoLibrary](v177->_workingContext, "photoLibrary");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = v177->_blockedFeatures;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v162);
  v171 = (id)objc_claimAutoreleasedReturnValue();
  v207 = 0u;
  v208 = 0u;
  v209 = 0u;
  v210 = 0u;
  v68 = v56;
  v170 = v68;
  objb = (id)objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v207, v250, 16);
  if (!objb)
    goto LABEL_155;
  v69 = *(_QWORD *)v208;
  v70 = (uint8x8_t)vcnt_s8(v173);
  v70.i16[0] = vaddlv_u8(v70);
  v161 = v70.u32[0];
  v174 = *(_QWORD *)v208;
  while (2)
  {
    v71 = 0;
    do
    {
      if (*(_QWORD *)v208 != v69)
        objc_enumerationMutation(v68);
      v186 = v71;
      v72 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * v71);
      objc_msgSend(v72, "event");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "identifier");
      if (objc_msgSend(v73, "isInteresting")
        && (objc_msgSend(v197, "containsIndex:", v74) & 1) == 0
        && !+[PGMemoryController anyBlockedFeatureIn:isHitByEvent:](PGMemoryController, "anyBlockedFeatureIn:isHitByEvent:", v176, v73))
      {
        v178 = v73;
        v172 = objc_msgSend(v196, "needsKeywords");
        if ((objc_msgSend(v199, "containsIndex:", v74) & 1) == 0
          && (objc_msgSend(v198, "containsIndex:", v74) & 1) == 0)
        {
          v110 = v73;
          objc_msgSend(v73, "photoEvent");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v111, "fetchAssetCollectionInPhotoLibrary:", v169);
          v112 = (void *)objc_claimAutoreleasedReturnValue();

          if (v112)
          {
            objc_msgSend(v112, "localIdentifier");
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            v114 = objc_msgSend(v168, "containsObject:", v113);

            if ((v114 & 1) != 0)
            {
              v115 = 0;
              v69 = v174;
LABEL_148:

              goto LABEL_149;
            }
            v115 = -[PGRelated initWithGraphMatchingResult:assetCollection:needsDebugInfo:]([PGRelated alloc], "initWithGraphMatchingResult:assetCollection:needsDebugInfo:", v72, v112, v172);

            v69 = v174;
            if (!v115)
            {
LABEL_149:
              if (objc_msgSend(v171, "count") >= v162)
              {

                goto LABEL_155;
              }
              goto LABEL_150;
            }
LABEL_138:
            if (v161 >= 2)
            {
              objc_msgSend(v110, "contentScore");
              v132 = v131;
              -[PGRelated score](v115, "score");
              -[PGRelated setScore:](v115, "setScore:", v133 / (v132 * 0.1 + 0.9));
            }
            objc_msgSend(v171, "addObject:", v115);
            v205 = 0u;
            v206 = 0u;
            v203 = 0u;
            v204 = 0u;
            objc_msgSend(v110, "dateNodes");
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v203, v249, 16);
            if (v134)
            {
              v135 = v134;
              v195 = v115;
              v136 = *(_QWORD *)v204;
              do
              {
                for (ii = 0; ii != v135; ++ii)
                {
                  if (*(_QWORD *)v204 != v136)
                    objc_enumerationMutation(v112);
                  objc_msgSend(*(id *)(*((_QWORD *)&v203 + 1) + 8 * ii), "collection");
                  v138 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v138, "momentNodes");
                  v139 = (void *)objc_claimAutoreleasedReturnValue();
                  v200[0] = MEMORY[0x1E0C809B0];
                  v200[1] = 3221225472;
                  v200[2] = __81__PGRelatedComputer__postProcessMatchingResults_inGraph_matchingOptions_options___block_invoke;
                  v200[3] = &unk_1E84352A0;
                  v201 = v196;
                  v202 = v197;
                  objc_msgSend(v139, "enumerateNodesUsingBlock:", v200);

                }
                v135 = objc_msgSend(v112, "countByEnumeratingWithState:objects:count:", &v203, v249, 16);
              }
              while (v135);
              v68 = v170;
              v69 = v174;
              v110 = v178;
              v115 = v195;
            }
            goto LABEL_148;
          }
          +[PGLogging sharedLogging](PGLogging, "sharedLogging");
          v126 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v126, "loggingConnection");
          v127 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v127, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315138;
            v261 = "-[PGRelatedComputer _postProcessMatchingResults:inGraph:matchingOptions:options:]";
            _os_log_error_impl(&dword_1CA237000, v127, OS_LOG_TYPE_ERROR, "Nil asset collection for momentNode in %s, graph is out-of-sync with the photo library.", buf, 0xCu);
          }

          v115 = 0;
          v69 = v174;
LABEL_150:

          v73 = v178;
          goto LABEL_151;
        }
        if (objc_msgSend(v199, "containsIndex:", v74))
        {
          v190 = v197;
          v165 = v72;
          v75 = v36;
          v76 = v176;
          v167 = v169;
          v166 = v168;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v74);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          v164 = v75;
          objc_msgSend(v75, "objectForKeyedSubscript:");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          v244 = 0u;
          v245 = 0u;
          v246 = 0u;
          v247 = 0u;
          v78 = v77;
          v79 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v244, buf, 16);
          if (v79)
          {
            v80 = v79;
            v81 = *(_QWORD *)v245;
            do
            {
              for (jj = 0; jj != v80; ++jj)
              {
                if (*(_QWORD *)v245 != v81)
                  objc_enumerationMutation(v78);
                v83 = *(_QWORD *)(*((_QWORD *)&v244 + 1) + 8 * jj);
                if (!+[PGMemoryController anyBlockedFeatureIn:isHitByEvent:](PGMemoryController, "anyBlockedFeatureIn:isHitByEvent:", v76, v83))objc_msgSend(v194, "addObject:", v83);
              }
              v80 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v244, buf, 16);
            }
            while (v80);
          }

          v84 = v194;
          if (objc_msgSend(v194, "count"))
          {
            if (objc_msgSend(v194, "count") != 1)
            {
              v242 = 0u;
              v243 = 0u;
              v240 = 0u;
              v241 = 0u;
              v85 = v78;
              v86 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v240, v259, 16);
              if (v86)
              {
                v87 = v86;
                v88 = *(_QWORD *)v241;
                do
                {
                  for (kk = 0; kk != v87; ++kk)
                  {
                    if (*(_QWORD *)v241 != v88)
                      objc_enumerationMutation(v85);
                    objc_msgSend(v190, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v240 + 1) + 8 * kk), "identifier"));
                  }
                  v87 = objc_msgSend(v85, "countByEnumeratingWithState:objects:count:", &v240, v259, 16);
                }
                while (v87);
              }

              objc_msgSend(v194, "firstObject");
              v90 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "highlightGroupNode");
              v91 = (PGRelated *)objc_claimAutoreleasedReturnValue();

              v159 = v91;
              -[PGRelated fetchAssetCollectionInPhotoLibrary:](v91, "fetchAssetCollectionInPhotoLibrary:", v167);
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v160, "localIdentifier");
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              v93 = objc_msgSend(v166, "containsObject:", v92);

              if ((v93 & 1) == 0)
              {
                v94 = v172;
                if (v172)
                {
                  v95 = (void *)MEMORY[0x1E0CB3940];
                  v96 = CFSTR("Weekend");
LABEL_133:
                  objc_msgSend(v95, "stringWithFormat:", CFSTR("%@ upgrade"), v96);
                  v129 = (void *)objc_claimAutoreleasedReturnValue();
                  v258 = v129;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v258, 1);
                  v130 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v165, "addKeywords:forRelatedType:", v130, 128);

                  v94 = v172;
                  goto LABEL_134;
                }
                goto LABEL_134;
              }
              goto LABEL_122;
            }
            goto LABEL_107;
          }
        }
        else
        {
          v190 = v197;
          v165 = v72;
          v97 = v37;
          v76 = v176;
          v167 = v169;
          v166 = v168;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v74);
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          v164 = v97;
          objc_msgSend(v97, "objectForKeyedSubscript:");
          v98 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          v244 = 0u;
          v245 = 0u;
          v246 = 0u;
          v247 = 0u;
          v78 = v98;
          v99 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v244, buf, 16);
          if (v99)
          {
            v100 = v99;
            v101 = *(_QWORD *)v245;
            do
            {
              for (mm = 0; mm != v100; ++mm)
              {
                if (*(_QWORD *)v245 != v101)
                  objc_enumerationMutation(v78);
                v103 = *(_QWORD *)(*((_QWORD *)&v244 + 1) + 8 * mm);
                if (!+[PGMemoryController anyBlockedFeatureIn:isHitByEvent:](PGMemoryController, "anyBlockedFeatureIn:isHitByEvent:", v76, v103))objc_msgSend(v194, "addObject:", v103);
              }
              v100 = objc_msgSend(v78, "countByEnumeratingWithState:objects:count:", &v244, buf, 16);
            }
            while (v100);
          }

          v84 = v194;
          if (objc_msgSend(v194, "count"))
          {
            if (objc_msgSend(v194, "count") != 1)
            {
              v242 = 0u;
              v243 = 0u;
              v240 = 0u;
              v241 = 0u;
              v116 = v78;
              v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v240, v259, 16);
              if (v117)
              {
                v118 = v117;
                v119 = *(_QWORD *)v241;
                do
                {
                  for (nn = 0; nn != v118; ++nn)
                  {
                    if (*(_QWORD *)v241 != v119)
                      objc_enumerationMutation(v116);
                    objc_msgSend(v190, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v240 + 1) + 8 * nn), "identifier"));
                  }
                  v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v240, v259, 16);
                }
                while (v118);
              }

              objc_msgSend(v194, "firstObject");
              v121 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v121, "highlightGroupNode");
              v122 = (PGRelated *)objc_claimAutoreleasedReturnValue();

              v159 = v122;
              -[PGRelated fetchAssetCollectionInPhotoLibrary:](v122, "fetchAssetCollectionInPhotoLibrary:", v167);
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v160, "localIdentifier");
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              v124 = objc_msgSend(v166, "containsObject:", v123);

              if ((v124 & 1) == 0)
              {
                v94 = v172;
                if (v172)
                {
                  v95 = (void *)MEMORY[0x1E0CB3940];
                  v96 = CFSTR("Trip");
                  goto LABEL_133;
                }
LABEL_134:
                v125 = v160;
                v105 = -[PGRelated initWithGraphMatchingResult:highlight:needsDebugInfo:]([PGRelated alloc], "initWithGraphMatchingResult:highlight:needsDebugInfo:", v165, v160, v94);
                v69 = v174;
                goto LABEL_135;
              }
LABEL_122:
              v105 = 0;
              v69 = v174;
              v125 = v160;
LABEL_135:

              v68 = v170;
              v108 = v164;
              v109 = v159;
LABEL_136:

LABEL_137:
              v110 = v178;
              v115 = v105;
              if (v105)
                goto LABEL_138;
              goto LABEL_150;
            }
LABEL_107:
            objc_msgSend(v84, "firstObject");
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "fetchAssetCollectionInPhotoLibrary:", v167);
            v105 = (PGRelated *)objc_claimAutoreleasedReturnValue();

            if (v105)
            {
              -[PGRelated localIdentifier](v105, "localIdentifier");
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              v107 = objc_msgSend(v166, "containsObject:", v106);

              v108 = v164;
              if ((v107 & 1) != 0)
              {
                v109 = v105;
                v105 = 0;
              }
              else
              {
                v128 = -[PGRelated initWithGraphMatchingResult:assetCollection:needsDebugInfo:]([PGRelated alloc], "initWithGraphMatchingResult:assetCollection:needsDebugInfo:", v165, v105, v172);
                v109 = v105;
                v105 = v128;
              }
              v68 = v170;
              v69 = v174;
            }
            else
            {
              v109 = 0;
              v68 = v170;
              v69 = v174;
              v108 = v164;
            }
            goto LABEL_136;
          }
        }
        v105 = 0;
        v68 = v170;
        v69 = v174;
        v108 = v164;
        goto LABEL_137;
      }
LABEL_151:

      v71 = v186 + 1;
    }
    while ((id)(v186 + 1) != objb);
    objb = (id)objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v207, v250, 16);
    if (objb)
      continue;
    break;
  }
LABEL_155:

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("highlight"), 0, &__block_literal_global_64879);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", CFSTR("moments"), 0, &__block_literal_global_288);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v248[0] = v140;
  v248[1] = v141;
  v248[2] = v142;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v248, 3);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v171, "sortUsingDescriptors:", v143);

  v144 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v147 = v154;
  v148 = v147;
  if (v155 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v147))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v148, OS_SIGNPOST_INTERVAL_END, spid, "RelatedPostProcessing", ", buf, 2u);
  }

  if (os_log_type_enabled(v148, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v261 = "RelatedPostProcessing";
    v262 = 2048;
    v263 = (float)((float)((float)((float)(v144 - v151) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v148, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v171;
}

- (id)_diverseResultsFromMatchingResults:(id)a3 inGraph:(id)a4 timeShuffleDate:(id)a5 matchingOptions:(id)a6 options:(id)a7
{
  id v12;
  OS_os_log *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t k;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t m;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t n;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  double v75;
  id v76;
  id v77;
  double v78;
  uint64_t v79;
  double v80;
  int64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  int v88;
  void *v89;
  _BOOL4 v90;
  void *v91;
  unint64_t v92;
  int v93;
  void *v94;
  double v95;
  _BOOL4 v96;
  double v97;
  double v98;
  unint64_t v99;
  _BOOL4 v100;
  BOOL v101;
  int v102;
  int v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  unint64_t v108;
  char v109;
  double v110;
  double v111;
  double v112;
  double v113;
  _BOOL4 v114;
  void *v115;
  double v116;
  double v117;
  double v118;
  double v119;
  void *v120;
  double v121;
  double v122;
  double v123;
  int v124;
  void *v125;
  double v126;
  double v127;
  double v128;
  double v129;
  _BOOL4 v130;
  void *v131;
  double v132;
  double v133;
  double v134;
  double v135;
  int v136;
  void *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  void *v145;
  double v146;
  double v147;
  double v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  uint64_t v157;
  void *v158;
  id v159;
  uint64_t v160;
  uint64_t v161;
  unint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  id v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t ii;
  void *v174;
  void *v175;
  size_t v176;
  _QWORD *v177;
  _QWORD *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  unint64_t v182;
  void *v183;
  void *v184;
  uint64_t v185;
  PGRelated *v186;
  void *v187;
  void *v188;
  id v189;
  id v190;
  NSSet *v191;
  void *v192;
  void *v193;
  id v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t jj;
  uint64_t v199;
  void *v200;
  void *v201;
  void *v202;
  char v203;
  void *v204;
  id v205;
  void *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t mm;
  uint64_t v211;
  void *v212;
  void *v213;
  void *v214;
  char v215;
  void *v216;
  void *v217;
  id v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t kk;
  void *v223;
  void *v224;
  void *v225;
  char v226;
  void *v227;
  void *v228;
  id v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t nn;
  void *v234;
  void *v235;
  void *v236;
  char v237;
  PGRelated *v238;
  void *v239;
  NSObject *v240;
  void *v241;
  void *v242;
  double v243;
  double v244;
  double v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  unint64_t v250;
  uint64_t v252;
  uint32_t numer;
  uint32_t denom;
  NSObject *v255;
  NSObject *v256;
  NSObject *v257;
  id v258;
  os_signpost_id_t spid;
  uint64_t v261;
  NSObject *v262;
  unint64_t v263;
  void *v264;
  void *v265;
  unint64_t v266;
  void *v267;
  void *v268;
  void *v269;
  void *v270;
  void *v271;
  id v272;
  void *v273;
  _QWORD *v274;
  uint64_t v275;
  uint64_t v276;
  PGRelated *v277;
  id v278;
  id v279;
  id v280;
  uint64_t v281;
  void *v282;
  void *v283;
  id v284;
  PGRelatedComputer *v285;
  void *v286;
  double v287;
  id v288;
  int v289;
  void *v290;
  double v291;
  id v292;
  void *v293;
  void *v294;
  void *v295;
  NSSet *v296;
  void *v297;
  id v298;
  id v299;
  unint64_t v300;
  id v301;
  uint64_t v302;
  id v303;
  uint64_t v304;
  id v305;
  uint64_t v306;
  void *v307;
  unsigned int v308;
  uint64_t v309;
  uint64_t v310;
  unint64_t v311;
  void *v312;
  uint64_t v313;
  void *v314;
  char v315;
  void *v316;
  uint64_t v317;
  void *v318;
  void *v319;
  uint64_t v320;
  _BOOL4 v321;
  id v322;
  void *v323;
  id obj;
  id obja;
  id objb;
  uint64_t v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  _QWORD v333[4];
  id v334;
  id v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  __int128 v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  __int128 v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  __int128 v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  __int128 v355;
  __int128 v356;
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  mach_timebase_info info;
  __int128 v377;
  __int128 v378;
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  void *v385;
  _BYTE v386[128];
  _BYTE v387[128];
  _BYTE v388[128];
  _BYTE v389[128];
  _QWORD v390[7];
  _BYTE v391[128];
  _BYTE v392[128];
  _BYTE v393[128];
  _BYTE v394[128];
  _BYTE v395[128];
  _BYTE v396[128];
  void *v397;
  uint8_t v398[128];
  uint8_t buf[4];
  const char *v400;
  __int16 v401;
  double v402;
  uint64_t v403;

  v403 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v299 = a4;
  v278 = a5;
  v284 = a6;
  v298 = a7;
  v285 = self;
  v13 = self->_loggingConnection;
  v14 = os_signpost_id_generate((os_log_t)v13);
  v15 = v13;
  v16 = v15;
  v263 = v14 - 1;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "RelatedDiversity", ", buf, 2u);
  }
  spid = v14;
  v262 = v16;

  info = 0;
  mach_timebase_info(&info);
  v261 = mach_absolute_time();
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v372 = 0u;
  v373 = 0u;
  v374 = 0u;
  v375 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v372, v396, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v373;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v373 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v372 + 1) + 8 * i), "event");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v372, v396, 16);
    }
    while (v20);
  }
  v264 = v17;

  +[PGGraph defaultMatchingSortDescriptors](PGGraph, "defaultMatchingSortDescriptors");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v265 = v18;
  objc_msgSend(v18, "sortedArrayUsingDescriptors:", v24);
  v319 = (void *)objc_claimAutoreleasedReturnValue();

  v315 = objc_msgSend(v284, "relatedType");
  v308 = objc_msgSend(v284, "needsKeywords");
  objc_msgSend(v298, "filteringLocalIdentifiers");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v298, "fetchLimit");
  v26 = 64;
  if (v25)
    v26 = v25;
  v300 = v26;
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  v368 = 0u;
  v369 = 0u;
  v370 = 0u;
  v371 = 0u;
  -[PGRelatedComputer _weekendsForTargetDomain:inGraph:](v285, "_weekendsForTargetDomain:inGraph:", objc_msgSend(v284, "targetEventDomain"), v299);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v368, v395, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v369;
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(_QWORD *)v369 != v30)
          objc_enumerationMutation(v27);
        v32 = *(void **)(*((_QWORD *)&v368 + 1) + 8 * j);
        v364 = 0u;
        v365 = 0u;
        v366 = 0u;
        v367 = 0u;
        v33 = v32;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v364, v394, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v365;
          do
          {
            for (k = 0; k != v35; ++k)
            {
              if (*(_QWORD *)v365 != v36)
                objc_enumerationMutation(v33);
              v38 = objc_msgSend(*(id *)(*((_QWORD *)&v364 + 1) + 8 * k), "identifier");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v330, "setObject:forKeyedSubscript:", v33, v39);

              objc_msgSend(v331, "addIndex:", v38);
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v364, v394, 16);
          }
          while (v35);
        }

      }
      v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v368, v395, 16);
    }
    while (v29);
  }

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  v360 = 0u;
  v361 = 0u;
  v362 = 0u;
  v363 = 0u;
  -[PGRelatedComputer _tripsForTargetDomain:inGraph:](v285, "_tripsForTargetDomain:inGraph:", objc_msgSend(v284, "targetEventDomain"), v299);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v360, v393, 16);
  if (v42)
  {
    v43 = v42;
    v327 = *(_QWORD *)v361;
    do
    {
      for (m = 0; m != v43; ++m)
      {
        if (*(_QWORD *)v361 != v327)
          objc_enumerationMutation(obj);
        v45 = *(void **)(*((_QWORD *)&v360 + 1) + 8 * m);
        v356 = 0u;
        v357 = 0u;
        v358 = 0u;
        v359 = 0u;
        v46 = v45;
        v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v356, v392, 16);
        if (v47)
        {
          v48 = v47;
          v49 = *(_QWORD *)v357;
          do
          {
            for (n = 0; n != v48; ++n)
            {
              if (*(_QWORD *)v357 != v49)
                objc_enumerationMutation(v46);
              v51 = objc_msgSend(*(id *)(*((_QWORD *)&v356 + 1) + 8 * n), "identifier");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v51);
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v332, "setObject:forKeyedSubscript:", v46, v52);

              objc_msgSend(v40, "addIndex:", v51);
            }
            v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v356, v392, 16);
          }
          while (v48);
        }

      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v360, v393, 16);
    }
    while (v43);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 64);
  v282 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v267 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v273 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v304 = objc_msgSend(v53, "yearFromDate:", v54);

  if ((v315 & 1) != 0)
    v55 = 0.7;
  else
    v55 = 0.0;
  if ((v315 & 2) != 0)
    v56 = 0.5;
  else
    v56 = -0.0;
  if ((v315 & 4) != 0)
    v57 = 1.1;
  else
    v57 = -0.0;
  if ((v315 & 8) != 0)
    v58 = 0.5;
  else
    v58 = -0.0;
  if ((v315 & 0x10) != 0)
    v59 = 0.3;
  else
    v59 = -0.0;
  v354 = 0u;
  v355 = 0u;
  if ((v315 & 0x20) != 0)
    v60 = 0.3;
  else
    v60 = -0.0;
  v352 = 0uLL;
  v353 = 0uLL;
  v279 = v319;
  v61 = objc_msgSend(v279, "countByEnumeratingWithState:objects:count:", &v352, v391, 16);
  if (v61)
  {
    v62 = v61;
    v63 = v55 + v56 + v57 + v58 + v59 + v60;
    v291 = 1.1 / v63;
    v287 = 0.7 / v63;
    v64 = *(_QWORD *)v353;
    v306 = *(_QWORD *)v353;
    do
    {
      v65 = 0;
      v309 = v62;
      do
      {
        if (*(_QWORD *)v353 != v64)
          objc_enumerationMutation(v279);
        v66 = *(void **)(*((_QWORD *)&v352 + 1) + 8 * v65);
        objc_msgSend(v66, "event");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v67, "isInteresting"))
        {
          objc_msgSend(v67, "contentScore");
          v69 = v68;
          objc_msgSend(v67, "localStartDate");
          v70 = (void *)objc_claimAutoreleasedReturnValue();

          if (v70)
          {
            v71 = (void *)MEMORY[0x1E0D4B130];
            objc_msgSend(v67, "localStartDate");
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = objc_msgSend(v71, "yearFromDate:", v72);

            v74 = v304 - v73;
            if (v304 - v73 < 0)
              v74 = v73 - v304;
            v75 = fmin((double)v74 / 20.0, 1.0);
          }
          else
          {
            v75 = 0.0;
          }
          objc_msgSend(v67, "localStartDate");
          v76 = (id)objc_claimAutoreleasedReturnValue();
          v77 = v278;
          objc_msgSend(v77, "timeIntervalSince1970");
          v79 = (uint64_t)llround(v78) % 86400;
          objc_msgSend(v77, "timeIntervalSince1970");
          v81 = llround(v80);
          v82 = v79 + 86400 * (v81 / 86400) - v81;
          if (v82 < 0)
            v82 = -v82;
          v320 = v82;

          objc_msgSend(v66, "contextItemForRelatedType:", 4);
          v83 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "contextItemForRelatedType:", 1);
          v328 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "contextItemForRelatedType:", 32);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "sortedCriteria");
          v85 = (void *)objc_claimAutoreleasedReturnValue();
          v86 = objc_msgSend(v85, "count");

          objc_msgSend(v66, "sortedCriteria");
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          v88 = objc_msgSend(v87, "containsIndex:", 22);
          obja = v84;
          v316 = v67;
          if (v88)
          {
            objc_msgSend(v66, "sortedCriteria");
            v312 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v312, "containsIndex:", 21) & 1) != 0)
            {
              v89 = (void *)v83;
              v90 = 1;
              goto LABEL_81;
            }
            if (v84)
            {
LABEL_78:
              v89 = (void *)v83;
              objc_msgSend(v84, "contextNodes");
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              v90 = (unint64_t)objc_msgSend(v91, "count") < 2;

              if (!v88)
                goto LABEL_82;
            }
            else
            {
              v89 = (void *)v83;
              v90 = 0;
            }
LABEL_81:

            goto LABEL_82;
          }
          if (v84)
            goto LABEL_78;
          v89 = (void *)v83;
          v90 = 0;
LABEL_82:

          v92 = v86 - v90;
          v93 = (int)v328;
          if (v328)
          {
            objc_msgSend(v328, "score");
            v94 = v89;
            if (v95 < 0.65)
            {
              v96 = 0;
              v93 = 0;
              --v92;
              goto LABEL_86;
            }
            objc_msgSend(v328, "score");
            *(float *)&v97 = v97;
            v67 = v316;
            v96 = *(float *)&v97 >= 0.75;
            v93 = 1;
          }
          else
          {
            v96 = 0;
            v94 = v89;
LABEL_86:
            v67 = v316;
          }
          v98 = (double)v320 / -86400.0 + 1.0;
          if (v94)
          {
            v99 = objc_msgSend(v94, "criteria");
            v321 = v99 > 0x11;
            if (v99 <= 0x11)
            {
              if ((unint64_t)objc_msgSend(v94, "criteria") < 0x10)
                v96 = 1;
              v100 = v75 != 0.0;
              if (v75 == 0.0)
                v102 = 0;
              else
                v102 = v93;
              if (v102 == 1)
              {
                v103 = v93;
                v104 = (void *)objc_msgSend(v66, "copy");
                objc_msgSend(v104, "score");
                objc_msgSend(v104, "setScore:", v75 * v105);
                objc_msgSend(v104, "score");
                objc_msgSend(v104, "setScore:", (v69 * 0.1 + 0.9) * v106);
                objc_msgSend(v104, "score");
                objc_msgSend(v104, "setScore:", (v98 * 0.1 + 0.9) * v107);
                objc_msgSend(v269, "addObject:", v104);

                v93 = v103;
                v100 = 1;
              }
            }
            else
            {
              --v92;
              v100 = v75 != 0.0;
            }
            v108 = objc_msgSend(v94, "criteria");
            v109 = v92 > 1 || v96;
            if (v108 >= 0x13 && (v109 & 1) != 0)
            {
LABEL_107:
              if (objc_msgSend(v67, "hasLocation"))
              {
                objc_msgSend(v66, "score");
                v111 = v110;
                v294 = v94;
                objc_msgSend(v94, "score");
                v113 = v111 + (v112 * -2.0 + 1.0) * v291;
                v114 = v100;
                v115 = (void *)objc_msgSend(v66, "copy");
                objc_msgSend(v115, "setScore:", v113);
                v116 = v69 * 0.1 + 0.9;
                objc_msgSend(v115, "score");
                objc_msgSend(v115, "setScore:", v116 * v117);
                v118 = v98 * 0.1 + 0.9;
                objc_msgSend(v115, "score");
                objc_msgSend(v115, "setScore:", v118 * v119);
                objc_msgSend(v271, "addObject:", v115);
                if (v114)
                {
                  v289 = v93;
                  v120 = (void *)objc_msgSend(v115, "copy");
                  objc_msgSend(v120, "score");
                  objc_msgSend(v120, "setScore:", v75 * v121);
                  objc_msgSend(v120, "score");
                  objc_msgSend(v120, "setScore:", v116 * v122);
                  objc_msgSend(v120, "score");
                  objc_msgSend(v120, "setScore:", v118 * v123);
                  objc_msgSend(v268, "addObject:", v120);

                  v93 = v289;
                }

                v100 = v114;
                v94 = v294;
              }
            }
            v124 = v92 > 1 || v96;
            if ((v93 | v321) != 1 && v124 && objc_msgSend(v67, "hasPeopleCountingMe:", 0))
            {
              v125 = v94;
              objc_msgSend(v66, "score");
              v127 = v126;
              objc_msgSend(v328, "score");
              v129 = v127 + (v128 * -2.0 + 1.0) * v287;
              v130 = v100;
              v131 = (void *)objc_msgSend(v66, "copy");
              objc_msgSend(v131, "setScore:", v129);
              v132 = v69 * 0.1 + 0.9;
              objc_msgSend(v131, "score");
              objc_msgSend(v131, "setScore:", v132 * v133);
              v134 = v98 * 0.1 + 0.9;
              objc_msgSend(v131, "score");
              objc_msgSend(v131, "setScore:", v134 * v135);
              objc_msgSend(v270, "addObject:", v131);
              if (v130)
              {
                v136 = v93;
                v137 = (void *)objc_msgSend(v131, "copy");
                objc_msgSend(v137, "score");
                objc_msgSend(v137, "setScore:", v75 * v138);
                objc_msgSend(v137, "score");
                objc_msgSend(v137, "setScore:", v132 * v139);
                objc_msgSend(v137, "score");
                objc_msgSend(v137, "setScore:", v134 * v140);
                objc_msgSend(v267, "addObject:", v137);

                v93 = v136;
              }

              v94 = v125;
            }
          }
          else
          {
            v100 = v75 != 0.0;
            v101 = !v96;
            if (v92 >= 2)
              v101 = 0;
            if (!v101)
            {
              v321 = 1;
              goto LABEL_107;
            }
          }
          if (v93)
          {
            objc_msgSend(v328, "score");
            v142 = v141;
            objc_msgSend(v66, "score");
            v144 = v143 * 0.2 + v142 * 0.8;
            v145 = (void *)objc_msgSend(v66, "copy");
            objc_msgSend(v145, "setScore:", v144);
            objc_msgSend(v145, "score");
            objc_msgSend(v145, "setScore:", (v69 * 0.1 + 0.9) * v146);
            objc_msgSend(v145, "score");
            objc_msgSend(v145, "setScore:", (v98 * 0.1 + 0.9) * v147);
            objc_msgSend(v273, "addObject:", v145);

          }
          v62 = v309;
          v64 = v306;
          if ((unint64_t)objc_msgSend(v282, "count") <= 0x3F)
          {
            objc_msgSend(v66, "score");
            objc_msgSend(v66, "setScore:", (v69 * 0.1 + 0.9) * v148);
            objc_msgSend(v282, "addObject:", v66);
          }

        }
        ++v65;
      }
      while (v62 != v65);
      v62 = objc_msgSend(v279, "countByEnumeratingWithState:objects:count:", &v352, v391, 16);
    }
    while (v62);
  }

  +[PGGraph defaultMatchingSortDescriptors](PGGraph, "defaultMatchingSortDescriptors");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v282, "sortUsingDescriptors:", v149);

  +[PGGraph defaultMatchingSortDescriptors](PGGraph, "defaultMatchingSortDescriptors");
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "sortUsingDescriptors:", v150);

  +[PGGraph defaultMatchingSortDescriptors](PGGraph, "defaultMatchingSortDescriptors");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v271, "sortUsingDescriptors:", v151);

  +[PGGraph defaultMatchingSortDescriptors](PGGraph, "defaultMatchingSortDescriptors");
  v152 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v270, "sortUsingDescriptors:", v152);

  +[PGGraph defaultMatchingSortDescriptors](PGGraph, "defaultMatchingSortDescriptors");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v268, "sortUsingDescriptors:", v153);

  +[PGGraph defaultMatchingSortDescriptors](PGGraph, "defaultMatchingSortDescriptors");
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v267, "sortUsingDescriptors:", v154);

  +[PGGraph defaultMatchingSortDescriptors](PGGraph, "defaultMatchingSortDescriptors");
  v155 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v273, "sortUsingDescriptors:", v155);

  v390[0] = v282;
  v390[1] = v269;
  v390[2] = v271;
  v390[3] = v270;
  v390[4] = v268;
  v390[5] = v267;
  v390[6] = v273;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v390, 7);
  v156 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  v348 = 0u;
  v349 = 0u;
  v350 = 0u;
  v351 = 0u;
  v280 = v156;
  objb = v40;
  v313 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v348, v389, 16);
  if (v313)
  {
    v310 = *(_QWORD *)v349;
    do
    {
      v157 = 0;
      do
      {
        if (*(_QWORD *)v349 != v310)
          objc_enumerationMutation(v280);
        v317 = v157;
        v158 = *(void **)(*((_QWORD *)&v348 + 1) + 8 * v157);
        v344 = 0u;
        v345 = 0u;
        v346 = 0u;
        v347 = 0u;
        v159 = v158;
        v160 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v344, v388, 16);
        if (v160)
        {
          v161 = v160;
          v162 = 0;
          v163 = *(_QWORD *)v345;
          v322 = v159;
LABEL_134:
          v164 = 0;
          while (1)
          {
            if (*(_QWORD *)v345 != v163)
              objc_enumerationMutation(v159);
            objc_msgSend(*(id *)(*((_QWORD *)&v344 + 1) + 8 * v164), "event");
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            v166 = objc_msgSend(v165, "identifier");

            if (objc_msgSend(v40, "containsIndex:", v166))
            {
              if ((objc_msgSend(v41, "containsIndex:", v166) & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v166);
                v167 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v332, "objectForKeyedSubscript:", v167);
                v168 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v329, "addObject:", v168);
                if ((unint64_t)objc_msgSend(v329, "countForObject:", v168) >= 2)
                {
                  v342 = 0u;
                  v343 = 0u;
                  v340 = 0u;
                  v341 = 0u;
                  v169 = v168;
                  v170 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v340, v387, 16);
                  if (v170)
                  {
                    v171 = v170;
                    v172 = *(_QWORD *)v341;
                    do
                    {
                      for (ii = 0; ii != v171; ++ii)
                      {
                        if (*(_QWORD *)v341 != v172)
                          objc_enumerationMutation(v169);
                        objc_msgSend(v41, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v340 + 1) + 8 * ii), "identifier"));
                      }
                      v171 = objc_msgSend(v169, "countByEnumeratingWithState:objects:count:", &v340, v387, 16);
                    }
                    while (v171);
                  }

                  v159 = v322;
                  v40 = objb;
                }
                ++v162;

                if (v162 > 0x3F)
                  break;
              }
            }
            if (++v164 == v161)
            {
              v161 = objc_msgSend(v159, "countByEnumeratingWithState:objects:count:", &v344, v388, 16);
              if (v161)
                goto LABEL_134;
              break;
            }
          }
        }

        v157 = v317 + 1;
      }
      while (v317 + 1 != v313);
      v313 = objc_msgSend(v280, "countByEnumeratingWithState:objects:count:", &v348, v389, 16);
    }
    while (v313);
  }

  v296 = v285->_blockedFeatures;
  -[PGManagerWorkingContext photoLibrary](v285->_workingContext, "photoLibrary");
  v307 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v300);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v176 = objc_msgSend(v280, "count");
  if (!v176)
    goto LABEL_251;
  v177 = malloc_type_calloc(8uLL, v176, 0x5254AD64uLL);
  v178 = v177;
  if (objc_msgSend(v175, "count") >= v300)
    goto LABEL_249;
  v266 = 0;
  v293 = v175;
  v295 = v174;
  v274 = v177;
  while (2)
  {
    v338 = 0u;
    v339 = 0u;
    v336 = 0u;
    v337 = 0u;
    v272 = v280;
    v276 = objc_msgSend(v272, "countByEnumeratingWithState:objects:count:", &v336, v386, 16);
    if (!v276)
      goto LABEL_246;
    v302 = 0;
    v275 = *(_QWORD *)v337;
LABEL_158:
    v179 = 0;
    while (2)
    {
      if (*(_QWORD *)v337 != v275)
      {
        v180 = v179;
        objc_enumerationMutation(v272);
        v179 = v180;
      }
      v281 = v179;
      v181 = *(void **)(*((_QWORD *)&v336 + 1) + 8 * v179);
      v182 = v178[v302];
      v314 = v181;
      while (1)
      {
        if (v182 >= objc_msgSend(v181, "count"))
        {
          v186 = 0;
          goto LABEL_241;
        }
        objc_msgSend(v181, "objectAtIndexedSubscript:", v182);
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v183, "event");
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        v185 = objc_msgSend(v184, "identifier");
        if ((objc_msgSend(v174, "containsIndex:", v185) & 1) != 0)
        {
          v186 = 0;
LABEL_236:
          ++v182;
          goto LABEL_237;
        }
        objc_msgSend(v174, "addIndex:", v185);
        v318 = v184;
        v323 = v183;
        if (v308)
        {
          objc_msgSend(&unk_1E84EA990, "objectAtIndexedSubscript:", v302);
          v187 = (void *)objc_claimAutoreleasedReturnValue();
          v385 = v187;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v385, 1);
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v323, "addKeywords:forRelatedType:", v188, 64);

          v183 = v323;
          v184 = v318;
        }
        if ((objc_msgSend(v331, "containsIndex:", v185) & 1) == 0
          && (objc_msgSend(v41, "containsIndex:", v185) & 1) == 0)
        {
          break;
        }
        v311 = v182;
        if (objc_msgSend(v331, "containsIndex:", v185))
        {
          v292 = v299;
          v189 = v174;
          v301 = v183;
          v190 = v330;
          v191 = v296;
          v305 = v307;
          v303 = v297;
          v288 = v298;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v185);
          v290 = v190;
          v286 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v190, "objectForKeyedSubscript:");
          v192 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          v381 = 0u;
          v382 = 0u;
          v383 = 0u;
          v384 = 0u;
          v194 = v192;
          v195 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v381, buf, 16);
          if (v195)
          {
            v196 = v195;
            v197 = *(_QWORD *)v382;
            do
            {
              for (jj = 0; jj != v196; ++jj)
              {
                if (*(_QWORD *)v382 != v197)
                  objc_enumerationMutation(v194);
                v199 = *(_QWORD *)(*((_QWORD *)&v381 + 1) + 8 * jj);
                if (!+[PGMemoryController anyBlockedFeatureIn:isHitByEvent:](PGMemoryController, "anyBlockedFeatureIn:isHitByEvent:", v191, v199))objc_msgSend(v193, "addObject:", v199);
              }
              v196 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v381, buf, 16);
            }
            while (v196);
          }

          if (!objc_msgSend(v193, "count"))
            goto LABEL_198;
          if (objc_msgSend(v193, "count") != 1)
          {
            v380 = 0u;
            v379 = 0u;
            v378 = 0u;
            v377 = 0u;
            v218 = v194;
            v219 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v377, v398, 16);
            if (v219)
            {
              v220 = v219;
              v221 = *(_QWORD *)v378;
              do
              {
                for (kk = 0; kk != v220; ++kk)
                {
                  if (*(_QWORD *)v378 != v221)
                    objc_enumerationMutation(v218);
                  objc_msgSend(v189, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v377 + 1) + 8 * kk), "identifier"));
                }
                v220 = objc_msgSend(v218, "countByEnumeratingWithState:objects:count:", &v377, v398, 16);
              }
              while (v220);
            }

            objc_msgSend(v193, "firstObject");
            v223 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v223, "highlightGroupNode");
            v224 = (void *)objc_claimAutoreleasedReturnValue();

            v283 = v224;
            objc_msgSend(v224, "fetchAssetCollectionInPhotoLibrary:", v305);
            v277 = (PGRelated *)objc_claimAutoreleasedReturnValue();
            -[PGRelated localIdentifier](v277, "localIdentifier");
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            v226 = objc_msgSend(v303, "containsObject:", v225);

            if ((v226 & 1) != 0)
              goto LABEL_220;
            v40 = objb;
            v174 = v295;
            if (v308)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ upgrade"), CFSTR("Weekend"));
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              v397 = v227;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v397, 1);
              v228 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v301, "addKeywords:forRelatedType:", v228, 128);

            }
            goto LABEL_227;
          }
          objc_msgSend(v193, "firstObject");
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v200, "fetchAssetCollectionInPhotoLibrary:", v305);
          v201 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = objb;
          if (!v201)
            goto LABEL_224;
          objc_msgSend(v201, "localIdentifier");
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          v203 = objc_msgSend(v303, "containsObject:", v202);

          v204 = v201;
          v174 = v295;
          v283 = v204;
          if ((v203 & 1) == 0)
            goto LABEL_228;
        }
        else
        {
          v292 = v299;
          v189 = v174;
          v301 = v183;
          v205 = v332;
          v191 = v296;
          v305 = v307;
          v303 = v297;
          v288 = v298;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v185);
          v290 = v205;
          v286 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v205, "objectForKeyedSubscript:");
          v206 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          v381 = 0u;
          v382 = 0u;
          v383 = 0u;
          v384 = 0u;
          v194 = v206;
          v207 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v381, buf, 16);
          if (v207)
          {
            v208 = v207;
            v209 = *(_QWORD *)v382;
            do
            {
              for (mm = 0; mm != v208; ++mm)
              {
                if (*(_QWORD *)v382 != v209)
                  objc_enumerationMutation(v194);
                v211 = *(_QWORD *)(*((_QWORD *)&v381 + 1) + 8 * mm);
                if (!+[PGMemoryController anyBlockedFeatureIn:isHitByEvent:](PGMemoryController, "anyBlockedFeatureIn:isHitByEvent:", v191, v211))objc_msgSend(v193, "addObject:", v211);
              }
              v208 = objc_msgSend(v194, "countByEnumeratingWithState:objects:count:", &v381, buf, 16);
            }
            while (v208);
          }

          if (!objc_msgSend(v193, "count"))
          {
LABEL_198:
            v186 = 0;
            v40 = objb;
            v174 = v295;
            v181 = v314;
            goto LABEL_231;
          }
          if (objc_msgSend(v193, "count") != 1)
          {
            v380 = 0u;
            v379 = 0u;
            v378 = 0u;
            v377 = 0u;
            v229 = v194;
            v230 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v377, v398, 16);
            if (v230)
            {
              v231 = v230;
              v232 = *(_QWORD *)v378;
              do
              {
                for (nn = 0; nn != v231; ++nn)
                {
                  if (*(_QWORD *)v378 != v232)
                    objc_enumerationMutation(v229);
                  objc_msgSend(v189, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v377 + 1) + 8 * nn), "identifier"));
                }
                v231 = objc_msgSend(v229, "countByEnumeratingWithState:objects:count:", &v377, v398, 16);
              }
              while (v231);
            }

            objc_msgSend(v193, "firstObject");
            v234 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v234, "highlightGroupNode");
            v235 = (void *)objc_claimAutoreleasedReturnValue();

            v283 = v235;
            objc_msgSend(v235, "fetchAssetCollectionInPhotoLibrary:", v305);
            v277 = (PGRelated *)objc_claimAutoreleasedReturnValue();
            -[PGRelated localIdentifier](v277, "localIdentifier");
            v236 = (void *)objc_claimAutoreleasedReturnValue();
            v237 = objc_msgSend(v303, "containsObject:", v236);

            if ((v237 & 1) != 0)
            {
LABEL_220:
              v186 = 0;
              v40 = objb;
              v174 = v295;
              v238 = v277;
LABEL_229:

              goto LABEL_230;
            }
            v40 = objb;
            v174 = v295;
            if (v308)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ upgrade"), CFSTR("Trip"));
              v241 = (void *)objc_claimAutoreleasedReturnValue();
              v397 = v241;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v397, 1);
              v242 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v301, "addKeywords:forRelatedType:", v242, 128);

            }
LABEL_227:
            v238 = v277;
            v186 = -[PGRelated initWithGraphMatchingResult:highlight:needsDebugInfo:]([PGRelated alloc], "initWithGraphMatchingResult:highlight:needsDebugInfo:", v301, v277, v308);

            goto LABEL_229;
          }
          objc_msgSend(v193, "firstObject");
          v212 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v212, "fetchAssetCollectionInPhotoLibrary:", v305);
          v213 = (void *)objc_claimAutoreleasedReturnValue();

          v40 = objb;
          if (!v213)
          {
LABEL_224:
            v283 = 0;
            v186 = 0;
            v174 = v295;
            goto LABEL_230;
          }
          objc_msgSend(v213, "localIdentifier");
          v214 = (void *)objc_claimAutoreleasedReturnValue();
          v215 = objc_msgSend(v303, "containsObject:", v214);

          v204 = v213;
          v174 = v295;
          v283 = v204;
          if ((v215 & 1) == 0)
          {
LABEL_228:
            v238 = -[PGRelated initWithGraphMatchingResult:assetCollection:needsDebugInfo:]([PGRelated alloc], "initWithGraphMatchingResult:assetCollection:needsDebugInfo:", v301, v204, v308);
            v186 = v238;
            goto LABEL_229;
          }
        }
        v186 = 0;
LABEL_230:
        v181 = v314;

LABEL_231:
        v175 = v293;
        v182 = v311;
        v184 = v318;
        v183 = v323;
        if (v186)
          goto LABEL_232;
LABEL_237:

        if (v186)
          goto LABEL_241;
      }
      objc_msgSend(v184, "photoEvent");
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "fetchAssetCollectionInPhotoLibrary:", v307);
      v217 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v217)
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v239 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v239, "loggingConnection");
        v240 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315138;
          v400 = "-[PGRelatedComputer _diverseResultsFromMatchingResults:inGraph:timeShuffleDate:matchingOptions:options:]";
          _os_log_error_impl(&dword_1CA237000, v240, OS_LOG_TYPE_ERROR, "Nil asset collection for event node in %s, graph is out-of-sync with the photo library.", buf, 0xCu);
        }

        v186 = 0;
        v184 = v318;
        goto LABEL_237;
      }

      v186 = 0;
      v184 = v318;
LABEL_232:
      -[PGRelated score](v186, "score");
      v244 = v243;
      objc_msgSend(v184, "contentScore");
      -[PGRelated setMatchingScore:](v186, "setMatchingScore:", v244 / (v245 * 0.1 + 0.9));
      if (v186)
        objc_msgSend(v175, "addObject:", v186);
      objc_msgSend(v184, "eventCollection");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v246, "eventMomentNodes");
      v247 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v247, "dateNodes");
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v248, "momentNodes");
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      v333[0] = MEMORY[0x1E0C809B0];
      v333[1] = 3221225472;
      v333[2] = __104__PGRelatedComputer__diverseResultsFromMatchingResults_inGraph_timeShuffleDate_matchingOptions_options___block_invoke;
      v333[3] = &unk_1E84352A0;
      v334 = v284;
      v335 = v174;
      objc_msgSend(v249, "enumerateNodesUsingBlock:", v333);

      v250 = objc_msgSend(v175, "count");
      if (v250 < v300)
      {
        v181 = v314;
        v184 = v318;
        v183 = v323;
        goto LABEL_236;
      }

LABEL_241:
      if (objc_msgSend(v175, "count") < v300)
      {
        v274[v302++] = v182;

        v178 = v274;
        v179 = v281 + 1;
        if (v281 + 1 != v276)
          continue;
        v276 = objc_msgSend(v272, "countByEnumeratingWithState:objects:count:", &v336, v386, 16);
        if (!v276)
          goto LABEL_246;
        goto LABEL_158;
      }
      break;
    }

    v178 = v274;
LABEL_246:

    if (objc_msgSend(v175, "count") < v300 && v266++ < 0x3F)
      continue;
    break;
  }
LABEL_249:
  if (v178)
    free(v178);
LABEL_251:
  v252 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v255 = v262;
  v256 = v255;
  if (v263 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v255))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v256, OS_SIGNPOST_INTERVAL_END, spid, "RelatedDiversity", ", buf, 2u);
  }

  v257 = v256;
  if (os_log_type_enabled(v257, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v400 = "RelatedDiversity";
    v401 = 2048;
    v402 = (float)((float)((float)((float)(v252 - v261) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v257, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  v258 = v175;
  return v258;
}

- (id)_tripsForTargetDomain:(unsigned __int16)a3 inGraph:(id)a4
{
  int v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v4 == 102)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v6, "longTripNodes", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "sortedHighlightNodes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  else if (v4 == 100)
  {
    objc_msgSend(v5, "trips");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_weekendsForTargetDomain:(unsigned __int16)a3 inGraph:(id)a4
{
  int v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v4 = a3;
  v20 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = v5;
  if (v4 == 102)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    objc_msgSend(v6, "shortTripNodes", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "sortedHighlightNodes");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  else if (v4 == 100)
  {
    objc_msgSend(v5, "weekends");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_stringFromRelatedType:(unint64_t)a3
{
  if ((~(_BYTE)a3 & 7) == 0)
    return CFSTR("ALLM1");
  if ((~(_BYTE)a3 & 0xF) == 0)
    return CFSTR("ALLM2");
  if ((~(_BYTE)a3 & 0x3F) == 0)
    return CFSTR("ALLM3");
  if ((a3 & 1) != 0)
    return CFSTR("PEOPLE");
  if ((a3 & 2) != 0)
    return CFSTR("TIME");
  if ((a3 & 4) != 0)
    return CFSTR("LOCATION");
  if ((a3 & 8) != 0)
    return CFSTR("EVENT");
  if ((a3 & 0x10) != 0)
    return CFSTR("PLACE");
  return (id)((unint64_t)CFSTR("SCENE") & ((uint64_t)(a3 << 58) >> 63));
}

- (id)_fileURLForMomentNode:(id)a3 inGraph:(id)a4 relatedType:(unint64_t)a5 focusOnAsset:(id)a6 toURL:(id)a7
{
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v12 = a6;
  v13 = (void *)MEMORY[0x1E0CB37A0];
  v14 = a7;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v13, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGRelatedComputer _stringFromRelatedType:](self, "_stringFromRelatedType:", a5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "name");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "appendFormat:", CFSTR("%@_%@_%@"), v20, v21, v18);
  if (v12)
  {
    objc_msgSend(v12, "localIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "appendFormat:", CFSTR("_%@"), v22);

  }
  objc_msgSend(v17, "appendString:", CFSTR(".plist"));
  objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR("-"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "path");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "stringByAppendingPathComponent:", v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (BOOL)exportMatchingResultsForMoment:(id)a3 relatedType:(unint64_t)a4 toURL:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  PGManagerWorkingContext *workingContext;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  PGRelatedComputer *v19;
  uint64_t *v20;
  id *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v10 = a3;
  v11 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  workingContext = self->_workingContext;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __76__PGRelatedComputer_exportMatchingResultsForMoment_relatedType_toURL_error___block_invoke;
  v16[3] = &unk_1E8435348;
  v13 = v11;
  v17 = v13;
  v21 = a6;
  v14 = v10;
  v18 = v14;
  v19 = self;
  v22 = a4;
  v20 = &v23;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v16);
  LOBYTE(a4) = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return a4;
}

- (BOOL)exportMatchingResultsForAsset:(id)a3 relatedType:(unint64_t)a4 toURL:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  PGManagerWorkingContext *workingContext;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  PGRelatedComputer *v19;
  uint64_t *v20;
  id *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v10 = a3;
  v11 = a5;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  workingContext = self->_workingContext;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __75__PGRelatedComputer_exportMatchingResultsForAsset_relatedType_toURL_error___block_invoke;
  v16[3] = &unk_1E8435348;
  v13 = v11;
  v17 = v13;
  v21 = a6;
  v14 = v10;
  v18 = v14;
  v19 = self;
  v22 = a4;
  v20 = &v23;
  -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v16);
  LOBYTE(a4) = *((_BYTE *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return a4;
}

- (id)_referenceAssetWithLocalIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "length"))
  {
    -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier == %@"), v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v8);

    objc_msgSend(v7, "setIncludeAssetSourceTypes:", 5);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_generateTitleForRelatedResults:(id)a3 withGraph:(id)a4 referenceEvent:(id)a5 referenceAsset:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  PGTitleGenerationContext *v34;
  void *v35;
  uint64_t j;
  void *v37;
  void *v38;
  BOOL v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  id v48;
  void *v49;
  id v50;
  PGTitleGenerationContext *v52;
  uint64_t v53;
  void *v54;
  id obj;
  id v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _BYTE v78[128];
  _BYTE v79[128];
  uint64_t v80;
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v48 = a5;
  v50 = a6;
  objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  obj = v9;
  v60 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
  if (v60)
  {
    v58 = *(_QWORD *)v75;
    v53 = *MEMORY[0x1E0CD19C0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v75 != v58)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * v11);
        if (objc_msgSend(v12, "shouldGenerateTitle")
          && objc_msgSend(v12, "isGeneratingTitleBasedOnKeyAsset"))
        {
          objc_msgSend(v12, "highlight");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "moments");
          v56 = (id)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v14 = v13;
            goto LABEL_12;
          }
          if (objc_msgSend(v56, "count") == 1)
          {
            objc_msgSend(v56, "firstObject");
            v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:
            v15 = v14;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v56, "count"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = 0u;
            v73 = 0u;
            v70 = 0u;
            v71 = 0u;
            v20 = v56;
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
            if (v21)
            {
              v22 = *(_QWORD *)v71;
              do
              {
                for (i = 0; i != v21; ++i)
                {
                  if (*(_QWORD *)v71 != v22)
                    objc_enumerationMutation(v20);
                  objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * i), "localIdentifier");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v19, "addObject:", v24);

                }
                v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
              }
              while (v21);
            }

            -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "librarySpecificFetchOptions");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v80 = v53;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setFetchPropertySets:", v27);

            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("moment.uuid IN (%@)"), v19);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "setInternalPredicate:", v28);
            objc_msgSend(v26, "setIncludeAssetSourceTypes:", 5);
            objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v26);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", v29, 0);
            v15 = (void *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyCuratedAssetInAssetCollection:referenceAsset:", v15, v50);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            v18 = v49;
            objc_sync_enter(v18);
            objc_msgSend(v18, "setObject:forKey:", v17, v12);
            objc_sync_exit(v18);

          }
        }
        ++v11;
      }
      while (v11 != v60);
      v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v82, 16);
      v60 = v30;
    }
    while (v30);
  }

  if (v48)
  {
    objc_msgSend(v48, "cls_localStartDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "cls_localEndDate");
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v32;
    if (v31 && v32)
    {
      +[PGTimeUtility dateIntervalWithStartDate:endDate:](PGTimeUtility, "dateIntervalWithStartDate:endDate:", v31, v32);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (v31)
    {
      v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v31, 0.0);
    }
    else
    {
      v54 = 0;
    }

  }
  else
  {
    v54 = 0;
  }
  v34 = [PGTitleGenerationContext alloc];
  -[PGManagerWorkingContext serviceManager](self->_workingContext, "serviceManager");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = -[PGTitleGenerationContext initWithGraph:serviceManager:](v34, "initWithGraph:serviceManager:", v10, v35);

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v57 = obj;
  v61 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
  if (v61)
  {
    v59 = *(_QWORD *)v67;
    do
    {
      for (j = 0; j != v61; ++j)
      {
        if (*(_QWORD *)v67 != v59)
          objc_enumerationMutation(v57);
        v37 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
        if (objc_msgSend(v37, "shouldGenerateTitle"))
        {
          objc_msgSend(v37, "highlight");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v38 == 0;

          if (v39)
          {
            if (!objc_msgSend(v37, "isGeneratingTitleBasedOnKeyAsset"))
              continue;
            objc_msgSend(v49, "objectForKey:", v37);
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v64 = 0u;
            v65 = 0u;
            v62 = 0u;
            v63 = 0u;
            objc_msgSend(v37, "moments");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
            if (v44)
            {
              v45 = *(_QWORD *)v63;
              do
              {
                for (k = 0; k != v44; ++k)
                {
                  if (*(_QWORD *)v63 != v45)
                    objc_enumerationMutation(v43);
                  objc_msgSend(v10, "momentNodeForMoment:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * k));
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v47)
                    objc_msgSend(v42, "addObject:", v47);

                }
                v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v62, v78, 16);
              }
              while (v44);
            }

            objc_msgSend(v37, "_generateTitleWithMomentNodes:keyAsset:referenceDateInterval:titleGenerationContext:", v42, v41, v54, v52);
          }
          else
          {
            objc_msgSend(v37, "highlight");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "highlightNodeForHighlight:", v40);
            v41 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v37, "_generateTitleWithHighlightNode:referenceDateInterval:titleGenerationContext:", v41, v54, v52);
          }

        }
      }
      v61 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v66, v79, 16);
    }
    while (v61);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_blockedFeatures, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

void __75__PGRelatedComputer_exportMatchingResultsForAsset_relatedType_toURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", *(_QWORD *)(a1 + 32), 1, 0, *(_QWORD *)(a1 + 64)))
  {
    objc_msgSend(v3, "graph");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "momentNodeForAsset:", *(_QWORD *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "photoLibrary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", *(_QWORD *)(a1 + 40), 3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      v10 = (void *)objc_opt_class();
      v11 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v9, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "searchNodesInGraph:forAsset:inMoment:", v5, v11, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 48), "_fileURLForMomentNode:inGraph:relatedType:focusOnAsset:toURL:", v6, v5, *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v5, "exportMatchMomentEventResults:relatedType:focusOnNodes:toFileURL:error:", v6, *(_QWORD *)(a1 + 72), v13, v14, *(_QWORD *)(a1 + 64));

    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "loggingConnection");
      v16 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v19 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v21 = v19;
        _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "Cannot find asset collection for inAsset %@", buf, 0xCu);
      }

      v17 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Cannot find asset collection for inAsset %@"), *(_QWORD *)(a1 + 40));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "errorWithDescription:", v18);
      **(_QWORD **)(a1 + 64) = (id)objc_claimAutoreleasedReturnValue();

    }
  }

}

void __76__PGRelatedComputer_exportMatchingResultsForMoment_relatedType_toURL_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "graph");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  if (objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", *(_QWORD *)(a1 + 32), 1, 0, *(_QWORD *)(a1 + 64)))
  {
    objc_msgSend(v6, "momentNodeForMoment:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "_fileURLForMomentNode:inGraph:relatedType:focusOnAsset:toURL:", v4, v6, *(_QWORD *)(a1 + 72), 0, *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v6, "exportMatchMomentEventResults:relatedType:focusOnNodes:toFileURL:error:", v4, *(_QWORD *)(a1 + 72), 0, v5, *(_QWORD *)(a1 + 64));

  }
}

void __104__PGRelatedComputer__diverseResultsFromMatchingResults_inGraph_timeShuffleDate_matchingOptions_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 32), "targetEventDomain", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "identifier"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

void __81__PGRelatedComputer__postProcessMatchingResults_inGraph_matchingOptions_options___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v3, "connectedEventsWithTargetDomain:", objc_msgSend(*(id *)(a1 + 32), "targetEventDomain", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "identifier"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

uint64_t __81__PGRelatedComputer__postProcessMatchingResults_inGraph_matchingOptions_options___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a3;
  objc_msgSend(a2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "compare:", v8);

  return v9;
}

uint64_t __81__PGRelatedComputer__postProcessMatchingResults_inGraph_matchingOptions_options___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __121__PGRelatedComputer__relatedCollectionBetweenHighlight_andAssetCollection_relatedType_needsDebugInfo_needsDiversityInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t i;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  id v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t j;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id obj;
  id obja;
  void *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[8];
  id v78;
  _BYTE v79[128];
  void *v80;
  void *v81;
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "highlightNodeForHighlight:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = v4;
  objc_msgSend(v4, "eventNodeForAssetCollection:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relatableEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 0;
    if (!v5)
      goto LABEL_19;
LABEL_6:
    +[PGGraphMatchingOptions optionsWithRelatedType:](PGGraphMatchingOptions, "optionsWithRelatedType:", *(_QWORD *)(a1 + 64));
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject setNeedsKeywords:](v10, "setNeedsKeywords:", *(unsigned __int8 *)(a1 + 72));
    v62 = v8;
    v63 = v5;
    if (v7)
    {
      -[NSObject setTargetEventDomain:](v10, "setTargetEventDomain:", objc_msgSend(v7, "domain"));
      objc_msgSend(v64, "matchEvent:withEvent:options:", v5, v7, v10);
      v11 = (id)objc_claimAutoreleasedReturnValue();
      if (v11)
        goto LABEL_8;
    }
    else
    {
      v59 = a1;
      v60 = v3;
      -[NSObject setTargetEventDomain:](v10, "setTargetEventDomain:", 100);
      v75 = 0u;
      v76 = 0u;
      v73 = 0u;
      v74 = 0u;
      obja = v8;
      v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
      if (v24)
      {
        v25 = v24;
        v11 = 0;
        v68 = 0;
        v26 = *(_QWORD *)v74;
        v27 = v64;
        do
        {
          for (i = 0; i != v25; ++i)
          {
            if (*(_QWORD *)v74 != v26)
              objc_enumerationMutation(obja);
            objc_msgSend(v27, "momentNodeForMoment:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * i));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29)
            {
              v30 = v5;
              v31 = v10;
              objc_msgSend(v27, "matchEvent:withEvent:options:", v5, v29, v10);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "score");
              v34 = v33;
              v35 = v11;
              objc_msgSend(v11, "score");
              if (v34 <= v36)
              {
                v5 = v30;
              }
              else
              {
                v11 = v32;

                v37 = v29;
                v68 = v37;
                v5 = v63;
                v27 = v64;
              }

              v10 = v31;
            }

          }
          v25 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v73, v82, 16);
        }
        while (v25);
      }
      else
      {
        v11 = 0;
        v68 = 0;
      }

      v3 = v60;
      v8 = v62;
      v7 = v68;
      a1 = v59;
      if (v11)
      {
LABEL_8:
        if (*(_BYTE *)(a1 + 72))
        {
          obj = v11;
          v67 = v7;
          v58 = v10;
          objc_msgSend(v5, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (!v12)
          {
            objc_msgSend(v5, "photoEvent");
            v10 = objc_claimAutoreleasedReturnValue();
            -[NSObject localIdentifier](v10, "localIdentifier");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v81 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "addKeywords:forRelatedType:", v14, 512);

          if (!v12)
          {

          }
          objc_msgSend(v7, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (!v15)
          {
            objc_msgSend(v7, "photoEvent");
            v10 = objc_claimAutoreleasedReturnValue();
            -[NSObject localIdentifier](v10, "localIdentifier");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v80 = v16;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v80, 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(obj, "addKeywords:forRelatedType:", v17, 256);

          if (!v15)
          {

          }
          objc_msgSend(v64, "matchEvent:options:", v63, v58);
          v18 = objc_claimAutoreleasedReturnValue();
          v19 = *(void **)(a1 + 48);
          if (*(_BYTE *)(a1 + 73))
          {
            objc_msgSend(v63, "localStartDate");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v18;
            objc_msgSend(v19, "_diverseResultsFromMatchingResults:inGraph:timeShuffleDate:matchingOptions:options:", v18, v64, v20, v58, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            v21 = v18;
            objc_msgSend(*(id *)(a1 + 48), "_postProcessMatchingResults:inGraph:matchingOptions:options:", v18, v64, v58, 0);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v11 = obj;
          v57 = v21;
          v71 = 0u;
          v72 = 0u;
          v69 = 0u;
          v70 = 0u;
          v44 = v22;
          v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
          if (v45)
          {
            v46 = v45;
            v47 = *(_QWORD *)v70;
            v61 = v3;
            while (2)
            {
              for (j = 0; j != v46; ++j)
              {
                if (*(_QWORD *)v70 != v47)
                  objc_enumerationMutation(v44);
                v49 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
                objc_msgSend(v49, "highlight", v57);
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = (void *)MEMORY[0x1E0C99E60];
                if (v50)
                {
                  objc_msgSend(v49, "highlight");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "setWithObject:", v52);
                }
                else
                {
                  objc_msgSend(v49, "moments");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v51, "setWithArray:", v52);
                }
                v53 = (void *)objc_claimAutoreleasedReturnValue();

                v8 = v62;
                if ((objc_msgSend(v53, "containsObject:", *(_QWORD *)(a1 + 40)) & 1) != 0
                  || v62 && objc_msgSend(v53, "intersectsSet:", v62))
                {
                  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v49);

                  v3 = v61;
                  v11 = obj;
                  goto LABEL_51;
                }

              }
              v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
              v3 = v61;
              v11 = obj;
              if (v46)
                continue;
              break;
            }
          }
LABEL_51:

          v54 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          objc_msgSend(v11, "keywords");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "_addKeywordsFromKeywords:", v55);

          v5 = v63;
          v7 = v67;
          v39 = v57;
          v10 = v58;
        }
        else
        {
          v38 = *(void **)(a1 + 48);
          v78 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v78, 1);
          v39 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "_postProcessMatchingResults:inGraph:matchingOptions:options:", v39, v64, v10, 0);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "firstObject");
          v41 = objc_claimAutoreleasedReturnValue();
          v42 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v43 = *(void **)(v42 + 40);
          *(_QWORD *)(v42 + 40) = v41;

        }
        goto LABEL_56;
      }
    }
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "loggingConnection");
    v39 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v39, OS_LOG_TYPE_ERROR, "No matching moment found for nodes", buf, 2u);
    }
LABEL_56:

    goto LABEL_57;
  }
  PGMomentsForAssetCollection(*(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  if (v5 && objc_msgSend(v9, "count"))
    goto LABEL_6;
LABEL_19:
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "No moment found for asset", buf, 2u);
  }
LABEL_57:

}

void __118__PGRelatedComputer__relatedCollectionBetweenMoment_andAssetCollection_relatedType_needsDebugInfo_needsDiversityInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
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
  void *v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t i;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  id v36;
  void *v37;
  NSObject *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  id v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  NSObject *obj;
  id obja;
  void *v68;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[8];
  void *v79;
  _BYTE v80[128];
  void *v81;
  void *v82;
  _BYTE v83[128];
  uint64_t v84;

  v84 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodeForMoment:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v4;
  objc_msgSend(v4, "eventNodeForAssetCollection:", *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "relatableEvent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 0;
    if (!v5)
      goto LABEL_15;
LABEL_6:
    +[PGGraphMatchingOptions optionsWithRelatedType:](PGGraphMatchingOptions, "optionsWithRelatedType:", *(_QWORD *)(a1 + 64));
    v10 = objc_claimAutoreleasedReturnValue();
    -[NSObject setNeedsKeywords:](v10, "setNeedsKeywords:", *(unsigned __int8 *)(a1 + 72));
    v63 = v8;
    v64 = v5;
    if (v7)
    {
      -[NSObject setTargetEventDomain:](v10, "setTargetEventDomain:", objc_msgSend(v7, "domain"));
      objc_msgSend(v65, "matchEvent:withEvent:options:", v5, v7, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        goto LABEL_8;
    }
    else
    {
      v60 = a1;
      v61 = v3;
      -[NSObject setTargetEventDomain:](v10, "setTargetEventDomain:", 100);
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      obja = v8;
      v22 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
      if (v22)
      {
        v23 = v22;
        v24 = 0;
        v69 = 0;
        v25 = *(_QWORD *)v75;
        v26 = v65;
        do
        {
          for (i = 0; i != v23; ++i)
          {
            if (*(_QWORD *)v75 != v25)
              objc_enumerationMutation(obja);
            objc_msgSend(v26, "momentNodeForMoment:", *(_QWORD *)(*((_QWORD *)&v74 + 1) + 8 * i));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if (v28)
            {
              v29 = v5;
              v30 = v10;
              objc_msgSend(v26, "matchEvent:withEvent:options:", v5, v28, v10);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "score");
              v33 = v32;
              v34 = v24;
              objc_msgSend(v24, "score");
              if (v33 <= v35)
              {
                v5 = v29;
              }
              else
              {
                v24 = v31;

                v36 = v28;
                v69 = v36;
                v5 = v64;
                v26 = v65;
              }

              v10 = v30;
            }

          }
          v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v74, v83, 16);
        }
        while (v23);
      }
      else
      {
        v24 = 0;
        v69 = 0;
      }

      v3 = v61;
      v8 = v63;
      v7 = v69;
      a1 = v60;
      v11 = v24;
      if (v24)
      {
LABEL_8:
        if (*(_BYTE *)(a1 + 72))
        {
          obj = v10;
          objc_msgSend(v5, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v82 = v12;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addKeywords:forRelatedType:", v13, 512);

          v68 = v7;
          objc_msgSend(v7, "name");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v14;
          if (!v14)
          {
            objc_msgSend(v68, "photoEvent");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "localIdentifier");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v81 = v15;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v81, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v11;
          objc_msgSend(v11, "addKeywords:forRelatedType:", v16, 256);

          if (!v14)
          {

          }
          objc_msgSend(v65, "matchEvent:options:", v64, obj);
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = *(void **)(a1 + 48);
          v58 = v17;
          if (*(_BYTE *)(a1 + 73))
          {
            objc_msgSend(v64, "localStartDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "_diverseResultsFromMatchingResults:inGraph:timeShuffleDate:matchingOptions:options:", v17, v65, v19, obj, 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

          }
          else
          {
            objc_msgSend(v18, "_postProcessMatchingResults:inGraph:matchingOptions:options:", v17, v65, obj, 0);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v7 = v68;
          v72 = 0u;
          v73 = 0u;
          v70 = 0u;
          v71 = 0u;
          v43 = v20;
          v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
          v45 = a1;
          v46 = v43;
          if (v44)
          {
            v47 = v44;
            v48 = *(_QWORD *)v71;
            v62 = v3;
            while (2)
            {
              for (j = 0; j != v47; ++j)
              {
                if (*(_QWORD *)v71 != v48)
                  objc_enumerationMutation(v46);
                v50 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
                objc_msgSend(v50, "highlight", v58);
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                v52 = (void *)MEMORY[0x1E0C99E60];
                if (v51)
                {
                  objc_msgSend(v50, "highlight");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "setWithObject:", v53);
                }
                else
                {
                  objc_msgSend(v50, "moments");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "setWithArray:", v53);
                }
                v54 = (void *)objc_claimAutoreleasedReturnValue();

                v8 = v63;
                if ((objc_msgSend(v54, "containsObject:", *(_QWORD *)(v45 + 40)) & 1) != 0
                  || v63 && objc_msgSend(v54, "intersectsSet:", v63))
                {
                  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v45 + 56) + 8) + 40), v50);

                  v3 = v62;
                  v7 = v68;
                  goto LABEL_47;
                }

              }
              v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v70, v80, 16);
              v3 = v62;
              v7 = v68;
              if (v47)
                continue;
              break;
            }
          }
LABEL_47:

          v55 = *(void **)(*(_QWORD *)(*(_QWORD *)(v45 + 56) + 8) + 40);
          v11 = v59;
          objc_msgSend(v59, "keywords");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "_addKeywordsFromKeywords:", v56);

          v5 = v64;
          v10 = obj;
          v38 = v58;
        }
        else
        {
          v37 = *(void **)(a1 + 48);
          v79 = v11;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v79, 1);
          v38 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "_postProcessMatchingResults:inGraph:matchingOptions:options:", v38, v65, v10, 0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "firstObject");
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v42 = *(void **)(v41 + 40);
          *(_QWORD *)(v41 + 40) = v40;

        }
        goto LABEL_52;
      }
    }
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "loggingConnection");
    v38 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, v38, OS_LOG_TYPE_ERROR, "No matching moment found for nodes", buf, 2u);
    }
LABEL_52:

    goto LABEL_53;
  }
  PGMomentsForAssetCollection(*(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  if (v5 && objc_msgSend(v9, "count"))
    goto LABEL_6;
LABEL_15:
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "No moment found for asset", buf, 2u);
  }
LABEL_53:

}

void __97__PGRelatedComputer_relatedCollectionBetweenAsset_andAssetCollection_relatedType_needsDebugInfo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  id v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  PGRelated *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  NSObject *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t j;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  id v80;
  id v81;
  NSObject *v82;
  uint64_t v83;
  uint64_t v84;
  NSObject *v85;
  void *v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  NSObject *v95;
  _BYTE v96[128];
  void *v97;
  void *v98;
  void *v99;
  uint8_t v100[128];
  uint8_t buf[4];
  uint64_t v102;
  uint64_t v103;

  v103 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodeForAsset:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(*(id *)(a1 + 40), "assetCollectionType") == 3)
    {
      objc_msgSend(v4, "momentNodeForMoment:", *(_QWORD *)(a1 + 40));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 40), "assetCollectionType") != 6)
      {
        PGMomentsForAssetCollection(*(_QWORD *)(a1 + 40));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
      objc_msgSend(v4, "highlightNodeForHighlight:", *(_QWORD *)(a1 + 40));
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v8 = v6;
    v86 = 0;
    if (v6)
    {
      v80 = v3;
      v10 = 0;
      goto LABEL_13;
    }
LABEL_11:
    if (!objc_msgSend(v86, "count"))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "loggingConnection");
      v12 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v75 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v102 = v75;
        _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "No moment(s) found for assetCollection %@", buf, 0xCu);
      }
      v8 = 0;
      goto LABEL_60;
    }
    v80 = v3;
    v8 = 0;
    v10 = 1;
LABEL_13:
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "librarySpecificFetchOptions");
    v12 = objc_claimAutoreleasedReturnValue();

    -[NSObject setFetchLimit:](v12, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", *(_QWORD *)(a1 + 32), 3, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v13, "count"))
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "loggingConnection");
      v14 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v74 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v102 = v74;
        _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "Cannot find asset collection for inAsset %@", buf, 0xCu);
      }
      v3 = v80;
      goto LABEL_59;
    }
    v79 = v12;
    +[PGGraphMatchingOptions optionsWithRelatedType:](PGGraphMatchingOptions, "optionsWithRelatedType:", *(_QWORD *)(a1 + 64));
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject setNeedsKeywords:](v14, "setNeedsKeywords:", *(unsigned __int8 *)(a1 + 72));
    v15 = (void *)objc_opt_class();
    v16 = *(_QWORD *)(a1 + 32);
    v78 = v13;
    objc_msgSend(v13, "firstObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "searchNodesInGraph:forAsset:inMoment:", v4, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setFocusedNodes:](v14, "setFocusedNodes:", v18);

    v83 = a1;
    if ((v10 & 1) != 0)
    {
      v82 = v14;
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v19 = v86;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
      if (v20)
      {
        v21 = v20;
        v22 = 0;
        v8 = 0;
        v84 = *(_QWORD *)v92;
        while (2)
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v92 != v84)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i);
            objc_msgSend(v4, "momentNodeForMoment:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v5, "isSameNodeAsNode:", v25) & 1) != 0)
            {
              v38 = -[PGRelated initWithMoment:needsDebugInfo:]([PGRelated alloc], "initWithMoment:needsDebugInfo:", v24, *(unsigned __int8 *)(a1 + 72));
              v39 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
              v40 = *(void **)(v39 + 40);
              *(_QWORD *)(v39 + 40) = v38;

              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "_addKeywords:forRelatedType:", &unk_1E84EA978, 128);
              v41 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
              objc_msgSend(v25, "name");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v99 = v42;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v99, 1);
              v43 = v22;
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "_addKeywords:forRelatedType:", v44, 256);

              v3 = v80;
              goto LABEL_55;
            }
            if (v25)
            {
              objc_msgSend(v4, "matchEvent:withEvent:options:", v5, v25, v82);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "score");
              v28 = v27;
              -[NSObject score](v22, "score");
              if (v28 > v29)
              {
                v30 = v4;
                v31 = v19;
                v32 = v5;
                v33 = v26;

                v34 = v25;
                v35 = v33;
                v5 = v32;
                v19 = v31;
                v4 = v30;
                a1 = v83;
                v8 = v34;
                v22 = v35;
              }

            }
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v91, v100, 16);
          if (v21)
            continue;
          break;
        }
      }
      else
      {
        v22 = 0;
        v8 = 0;
      }

      v3 = v80;
      v14 = v82;
    }
    else
    {
      objc_msgSend(v4, "matchEvent:withEvent:options:", v5, v8, v14);
      v22 = objc_claimAutoreleasedReturnValue();
      v3 = v80;
    }
    v12 = v79;
    if (v22)
    {
      if (*(_BYTE *)(a1 + 72))
      {
        objc_msgSend(v5, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v98 = v45;
        v46 = v22;
        v47 = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v98, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addKeywords:forRelatedType:](v46, "addKeywords:forRelatedType:", v48, 512);

        -[NSObject name](v8, "name");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v97 = v49;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v97, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = v46;
        -[NSObject addKeywords:forRelatedType:](v46, "addKeywords:forRelatedType:", v50, 256);

        objc_msgSend(v4, "matchEvent:options:", v5, v14);
        v51 = objc_claimAutoreleasedReturnValue();
        v52 = *(void **)(a1 + 48);
        objc_msgSend(v5, "localStartDate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v77 = (void *)v51;
        v82 = v47;
        objc_msgSend(v52, "_diverseResultsFromMatchingResults:inGraph:timeShuffleDate:matchingOptions:options:", v51, v4, v53, v47, 0);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v55 = v54;
        v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
        if (v56)
        {
          v57 = v56;
          v58 = *(_QWORD *)v88;
          v81 = v3;
          v76 = v5;
          while (2)
          {
            for (j = 0; j != v57; ++j)
            {
              if (*(_QWORD *)v88 != v58)
                objc_enumerationMutation(v55);
              v60 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
              v61 = (void *)MEMORY[0x1E0C99E60];
              objc_msgSend(v60, "moments");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v61, "setWithArray:", v62);
              v63 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v63, "containsObject:", *(_QWORD *)(v83 + 40)) & 1) != 0
                || v86 && objc_msgSend(v63, "intersectsSet:", v86))
              {
                v65 = v60;
                a1 = v83;
                objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(v83 + 56) + 8) + 40), v65);

                v3 = v81;
                v5 = v76;
                goto LABEL_54;
              }

            }
            v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v87, v96, 16);
            v3 = v81;
            v5 = v76;
            a1 = v83;
            if (v57)
              continue;
            break;
          }
        }
LABEL_54:

        v66 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        v43 = v85;
        -[NSObject keywords](v85, "keywords");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "_addKeywordsFromKeywords:", v67);

LABEL_55:
        v13 = v78;
        v12 = v79;
        v14 = v82;
        goto LABEL_58;
      }
      v68 = *(void **)(a1 + 48);
      v95 = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v95, 1);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v68, "_postProcessMatchingResults:inGraph:matchingOptions:options:", v69, v4, v14, 0);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v70, "firstObject");
      v71 = objc_claimAutoreleasedReturnValue();
      v72 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v73 = *(void **)(v72 + 40);
      *(_QWORD *)(v72 + 40) = v71;

      v43 = v22;
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "loggingConnection");
      v43 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1CA237000, v43, OS_LOG_TYPE_ERROR, "No matching moment found for nodes", buf, 2u);
      }
    }
    v13 = v78;
LABEL_58:

LABEL_59:
LABEL_60:

    goto LABEL_61;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loggingConnection");
  v8 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v102 = v9;
    _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "No moment found for asset %@", buf, 0xCu);
  }
LABEL_61:

}

void __91__PGRelatedComputer_relatedCollectionsForPersonLocalIdentifiers_relatedType_options_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0C99E20];
    objc_msgSend(v3, "personNodesForPersonLocalIdentifiers:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      objc_msgSend(v4, "meNode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(v7, "removeObject:", v8);

    }
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v4, "matchPersonNodes:sortDescriptors:", v7, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count"))
      {
        +[PGGraphMatchingOptions optionsWithRelatedType:](PGGraphMatchingOptions, "optionsWithRelatedType:", *(_QWORD *)(a1 + 72));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_postProcessMatchingResults:inGraph:matchingOptions:options:", v9, v4, v10, *(_QWORD *)(a1 + 48));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        v14 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "referenceAssetIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "_referenceAssetWithLocalIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "_generateTitleForRelatedResults:withGraph:referenceEvent:referenceAsset:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v4, 0, v16);
      }
      else
      {
        v24 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v10 = *(void **)(v24 + 40);
        *(_QWORD *)(v24 + 40) = MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "loggingConnection");
      v21 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v25 = *(_QWORD *)(a1 + 32);
        v26 = 138412290;
        v27 = v25;
        _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "Couldn't find nodes for person local identifiers: %@", (uint8_t *)&v26, 0xCu);
      }

      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v23 = *(void **)(v22 + 40);
      *(_QWORD *)(v22 + 40) = MEMORY[0x1E0C9AA60];

    }
  }
  else
  {
    +[PGError errorForCode:](PGError, "errorForCode:", -10);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v19 = *(void **)(v18 + 40);
    *(_QWORD *)(v18 + 40) = v17;

  }
}

void __132__PGRelatedComputer__relatedCollectionsForMemoryTripOrWeekend_relatedType_options_assetCollectionForKeywords_curationContext_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  __int128 v49;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  void *v54;
  id v55;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  _BOOL4 v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t k;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  PGGraphMatchingResult *v78;
  PGGraphMatchingResult *v79;
  PGGraphMatchingResult *v80;
  void *v81;
  PGRelated *v82;
  PGRelated *v83;
  PGRelated *v84;
  void *v85;
  unint64_t v86;
  uint64_t v87;
  __int128 v88;
  void *v89;
  void *v90;
  void *v91;
  _BOOL8 v92;
  PGTitleGenerationContext *v93;
  unint64_t v94;
  void *v95;
  id v96;
  id v97;
  void *v98;
  uint64_t v99;
  void *v100;
  void *v101;
  id obj;
  id obja;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  _QWORD v117[4];
  id v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  _BYTE v131[128];
  _BYTE v132[128];
  void *v133;
  _BYTE v134[128];
  _BYTE v135[128];
  uint8_t v136[128];
  __int128 buf;
  void *v138;
  uint64_t v139;

  v139 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "subcategory") == 205)
    objc_msgSend(v3, "trips");
  else
    objc_msgSend(v3, "weekends");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
  v6 = objc_msgSend(v4, "count") - 1;
  if (v5 < v6)
    v6 = v5;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = v6;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
  if (v7 > objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v95 = v3;
    v129 = 0u;
    v130 = 0u;
    v127 = 0u;
    v128 = 0u;
    v91 = v4;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
    v9 = (double *)MEMORY[0x1E0D72F60];
    if (v8)
    {
      v10 = v8;
      v11 = *(_QWORD *)v128;
      v12 = *MEMORY[0x1E0D72F60];
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v128 != v11)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v127 + 1) + 8 * i);
          objc_msgSend(v14, "firstObject");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "localStartDate");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
          v18 = v17;

          v19 = -v18;
          if (v18 >= 0.0)
            v19 = v18;
          if (v19 < v12)
          {
            objc_msgSend(v98, "addObject:", v14);
            goto LABEL_19;
          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v127, v136, 16);
        if (v10)
          continue;
        break;
      }
    }
LABEL_19:

    v125 = 0u;
    v126 = 0u;
    v123 = 0u;
    v124 = 0u;
    v108 = a1;
    v96 = *(id *)(a1 + 40);
    v104 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v123, v135, 16);
    if (v104)
    {
      v99 = *(_QWORD *)v124;
      v20 = *v9;
      do
      {
        v21 = 0;
        do
        {
          if (*(_QWORD *)v124 != v99)
            objc_enumerationMutation(v96);
          v106 = v21;
          v22 = *(void **)(*((_QWORD *)&v123 + 1) + 8 * v21);
          v119 = 0u;
          v120 = 0u;
          v121 = 0u;
          v122 = 0u;
          v23 = obj;
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v119, v134, 16);
          if (v24)
          {
            v25 = v24;
            v26 = *(_QWORD *)v120;
            while (2)
            {
              for (j = 0; j != v25; ++j)
              {
                if (*(_QWORD *)v120 != v26)
                  objc_enumerationMutation(v23);
                v28 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * j);
                objc_msgSend(v22, "highlight");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                v30 = v29;
                if (v29)
                {
                  v31 = v29;
                }
                else
                {
                  objc_msgSend(v22, "moments");
                  v32 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v32, "firstObject");
                  v31 = (id)objc_claimAutoreleasedReturnValue();

                }
                objc_msgSend(v31, "cls_localStartDate");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "firstObject");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "localStartDate");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "timeIntervalSinceDate:", v35);
                v37 = v36;

                v38 = -v37;
                if (v37 >= 0.0)
                  v38 = v37;
                if (v38 < v20)
                {
                  objc_msgSend(v98, "addObject:", v28);

                  goto LABEL_39;
                }

              }
              v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v119, v134, 16);
              if (v25)
                continue;
              break;
            }
          }
LABEL_39:

          v21 = v106 + 1;
        }
        while (v106 + 1 != v104);
        v104 = objc_msgSend(v96, "countByEnumeratingWithState:objects:count:", &v123, v135, 16);
      }
      while (v104);
    }

    v39 = v108;
    v92 = objc_msgSend(*(id *)(v108 + 32), "subcategory") != 205;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", obj);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "minusSet:", v98);
    v41 = (void *)MEMORY[0x1E0CB3928];
    v117[0] = MEMORY[0x1E0C809B0];
    v117[1] = 3221225472;
    v117[2] = __132__PGRelatedComputer__relatedCollectionsForMemoryTripOrWeekend_relatedType_options_assetCollectionForKeywords_curationContext_error___block_invoke_2;
    v117[3] = &unk_1E84351D8;
    v118 = *(id *)(v108 + 48);
    objc_msgSend(v41, "sortDescriptorWithKey:ascending:comparator:", CFSTR("self"), 0, v117);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = v89;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v133, 1);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = v40;
    objc_msgSend(v40, "sortedArrayUsingDescriptors:", v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = *(_QWORD *)(v108 + 112);
    v45 = objc_msgSend(*(id *)(v108 + 56), "count");
    v94 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v108 + 104) + 8) + 24);
    if (v44 > v45)
    {
      v46 = *(_QWORD *)(v108 + 112);
      v47 = objc_msgSend(*(id *)(v108 + 56), "count");
      v48 = v94;
      if (v94 <= v46 - v47)
        v48 = v46 - v47;
      v94 = v48;
    }
    v3 = v95;
    v93 = -[PGTitleGenerationContext initWithGraph:serviceManager:]([PGTitleGenerationContext alloc], "initWithGraph:serviceManager:", v95, *(_QWORD *)(v108 + 64));
    v113 = 0u;
    v114 = 0u;
    v115 = 0u;
    v116 = 0u;
    obja = v43;
    v107 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
    if (v107)
    {
      v105 = *(_QWORD *)v114;
      *(_QWORD *)&v49 = 138412290;
      v88 = v49;
      do
      {
        v50 = 0;
        do
        {
          if (*(_QWORD *)v114 != v105)
            objc_enumerationMutation(obja);
          v51 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * v50);
          v52 = objc_msgSend(v51, "count", v88);
          if (v52 >= 2)
            v53 = 2;
          else
            v53 = v52;
          objc_msgSend(v3, "momentsForMomentNodes:inPhotoLibrary:sortChronologically:", v51, *(_QWORD *)(v39 + 72), 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          v109 = 0u;
          v110 = 0u;
          v111 = 0u;
          v112 = 0u;
          v55 = v54;
          v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
          v57 = v55;
          if (v56)
          {
            v58 = v56;
            LOBYTE(v59) = 0;
            v60 = 0;
            v61 = *(_QWORD *)v110;
            while (2)
            {
              for (k = 0; k != v58; ++k)
              {
                if (*(_QWORD *)v110 != v61)
                  objc_enumerationMutation(v55);
                v63 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * k);
                if ((objc_msgSend(*(id *)(v108 + 80), "containsObject:", v63) & 1) != 0)
                {
                  v57 = v55;
                  v3 = v95;
                  v39 = v108;
                  goto LABEL_75;
                }
                if (v59)
                {
                  v59 = 1;
                }
                else
                {
                  v64 = *(void **)(v108 + 88);
                  objc_msgSend(v63, "localIdentifier");
                  v65 = (void *)objc_claimAutoreleasedReturnValue();
                  LOBYTE(v64) = objc_msgSend(v64, "containsObject:", v65);

                  v59 = (v64 & 1) == 0 && ++v60 >= v53;
                }
              }
              v58 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v109, v131, 16);
              if (v58)
                continue;
              break;
            }

            v3 = v95;
            v39 = v108;
            if (v59)
            {
              objc_msgSend(*(id *)(v108 + 80), "addObjectsFromArray:", v55);
              objc_msgSend(v51, "firstObject");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v66, "highlightNode");
              v57 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v57, "collection");
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "momentNodes");
              v97 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              *(_QWORD *)&buf = v67;
              objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              *((_QWORD *)&buf + 1) = v68;
              objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              v138 = v69;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &buf, 3);
              v70 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v97, "sortedArrayUsingDescriptors:", v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v71, "isEqualToArray:", v51) & 1) == 0)
              {
                +[PGLogging sharedLogging](PGLogging, "sharedLogging");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "loggingConnection");
                v73 = objc_claimAutoreleasedReturnValue();

                if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf) = v88;
                  *(_QWORD *)((char *)&buf + 4) = v57;
                  _os_log_error_impl(&dword_1CA237000, v73, OS_LOG_TYPE_ERROR, "Mismatch between moment nodes in highlight and [graph trips] api for highlight node: %@", (uint8_t *)&buf, 0xCu);
                }

                v57 = 0;
              }
              objc_msgSend(v57, "fetchAssetCollectionInPhotoLibrary:", *(_QWORD *)(v108 + 72));
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              v75 = v74;
              if (v74)
              {
                v76 = *(void **)(v108 + 88);
                objc_msgSend(v74, "localIdentifier");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v76) = objc_msgSend(v76, "containsObject:", v77);

                if ((_DWORD)v76)
                {

                  goto LABEL_75;
                }
              }
              v101 = v71;
              v78 = [PGGraphMatchingResult alloc];
              v79 = v78;
              if (v57)
              {
                v80 = -[PGGraphMatchingResult initWithEvent:](v78, "initWithEvent:", v57);
              }
              else
              {
                objc_msgSend(v51, "firstObject");
                v81 = (void *)objc_claimAutoreleasedReturnValue();
                v80 = -[PGGraphMatchingResult initWithEvent:](v79, "initWithEvent:", v81);

              }
              if (*(_QWORD *)(v108 + 96))
                -[PGGraphMatchingResult addKeywords:forRelatedType:](v80, "addKeywords:forRelatedType:", &unk_1E84EA960, 128);
              v82 = [PGRelated alloc];
              v83 = v82;
              if (v57)
              {
                v84 = -[PGRelated initWithGraphMatchingResult:highlight:needsDebugInfo:](v82, "initWithGraphMatchingResult:highlight:needsDebugInfo:", v80, v75, *(unsigned __int8 *)(v108 + 120));
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v51);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                v84 = -[PGRelated initWithGraphMatchingResult:moments:tripMemoryTitleType:tripMomentNodes:titleGenerationContext:needsDebugInfo:](v83, "initWithGraphMatchingResult:moments:tripMemoryTitleType:tripMomentNodes:titleGenerationContext:needsDebugInfo:", v80, v55, v92, v85, v93, *(unsigned __int8 *)(v108 + 120));

              }
              objc_msgSend(*(id *)(v108 + 40), "addObject:", v84);
              v86 = objc_msgSend(*(id *)(v108 + 40), "count");

              if (v86 >= v94)
              {

                goto LABEL_89;
              }
            }
          }
          else
          {
LABEL_75:

          }
          ++v50;
        }
        while (v50 != v107);
        v87 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v113, v132, 16);
        v107 = v87;
      }
      while (v87);
    }
LABEL_89:

    v4 = v91;
  }

}

uint64_t __132__PGRelatedComputer__relatedCollectionsForMemoryTripOrWeekend_relatedType_options_assetCollectionForKeywords_curationContext_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  double v9;
  int64_t v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  double v17;
  int64_t v18;
  uint64_t v19;
  double v20;

  v4 = a3;
  objc_msgSend(a2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = (uint64_t)llround(v7) % 86400;
  objc_msgSend(v6, "timeIntervalSince1970");
  v10 = llround(v9);
  v11 = v8 + 86400 * (v10 / 86400) - v10;
  if (v11 < 0)
    v11 = -v11;
  v12 = 1.0 - (double)v11 / 86400.0;

  objc_msgSend(v4, "firstObject");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "localStartDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "timeIntervalSince1970");
  v16 = (uint64_t)llround(v15) % 86400;
  objc_msgSend(v14, "timeIntervalSince1970");
  v18 = llround(v17);
  v19 = v16 + 86400 * (v18 / 86400) - v18;
  if (v19 < 0)
    v19 = -v19;
  v20 = 1.0 - (double)v19 / 86400.0;

  if (v12 < v20)
    return -1;
  else
    return v12 > v20;
}

void __88__PGRelatedComputer__upNextCollectionsForAssetCollection_options_curationContext_error___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __100__PGRelatedComputer_relatedCollectionsForAssetCollection_relatedType_options_curationContext_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v3 = (void *)a1[4];
  v4 = (void *)a1[5];
  v5 = a2;
  objc_msgSend(v4, "referenceAssetIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_referenceAssetWithLocalIdentifier:", v6);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)a1[4];
  v8 = a1[6];
  objc_msgSend(v5, "graph");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_generateTitleForRelatedResults:withGraph:referenceEvent:referenceAsset:", v8, v9, a1[7], v10);
}

void __93__PGRelatedComputer_relatedCollectionsForHighlight_relatedType_options_generateTitles_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  objc_msgSend(a2, "graph");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

    objc_msgSend(v23, "highlightNodeForHighlight:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      +[PGGraphMatchingOptions optionsWithRelatedType:](PGGraphMatchingOptions, "optionsWithRelatedType:", *(_QWORD *)(a1 + 72));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "matchEvent:options:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(*(id *)(a1 + 40), "useDiversity");
      v9 = *(void **)(a1 + 48);
      if (v8)
      {
        objc_msgSend(v5, "localStartDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_diverseResultsFromMatchingResults:inGraph:timeShuffleDate:matchingOptions:options:", v7, v23, v10, v6, *(_QWORD *)(a1 + 40));
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "_postProcessMatchingResults:inGraph:matchingOptions:options:", v7, v23, v6, *(_QWORD *)(a1 + 40));
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v10 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v18;
      }

      if (*(_BYTE *)(a1 + 80))
      {
        v20 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "referenceAssetIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "_referenceAssetWithLocalIdentifier:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "_generateTitleForRelatedResults:withGraph:referenceEvent:referenceAsset:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v23, *(_QWORD *)(a1 + 32), v22);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No highlight node found for highlight %@"), *(_QWORD *)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -3, v6);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v7 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;
    }

  }
  else
  {
    +[PGError errorForCode:](PGError, "errorForCode:", -10);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;
  }

}

void __90__PGRelatedComputer_relatedCollectionsForMoment_relatedType_options_generateTitles_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  PGRelated *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  PGRelated *v46;
  _QWORD v47[2];

  v47[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    objc_msgSend(v3, "momentNodeForMoment:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      +[PGGraphMatchingOptions optionsWithRelatedType:](PGGraphMatchingOptions, "optionsWithRelatedType:", *(_QWORD *)(a1 + 72));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "matchEvent:options:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(*(id *)(a1 + 40), "useDiversity");
      v10 = *(void **)(a1 + 48);
      if (v9)
      {
        objc_msgSend(v6, "localStartDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_diverseResultsFromMatchingResults:inGraph:timeShuffleDate:matchingOptions:options:", v8, v3, v11, v7, *(_QWORD *)(a1 + 40));
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v14 = *(void **)(v13 + 40);
        *(_QWORD *)(v13 + 40) = v12;

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 48), "_postProcessMatchingResults:inGraph:matchingOptions:options:", v8, v3, v7, *(_QWORD *)(a1 + 40));
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v11 = *(void **)(v23 + 40);
        *(_QWORD *)(v23 + 40) = v22;
      }

      if (objc_msgSend(v7, "targetEventDomain") == 102)
      {
        v24 = (void *)MEMORY[0x1E0CD1570];
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 8), "photoLibrary");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fetchOptionsWithPhotoLibrary:orObject:", v25, 0);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = (void *)MEMORY[0x1E0CD1708];
        v47[0] = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "fetchPhotosHighlightsContainingMoments:options:", v28, v26);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "firstObject");
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (MEMORY[0x1CAA4E40C](objc_msgSend(v30, "type")))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "firstObject");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "highlight");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "isEqual:", v30);

          if ((v33 & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("highlight != %@"), v30);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "filteredArrayUsingPredicate:", v34);
            v35 = objc_claimAutoreleasedReturnValue();
            v36 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v37 = *(void **)(v36 + 40);
            *(_QWORD *)(v36 + 40) = v35;

            v38 = -[PGRelated initWithHighlight:needsDebugInfo:]([PGRelated alloc], "initWithHighlight:needsDebugInfo:", v30, 0);
            v46 = v38;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "arrayByAddingObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
            v40 = objc_claimAutoreleasedReturnValue();
            v41 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
            v42 = *(void **)(v41 + 40);
            *(_QWORD *)(v41 + 40) = v40;

          }
        }

      }
      if (*(_BYTE *)(a1 + 80))
      {
        v43 = *(void **)(a1 + 48);
        objc_msgSend(*(id *)(a1 + 40), "referenceAssetIdentifier");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "_referenceAssetWithLocalIdentifier:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 48), "_generateTitleForRelatedResults:withGraph:referenceEvent:referenceAsset:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v3, *(_QWORD *)(a1 + 32), v45);
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No moment found for moment %@"), *(_QWORD *)(a1 + 32));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -3, v18);
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v21 = *(void **)(v20 + 40);
      *(_QWORD *)(v20 + 40) = v19;

    }
  }
  else
  {
    +[PGError errorForCode:](PGError, "errorForCode:", -10);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
}

void __74__PGRelatedComputer_relatedCollectionsForAsset_relatedType_options_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  PGRelated *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  PGRelated *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v5 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = 0;

    objc_msgSend(v3, "momentNodeForMoment:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No moment found for asset %@"), *(_QWORD *)(a1 + 40));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -3, v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v24 = *(void **)(v23 + 40);
      *(_QWORD *)(v23 + 40) = v22;

LABEL_25:
      goto LABEL_26;
    }
    v7 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    v8 = objc_msgSend(*(id *)(a1 + 48), "shouldIncludeContainingEventKey");
    if (v8 && objc_msgSend(*(id *)(a1 + 48), "fetchLimit"))
      objc_msgSend(v7, "setFetchLimit:", objc_msgSend(*(id *)(a1 + 48), "fetchLimit") - 1);
    +[PGGraphMatchingOptions optionsWithRelatedType:](PGGraphMatchingOptions, "optionsWithRelatedType:", *(_QWORD *)(a1 + 80));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "searchNodesInGraph:forAsset:inMoment:", v3, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFocusedNodes:", v10);

    objc_msgSend(v3, "matchEvent:options:", v6, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(*(id *)(a1 + 48), "useDiversity");
    v13 = *(void **)(a1 + 56);
    if (v12)
    {
      objc_msgSend(v6, "localStartDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_diverseResultsFromMatchingResults:inGraph:timeShuffleDate:matchingOptions:options:", v11, v3, v14, v9, v7);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "_postProcessMatchingResults:inGraph:matchingOptions:options:", v11, v3, v9, v7);
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v14 = *(void **)(v26 + 40);
      *(_QWORD *)(v26 + 40) = v25;
    }

    if (v8)
    {
      if (objc_msgSend(v9, "targetEventDomain") == 100)
      {
        v27 = -[PGRelated initWithMoment:needsDebugInfo:]([PGRelated alloc], "initWithMoment:needsDebugInfo:", *(_QWORD *)(a1 + 32), 0);
        if (!v27)
          goto LABEL_18;
      }
      else
      {
        if (objc_msgSend(v9, "targetEventDomain") != 102)
          goto LABEL_18;
        v28 = (void *)MEMORY[0x1E0CD1570];
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "photoLibrary");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "fetchOptionsWithPhotoLibrary:orObject:", v29, 0);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        v31 = (void *)MEMORY[0x1E0CD1708];
        v45[0] = *(_QWORD *)(a1 + 32);
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "fetchPhotosHighlightsContainingMoments:options:", v32, v30);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "firstObject");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = -[PGRelated initWithHighlight:needsDebugInfo:]([PGRelated alloc], "initWithHighlight:needsDebugInfo:", v34, 0);
        if (!v27)
          goto LABEL_18;
      }
      v44 = v27;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "arrayByAddingObjectsFromArray:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      v38 = *(void **)(v37 + 40);
      *(_QWORD *)(v37 + 40) = v36;

    }
LABEL_18:
    objc_msgSend(*(id *)(a1 + 48), "referenceAssetIdentifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = *(void **)(a1 + 40);
    if (v39)
    {
      objc_msgSend(v40, "localIdentifier");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "isEqualToString:", v41))
      {
        v42 = *(id *)(a1 + 40);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 56), "_referenceAssetWithLocalIdentifier:", v39);
        v42 = (id)objc_claimAutoreleasedReturnValue();
      }
      v43 = v42;

    }
    else
    {
      v43 = v40;
    }
    objc_msgSend(*(id *)(a1 + 56), "_generateTitleForRelatedResults:withGraph:referenceEvent:referenceAsset:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v3, *(_QWORD *)(a1 + 32), v43);

    goto LABEL_25;
  }
  +[PGError errorForCode:](PGError, "errorForCode:", -10);
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v20 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v18;

LABEL_26:
}

+ (id)stringFromPGRelatedType:(unint64_t)a3
{
  id result;

  result = CFSTR("PGRelatedTypeUnknown");
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      result = CFSTR("PGRelatedTypePeople");
      break;
    case 2uLL:
      result = CFSTR("PGRelatedTypeTime");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
      goto LABEL_6;
    case 4uLL:
      result = CFSTR("PGRelatedTypeLocation");
      break;
    case 7uLL:
      result = CFSTR("PGRelatedTypeFujiTailM1");
      break;
    case 8uLL:
      result = CFSTR("PGRelatedTypeEvent");
      break;
    case 0xFuLL:
      result = CFSTR("PGRelatedTypeFujiTailM2");
      break;
    case 0x10uLL:
      result = CFSTR("PGRelatedTypePlace");
      break;
    default:
      if (a3 == 32)
      {
        result = CFSTR("PGRelatedTypeScene");
      }
      else if (a3 == 63)
      {
        result = CFSTR("PGRelatedTypeAny");
      }
      else
      {
LABEL_6:
        result = CFSTR("invalid");
      }
      break;
  }
  return result;
}

+ (id)searchNodesInGraph:(id)a3 forAsset:(id)a4 inMoment:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  _BOOL8 v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  uint8_t buf[4];
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v7, "_checkCanRead");
  objc_msgSend(v7, "momentNodeForMoment:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v10);
    objc_msgSend(v8, "clsLocation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12 == 0;
    v14 = v12 != 0;
    if (v13)
      v15 = 10000.0;
    else
      v15 = 1.79769313e308;
    v39 = v9;
    +[PGAssetLocationResolver closestAssetLocationForAsset:inAssetCollection:](PGAssetLocationResolver, "closestAssetLocationForAsset:inAssetCollection:", v8, v9);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)v16;
    +[PGAssetLocationResolver closestAddressNodeFromMomentNodes:toLocation:withMaximumDistance:allowRemoteLocations:](PGAssetLocationResolver, "closestAddressNodeFromMomentNodes:toLocation:withMaximumDistance:allowRemoteLocations:", v17, v16, v14, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = MEMORY[0x1E0C809B0];
    if (v18)
    {
      objc_msgSend(v11, "addObject:", v18);
      v43[0] = v19;
      v43[1] = 3221225472;
      v43[2] = __58__PGRelatedComputer_searchNodesInGraph_forAsset_inMoment___block_invoke;
      v43[3] = &unk_1E84366E8;
      v44 = v11;
      objc_msgSend(v18, "enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:", v43);

    }
    v37 = v18;
    v20 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8, "clsUnprefetchedPersonLocalIdentifiers");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v40[0] = v19;
    v40[1] = 3221225472;
    v40[2] = __58__PGRelatedComputer_searchNodesInGraph_forAsset_inMoment___block_invoke_3;
    v40[3] = &unk_1E8435398;
    v23 = v22;
    v41 = v23;
    v24 = v11;
    v42 = v24;
    objc_msgSend(v10, "enumeratePersonNodesUsingBlock:", v40);
    objc_msgSend(v8, "cls_localDate");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dateNodes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dateNodeForLocalDate:", v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27 && objc_msgSend(v26, "containsObject:", v27))
    {
      objc_msgSend(v24, "addObject:", v27);
    }
    else
    {
      v36 = v23;
      objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", -1, v25);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dateNodeForLocalDate:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29 && objc_msgSend(v26, "containsObject:", v29))
      {
        objc_msgSend(v24, "addObject:", v29);
        v27 = v29;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", 1, v25);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "dateNodeForLocalDate:", v33);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27 && objc_msgSend(v26, "containsObject:", v27))
          objc_msgSend(v24, "addObject:", v27);

      }
      v23 = v36;

    }
    objc_msgSend(v10, "weekendNode");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
      objc_msgSend(v24, "addObject:", v34);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v24);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v39;
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "loggingConnection");
    v31 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v8;
      _os_log_error_impl(&dword_1CA237000, v31, OS_LOG_TYPE_ERROR, "Cannot find moment node for asset %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v32;
}

void __58__PGRelatedComputer_searchNodesInGraph_forAsset_inMoment___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a2;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__64889;
  v19 = __Block_byref_object_dispose__64890;
  v6 = a3;
  v20 = v6;
  if (v6)
  {
    v7 = objc_msgSend(v5, "domain");
    v8 = *(void **)(a1 + 32);
    v9 = v16[5];
    if (v7 == 200)
    {
      objc_msgSend(v8, "addObject:", v9);
      v10 = MEMORY[0x1E0C809B0];
      while (objc_msgSend((id)v16[5], "outEdgesCount"))
      {
        v11 = (void *)v16[5];
        v12[0] = v10;
        v12[1] = 3221225472;
        v12[2] = __58__PGRelatedComputer_searchNodesInGraph_forAsset_inMoment___block_invoke_2;
        v12[3] = &unk_1E8435370;
        v14 = &v15;
        v13 = *(id *)(a1 + 32);
        objc_msgSend(v11, "enumerateNeighborEdgesAndNodesThroughOutEdgesUsingBlock:", v12);

      }
    }
    else
    {
      objc_msgSend(v8, "addObject:", v9);
    }
  }
  _Block_object_dispose(&v15, 8);

}

void __58__PGRelatedComputer_searchNodesInGraph_forAsset_inMoment___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "localIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length") && objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v4);

}

void __58__PGRelatedComputer_searchNodesInGraph_forAsset_inMoment___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  int v8;
  id v9;

  v9 = a3;
  v8 = objc_msgSend(a2, "domain");
  if (v9 && v8 == 200)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
    objc_msgSend(*(id *)(a1 + 32), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    *a4 = 1;
  }

}

@end
