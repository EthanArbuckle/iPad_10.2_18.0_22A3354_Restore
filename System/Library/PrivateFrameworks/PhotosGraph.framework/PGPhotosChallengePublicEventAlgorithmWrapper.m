@implementation PGPhotosChallengePublicEventAlgorithmWrapper

- (PGPhotosChallengePublicEventAlgorithmWrapper)initWithEvaluationContext:(id)a3
{
  id v4;
  PGPhotosChallengePublicEventAlgorithmWrapper *v5;
  uint64_t v6;
  PGGraph *graph;
  uint64_t v8;
  PHPhotoLibrary *photoLibrary;
  uint64_t v10;
  CLSServiceManager *serviceManager;
  uint64_t v12;
  CLSPublicEventManager *publicEventManager;
  PGPublicEventDisambiguator *v14;
  void *v15;
  uint64_t v16;
  PGPublicEventDisambiguator *publicEventDisambiguator;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PGPhotosChallengePublicEventAlgorithmWrapper;
  v5 = -[PGPhotosChallengePublicEventAlgorithmWrapper init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "graph");
    v6 = objc_claimAutoreleasedReturnValue();
    graph = v5->_graph;
    v5->_graph = (PGGraph *)v6;

    objc_msgSend(v4, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v5->_photoLibrary;
    v5->_photoLibrary = (PHPhotoLibrary *)v8;

    objc_msgSend(v4, "serviceManager");
    v10 = objc_claimAutoreleasedReturnValue();
    serviceManager = v5->_serviceManager;
    v5->_serviceManager = (CLSServiceManager *)v10;

    objc_msgSend(v4, "publicEventManager");
    v12 = objc_claimAutoreleasedReturnValue();
    publicEventManager = v5->_publicEventManager;
    v5->_publicEventManager = (CLSPublicEventManager *)v12;

    v14 = [PGPublicEventDisambiguator alloc];
    objc_msgSend(v4, "sceneTaxonomy");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PGPublicEventDisambiguator initWithSceneTaxonomy:](v14, "initWithSceneTaxonomy:", v15);
    publicEventDisambiguator = v5->_publicEventDisambiguator;
    v5->_publicEventDisambiguator = (PGPublicEventDisambiguator *)v16;

  }
  return v5;
}

- (unsigned)predictedQuestionStateForAssetUUID:(id)a3 publicEventMUID:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  unsigned __int16 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  PGPublicEventDisambiguator *publicEventDisambiguator;
  PGGraphMomentNodeCollection *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  PGMeaningfulEventProcessorCache *v24;
  void *v25;
  PGMeaningfulEventProcessorCache *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  id v50;
  id v51;
  uint8_t v52[128];
  uint8_t buf[4];
  void *v54;
  _QWORD v55[4];

  v55[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CD1390];
  v55[0] = v6;
  v9 = 1;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchAssetsWithUUIDs:options:", v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsContainingAsset:withType:options:", v12, 3, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[PGGraph momentNodeForMoment:](self->_graph, "momentNodeForMoment:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[CLSPublicEventManager cachedPublicEventsForMuid:](self->_publicEventManager, "cachedPublicEventsForMuid:", a4);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v16, "count"))
        {
          v41 = v14;
          v42 = v12;
          v43 = v7;
          v44 = v6;
          -[PGGraph largeFrequentLocationNodes](self->_graph, "largeFrequentLocationNodes");
          v17 = objc_claimAutoreleasedReturnValue();
          publicEventDisambiguator = self->_publicEventDisambiguator;
          v19 = -[MANodeCollection initWithNode:]([PGGraphMomentNodeCollection alloc], "initWithNode:", v15);
          v50 = 0;
          v51 = 0;
          v49 = 0;
          v40 = (void *)v17;
          -[PGPublicEventDisambiguator collectConsolidatedAddressesForMomentNodes:largeFrequentLocationNodes:consolidatedAddresses:consolidatedAddressesByMomentIdentifier:momentNodesForConsolidatedAddresses:progressBlock:](publicEventDisambiguator, "collectConsolidatedAddressesForMomentNodes:largeFrequentLocationNodes:consolidatedAddresses:consolidatedAddressesByMomentIdentifier:momentNodesForConsolidatedAddresses:progressBlock:", v19, v17, &v51, &v50, &v49, &__block_literal_global_10265);
          v39 = v51;
          v20 = v50;
          v37 = v49;

          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "identifier"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = v20;
          objc_msgSend(v20, "objectForKeyedSubscript:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          v24 = [PGMeaningfulEventProcessorCache alloc];
          objc_msgSend(v15, "collection");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = -[PGMeaningfulEventProcessorCache initWithMomentNodes:](v24, "initWithMomentNodes:", v25);

          v47 = 0u;
          v48 = 0u;
          v45 = 0u;
          v46 = 0u;
          v27 = v23;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v46;
            do
            {
              for (i = 0; i != v29; ++i)
              {
                if (*(_QWORD *)v46 != v30)
                  objc_enumerationMutation(v27);
                -[PGPublicEventDisambiguator disambiguateEvents:forTimeLocationTuple:momentNode:graph:meaningfulEventProcessorCache:serviceManager:](self->_publicEventDisambiguator, "disambiguateEvents:forTimeLocationTuple:momentNode:graph:meaningfulEventProcessorCache:serviceManager:", v16, *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i), v15, self->_graph, v26, self->_serviceManager, v37);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "unionSet:", v32);

              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
            }
            while (v29);
          }

          v33 = objc_msgSend(v21, "count");
          if (v33 == objc_msgSend(v16, "count"))
            v9 = 2;
          else
            v9 = 3;

          v7 = v43;
          v6 = v44;
          v14 = v41;
          v12 = v42;
        }
        else
        {
          v9 = 1;
        }

      }
      else
      {
        v9 = 1;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v14, "uuid");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v54 = v35;
          v9 = 1;
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PublicEvents] No moment node found for moment with uuid: %@, skipping", buf, 0xCu);

        }
      }

    }
    else
    {
      v9 = 1;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v12, "uuid");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v54 = v34;
        v9 = 1;
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PublicEvents] No moment found for asset with uuid: %@, skipping", buf, 0xCu);

      }
    }

  }
  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicEventDisambiguator, 0);
  objc_storeStrong((id *)&self->_publicEventManager, 0);
  objc_storeStrong((id *)&self->_serviceManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

@end
