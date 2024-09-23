@implementation PGGraphDataModelEnrichmentManager

- (PGGraphDataModelEnrichmentManager)initWithManager:(id)a3 enrichmentContext:(unint64_t)a4
{
  id v6;
  void *v7;
  PGGraphDataModelEnrichmentManager *v8;

  v6 = a3;
  +[PGGraphDataModelEnrichmentManager enrichmentProcessorsForDataModelEnrichmentContext:](PGGraphDataModelEnrichmentManager, "enrichmentProcessorsForDataModelEnrichmentContext:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PGGraphDataModelEnrichmentManager initWithManager:enrichmentProcessors:](self, "initWithManager:enrichmentProcessors:", v6, v7);

  if (v8)
    v8->_enrichmentContext = a4;

  return v8;
}

- (PGGraphDataModelEnrichmentManager)initWithManager:(id)a3 enrichmentProcessors:(id)a4
{
  id v7;
  id v8;
  PGGraphDataModelEnrichmentManager *v9;
  PGGraphDataModelEnrichmentManager *v10;
  id v11;
  void *v12;
  uint64_t v13;
  CLSCurationContext *curationContext;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PGGraphDataModelEnrichmentManager;
  v9 = -[PGGraphDataModelEnrichmentManager init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_enrichmentProcessors, a4);
    objc_storeStrong((id *)&v10->_manager, a3);
    v10->_enrichmentContext = 0;
    v11 = objc_alloc(MEMORY[0x1E0D77E08]);
    -[PGManager photoLibrary](v10->_manager, "photoLibrary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "initWithPhotoLibrary:", v12);
    curationContext = v10->_curationContext;
    v10->_curationContext = (CLSCurationContext *)v13;

    v10->_forceRun = 0;
  }

  return v10;
}

- (BOOL)enrichDataModelForHighlightUUIDs:(id)a3 withError:(id *)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  PGGraphUpdate *v10;
  void *v11;
  PGGraphUpdate *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  PGGraphHighlightChange *v19;
  PGGraphHighlightChange *v20;
  BOOL v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = [PGGraphUpdate alloc];
  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PGGraphUpdate initWithPhotoLibrary:updateType:](v10, "initWithPhotoLibrary:updateType:", v11, 0);

  -[PGGraphUpdate setIsResumingFullAnalysis:](v12, "setIsResumingFullAnalysis:", 0);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v17);
        v19 = [PGGraphHighlightChange alloc];
        v20 = -[PGGraphHighlightChange initWithHighlightUUID:updateTypes:](v19, "initWithHighlightUUID:updateTypes:", v18, 127, (_QWORD)v23);
        -[PGGraphUpdate addChange:](v12, "addChange:", v20);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v15);
  }

  v21 = -[PGGraphDataModelEnrichmentManager _enrichDataModelWithGraphUpdateInventory:error:progressBlock:](self, "_enrichDataModelWithGraphUpdateInventory:error:progressBlock:", v12, a4, v9);
  return v21;
}

- (BOOL)enrichDataModelWithError:(id *)a3 progressBlock:(id)a4
{
  id v6;
  PGGraphUpdate *v7;
  void *v8;
  PGGraphUpdate *v9;

  v6 = a4;
  v7 = [PGGraphUpdate alloc];
  -[PGManager photoLibrary](self->_manager, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PGGraphUpdate initWithPhotoLibrary:updateType:](v7, "initWithPhotoLibrary:updateType:", v8, 4);

  -[PGGraphUpdate setIsResumingFullAnalysis:](v9, "setIsResumingFullAnalysis:", 1);
  LOBYTE(a3) = -[PGGraphDataModelEnrichmentManager _enrichDataModelWithGraphUpdateInventory:error:progressBlock:](self, "_enrichDataModelWithGraphUpdateInventory:error:progressBlock:", v9, a3, v6);

  return (char)a3;
}

- (BOOL)_enrichDataModelWithGraphUpdateInventory:(id)a3 error:(id *)a4 progressBlock:(id)a5
{
  NSArray *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id WeakRetained;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  double v22;
  double v23;
  uint64_t v24;
  char *v25;
  void *v26;
  CLSCurationContext *curationContext;
  PGManager *v28;
  uint64_t v29;
  int v30;
  id v31;
  uint64_t v32;
  uint32_t denom;
  uint32_t numer;
  NSObject *v35;
  NSObject *v36;
  PGManager *manager;
  id v39;
  uint64_t v40;
  os_signpost_id_t spid;
  unint64_t v42;
  id *v43;
  NSObject *oslog;
  NSArray *obj;
  char v46;
  id v47;
  id v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  _BYTE *v52;
  double v53;
  double v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  mach_timebase_info info;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint64_t v64;
  uint8_t v65[4];
  const char *v66;
  __int16 v67;
  double v68;
  uint8_t v69[128];
  _BYTE buf[24];
  char v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v48 = a5;
  if (-[NSArray count](self->_enrichmentProcessors, "count"))
  {
    if (!a4)
    {
      v64 = 0;
      a4 = (id *)&v64;
    }
    v43 = a4;
    -[PGManager enrichmentLoggingConnection](self->_manager, "enrichmentLoggingConnection");
    oslog = objc_claimAutoreleasedReturnValue();
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    v8 = self->_enrichmentProcessors;
    v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
    if (v9)
    {
      v10 = 0;
      v11 = *(_QWORD *)v61;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v61 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) == 0)
          {

            goto LABEL_18;
          }
          if ((v10 & 1) != 0)
            v10 = 1;
          else
            v10 = objc_msgSend(v13, "requiresValidGraph");
        }
        v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v60, v72, 16);
        if (v9)
          continue;
        break;
      }

      if ((v10 & 1) == 0)
        goto LABEL_24;
LABEL_18:
      if (!-[PGManager isReadyWithError:](self->_manager, "isReadyWithError:", v43))
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          manager = self->_manager;
          v39 = *v43;
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = manager;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v39;
          _os_log_error_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_ERROR, "DataModelEnrichment failed because DataModelEnrichmentManager has no graph - graph manager: %@, error: %@", buf, 0x16u);
        }
        v46 = 0;
LABEL_54:

        goto LABEL_55;
      }
    }
    else
    {

LABEL_24:
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_INFO, "DataModelEnrichmentManager skip graph is ready check", buf, 2u);
      }
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v71 = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v15 = oslog;
    v16 = os_signpost_id_generate(v15);
    v17 = v15;
    v18 = v17;
    spid = v16;
    v42 = v16 - 1;
    if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      *(_WORD *)v65 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "EnrichDataModelWithEnrichmentProcessors", ", v65, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v40 = mach_absolute_time();
    v19 = -[NSArray count](self->_enrichmentProcessors, "count");
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    obj = self->_enrichmentProcessors;
    v20 = 0;
    v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    if (!v21)
    {
      v46 = 1;
LABEL_48:

      v31 = objc_retainAutorelease(v20);
      *v43 = v31;
      v32 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v35 = v18;
      v36 = v35;
      if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        *(_WORD *)v65 = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v36, OS_SIGNPOST_INTERVAL_END, spid, "EnrichDataModelWithEnrichmentProcessors", ", v65, 2u);
      }

      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v65 = 136315394;
        v66 = "EnrichDataModelWithEnrichmentProcessors";
        v67 = 2048;
        v68 = (float)((float)((float)((float)(v32 - v40) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v65, 0x16u);
      }
      objc_msgSend(WeakRetained, "enrichmentManager:didFinishEnrichmentSuccessfully:", self, v46 & 1);

      _Block_object_dispose(buf, 8);
      goto LABEL_54;
    }
    v22 = 1.0 / (double)v19;
    v49 = *(_QWORD *)v56;
    v23 = 0.0;
    v46 = 1;
LABEL_31:
    v24 = 0;
    while (1)
    {
      if (*(_QWORD *)v56 != v49)
        objc_enumerationMutation(obj);
      v25 = *(char **)(*((_QWORD *)&v55 + 1) + 8 * v24);
      v26 = (void *)MEMORY[0x1CAA4EB2C]();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v65 = 138412290;
        v66 = v25;
        _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "DataModelEnrichment - enriching data model with processor: %@", v65, 0xCu);
      }
      if (!self->_forceRun
        && WeakRetained
        && !objc_msgSend(WeakRetained, "enrichmentManager:shouldRunProcessor:", self, v25))
      {
        goto LABEL_42;
      }
      curationContext = self->_curationContext;
      v28 = self->_manager;
      v50[0] = MEMORY[0x1E0C809B0];
      v50[1] = 3221225472;
      v50[2] = __98__PGGraphDataModelEnrichmentManager__enrichDataModelWithGraphUpdateInventory_error_progressBlock___block_invoke;
      v50[3] = &unk_1E8433960;
      v53 = v23;
      v54 = v22;
      v51 = v48;
      v52 = buf;
      objc_msgSend(v25, "enrichDataModelWithManager:curationContext:graphUpdateInventory:progressBlock:", v28, curationContext, v47, v50);
      if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
        break;
      +[PGError errorForCode:](PGError, "errorForCode:", -4);
      v29 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "enrichmentManager:didCancelProcessor:", self, v25);
      v46 = 0;
      v30 = 0;
      v20 = (void *)v29;
LABEL_43:
      objc_autoreleasePoolPop(v26);
      if (!v30)
        goto LABEL_48;
      if (v21 == ++v24)
      {
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
        if (!v21)
          goto LABEL_48;
        goto LABEL_31;
      }
    }
    objc_msgSend(WeakRetained, "enrichmentManager:didRunProcessor:", self, v25);

LABEL_42:
    v23 = v22 + v23;
    v30 = 1;
    goto LABEL_43;
  }
  v46 = 1;
LABEL_55:

  return v46 & 1;
}

- (NSArray)enrichmentProcessors
{
  return self->_enrichmentProcessors;
}

- (unint64_t)enrichmentContext
{
  return self->_enrichmentContext;
}

- (CLSCurationContext)curationContext
{
  return self->_curationContext;
}

- (PGManager)manager
{
  return self->_manager;
}

- (PGGraphDataModelEnrichmentManagerDelegate)delegate
{
  return (PGGraphDataModelEnrichmentManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)forceRun
{
  return self->_forceRun;
}

- (void)setForceRun:(BOOL)a3
{
  self->_forceRun = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_enrichmentProcessors, 0);
}

uint64_t __98__PGGraphDataModelEnrichmentManager__enrichDataModelWithGraphUpdateInventory_error_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 48) + *(double *)(a1 + 56) * a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *a2;
  return result;
}

+ (id)backgroundEnrichmentProcessors
{
  return (id)objc_msgSend(a1, "_allEnrichmentProcessorsWithTailorOptions:", 255);
}

+ (id)_allEnrichmentProcessorsWithTailorOptions:(unint64_t)a3
{
  PGGraphPeopleSuggestionEnrichmentProcessor *v4;
  PGGraphPhotosHighlightEnrichmentProcessor *v5;
  PGGraphHighlightCollectionEnrichmentProcessor *v6;
  PGGraphSearchEnrichmentProcessor *v7;
  PGGraphAssetRevGeocodeEnrichmentProcessor *v8;
  PGGraphUserBehaviorEnrichmentProcessor *v9;
  PGGraphPortraitDonationEnrichmentProcessor *v10;
  void *v11;
  _QWORD v13[8];

  v13[7] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(PGGraphPeopleSuggestionEnrichmentProcessor);
  v5 = -[PGGraphPhotosHighlightEnrichmentProcessor initWithHighlightTailorOptions:]([PGGraphPhotosHighlightEnrichmentProcessor alloc], "initWithHighlightTailorOptions:", a3, v4);
  v13[1] = v5;
  v6 = objc_alloc_init(PGGraphHighlightCollectionEnrichmentProcessor);
  v13[2] = v6;
  v7 = objc_alloc_init(PGGraphSearchEnrichmentProcessor);
  v13[3] = v7;
  v8 = objc_alloc_init(PGGraphAssetRevGeocodeEnrichmentProcessor);
  v13[4] = v8;
  v9 = objc_alloc_init(PGGraphUserBehaviorEnrichmentProcessor);
  v13[5] = v9;
  v10 = objc_alloc_init(PGGraphPortraitDonationEnrichmentProcessor);
  v13[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (NSArray)lightWeightEnrichmentProcessors
{
  PGGraphPhotosHighlightEnrichmentProcessor *v2;
  PGGraphHighlightCollectionEnrichmentProcessor *v3;
  PGGraphAssetRevGeocodeEnrichmentProcessor *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = -[PGGraphPhotosHighlightEnrichmentProcessor initWithHighlightTailorOptions:]([PGGraphPhotosHighlightEnrichmentProcessor alloc], "initWithHighlightTailorOptions:", 255);
  v7[0] = v2;
  v3 = objc_alloc_init(PGGraphHighlightCollectionEnrichmentProcessor);
  v7[1] = v3;
  v4 = objc_alloc_init(PGGraphAssetRevGeocodeEnrichmentProcessor);
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

+ (id)liveUpdateEnrichmentProcessors
{
  PGGraphPeopleSuggestionEnrichmentProcessor *v2;
  PGGraphPhotosHighlightEnrichmentProcessor *v3;
  PGGraphHighlightCollectionEnrichmentProcessor *v4;
  PGGraphAssetRevGeocodeEnrichmentProcessor *v5;
  PGGraphSearchEnrichmentProcessor *v6;
  void *v7;
  _QWORD v9[6];

  v9[5] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(PGGraphPeopleSuggestionEnrichmentProcessor);
  v3 = -[PGGraphPhotosHighlightEnrichmentProcessor initWithHighlightTailorOptions:]([PGGraphPhotosHighlightEnrichmentProcessor alloc], "initWithHighlightTailorOptions:", 255, v2);
  v9[1] = v3;
  v4 = objc_alloc_init(PGGraphHighlightCollectionEnrichmentProcessor);
  v9[2] = v4;
  v5 = objc_alloc_init(PGGraphAssetRevGeocodeEnrichmentProcessor);
  v9[3] = v5;
  v6 = objc_alloc_init(PGGraphSearchEnrichmentProcessor);
  v9[4] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)enrichmentProcessorsForDataModelEnrichmentContext:(unint64_t)a3
{
  void *v3;

  if (a3 == 3)
  {
    objc_msgSend(a1, "liveUpdateEnrichmentProcessors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3 == 1)
  {
    objc_msgSend(a1, "backgroundEnrichmentProcessors");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v3;
}

@end
