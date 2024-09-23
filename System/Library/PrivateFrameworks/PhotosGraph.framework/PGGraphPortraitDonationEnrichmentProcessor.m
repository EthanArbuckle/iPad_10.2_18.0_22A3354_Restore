@implementation PGGraphPortraitDonationEnrichmentProcessor

+ (NSString)graphDonationBundleId
{
  return (NSString *)CFSTR("com.apple.mobileslideshow");
}

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  _BOOL4 v17;
  uint64_t v18;
  uint32_t denom;
  uint32_t numer;
  NSObject *v21;
  NSObject *v22;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  v11 = a5;
  objc_msgSend(v9, "enrichmentLoggingConnection");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGGraphPortraitDonationEnrichmentProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v16 = mach_absolute_time();
  v17 = -[PGGraphPortraitDonationEnrichmentProcessor _shouldProcessGraphUpdate:](self, "_shouldProcessGraphUpdate:", v11);

  if (v17)
    -[PGGraphPortraitDonationEnrichmentProcessor _donateKnowledgeWithManager:progressBlock:](self, "_donateKnowledgeWithManager:progressBlock:", v9, v10);
  v18 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v21 = v15;
  v22 = v21;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v22, OS_SIGNPOST_INTERVAL_END, v13, "PGGraphPortraitDonationEnrichmentProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "PGGraphPortraitDonationEnrichmentProcessor";
    v26 = 2048;
    v27 = (float)((float)((float)((float)(v18 - v16) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (BOOL)_shouldProcessGraphUpdate:(id)a3
{
  return objc_msgSend(a3, "isResumingFullAnalysis");
}

- (void)_donateKnowledgeWithManager:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint32_t denom;
  uint32_t numer;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  NSObject *v25;
  PGGraphPortraitDonationEnrichmentProcessor *v26;
  id v27;
  uint8_t *v28;
  uint8_t buf[8];
  uint8_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  mach_timebase_info info;
  uint8_t v36[4];
  const char *v37;
  __int16 v38;
  double v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "enrichmentLoggingConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SiriPortraitDonation", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v12 = mach_absolute_time();
  *(_QWORD *)buf = 0;
  v30 = buf;
  v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__16587;
  v33 = __Block_byref_object_dispose__16588;
  v34 = 0;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __88__PGGraphPortraitDonationEnrichmentProcessor__donateKnowledgeWithManager_progressBlock___block_invoke;
  v24 = &unk_1E8429F40;
  v13 = v11;
  v25 = v13;
  v14 = v7;
  v26 = self;
  v27 = v14;
  v28 = buf;
  objc_msgSend(v6, "performSynchronousConcurrentGraphReadUsingBlock:", &v21);
  if (*((_QWORD *)v30 + 5))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date", v21, v22, v23, v24, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphPortraitDonationEnrichmentProcessor _donateKnowledge:donationDate:loggingConnection:](self, "_donateKnowledge:donationDate:loggingConnection:", *((_QWORD *)v30 + 5), v15, v13);

  }
  v16 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v19 = v13;
  v20 = v19;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)v36 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v20, OS_SIGNPOST_INTERVAL_END, v9, "SiriPortraitDonation", ", v36, 2u);
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v36 = 136315394;
    v37 = "SiriPortraitDonation";
    v38 = 2048;
    v39 = (float)((float)((float)((float)(v16 - v12) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v36, 0x16u);
  }

  _Block_object_dispose(buf, 8);
}

- (void)_prepareForKnowledgeDonation
{
  NSCountedSet *v3;
  NSCountedSet *meaningNodes;
  NSCountedSet *v5;
  NSCountedSet *poiNodes;
  NSCountedSet *v7;
  NSCountedSet *roiNodes;
  NSCountedSet *v9;
  NSCountedSet *businessNodes;
  NSCountedSet *v11;
  NSCountedSet *publicEventNodes;
  NSCountedSet *v13;
  NSCountedSet *performerNodes;
  NSMutableDictionary *v15;
  NSMutableDictionary *datesByAddressNode;
  NSCountedSet *v17;
  NSCountedSet *addressNodes;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v3 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  meaningNodes = self->_meaningNodes;
  self->_meaningNodes = v3;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v5 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  poiNodes = self->_poiNodes;
  self->_poiNodes = v5;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v7 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  roiNodes = self->_roiNodes;
  self->_roiNodes = v7;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v9 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  businessNodes = self->_businessNodes;
  self->_businessNodes = v9;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v11 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  publicEventNodes = self->_publicEventNodes;
  self->_publicEventNodes = v11;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v13 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  performerNodes = self->_performerNodes;
  self->_performerNodes = v13;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  datesByAddressNode = self->_datesByAddressNode;
  self->_datesByAddressNode = v15;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v17 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
  addressNodes = self->_addressNodes;
  self->_addressNodes = v17;

}

- (void)_accumulateKnowledgeNodesFromMomentNodes:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  void (**v10)(void *, _BYTE *, double);
  NSCountedSet *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double Current;
  int v35;
  id v36;
  id v37;
  NSCountedSet *v38;
  NSCountedSet *v39;
  NSCountedSet *v40;
  NSCountedSet *v41;
  id obj;
  NSCountedSet *v43;
  NSCountedSet *v44;
  NSMutableDictionary *v45;
  _QWORD v46[4];
  NSCountedSet *v47;
  _QWORD v48[4];
  NSCountedSet *v49;
  _QWORD v50[4];
  NSCountedSet *v51;
  NSCountedSet *v52;
  _QWORD v53[4];
  NSCountedSet *v54;
  _QWORD v55[4];
  NSCountedSet *v56;
  unsigned __int8 v57;
  _QWORD v58[4];
  NSMutableDictionary *v59;
  NSCountedSet *v60;
  double v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  int v67;
  __int16 v68;
  const char *v69;
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "count");
  if (v8)
  {
    v9 = v8;
    v36 = v7;
    v10 = (void (**)(void *, _BYTE *, double))_Block_copy(v7);
    v44 = self->_meaningNodes;
    v38 = self->_poiNodes;
    v39 = self->_roiNodes;
    v43 = self->_businessNodes;
    v41 = self->_publicEventNodes;
    v40 = self->_performerNodes;
    v45 = self->_datesByAddressNode;
    v11 = self->_addressNodes;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v37 = v6;
    obj = v6;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
    if (!v12)
      goto LABEL_63;
    v13 = v12;
    v14 = 0;
    v15 = MEMORY[0x1E0C809B0];
    v16 = 0.3 / (double)v9 / 7.0;
    v17 = *(_QWORD *)v63;
    v18 = 0.0;
    v19 = 0.2;
    while (1)
    {
      v20 = 0;
      v21 = v18;
      do
      {
        if (*(_QWORD *)v63 != v17)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v20);
        v23 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v22, "localStartDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSince1970");
        v26 = v25;

        objc_msgSend(v22, "universalStartDate");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timeIntervalSince1970");
        v29 = v28;

        v58[0] = v15;
        v58[1] = 3221225472;
        v58[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke;
        v58[3] = &unk_1E8429F68;
        v61 = v26 - v29;
        v59 = v45;
        v60 = v11;
        objc_msgSend(v22, "enumerateAddressEdgesAndNodesUsingBlock:", v58);
        v19 = v16 + v19;
        if (!v10 || (v18 = CFAbsoluteTimeGetCurrent(), v18 - v21 < 0.01))
        {
          v18 = v21;
LABEL_10:
          v55[0] = v15;
          v55[1] = 3221225472;
          v55[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_218;
          v55[3] = &unk_1E84322A8;
          v56 = v44;
          objc_msgSend(v22, "enumerateMeaningNodesUsingBlock:", v55);
          v19 = v16 + v19;
          if (v10 && (v30 = CFAbsoluteTimeGetCurrent(), v30 - v18 >= 0.01))
          {
            v57 = 0;
            v10[2](v10, &v57, v19);
            if (!(v57 | v14 & 1))
            {
              v14 = 0;
              goto LABEL_13;
            }
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v67 = 256;
              v68 = 2080;
              v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
            v14 = 1;
            v35 = 1;
          }
          else
          {
            v30 = v18;
LABEL_13:
            v53[0] = v15;
            v53[1] = 3221225472;
            v53[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_220;
            v53[3] = &unk_1E84320E8;
            v54 = v43;
            objc_msgSend(v22, "enumerateBusinessNodesUsingBlock:", v53);
            v19 = v16 + v19;
            if (v10 && (v31 = CFAbsoluteTimeGetCurrent(), v31 - v30 >= 0.01))
            {
              v57 = 0;
              v10[2](v10, &v57, v19);
              if (!(v57 | v14 & 1))
              {
                v14 = 0;
                goto LABEL_16;
              }
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v67 = 262;
                v68 = 2080;
                v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/"
                      "Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              v14 = 1;
              v35 = 1;
            }
            else
            {
              v31 = v30;
LABEL_16:
              v50[0] = v15;
              v50[1] = 3221225472;
              v50[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_222;
              v50[3] = &unk_1E8429F90;
              v51 = v41;
              v52 = v40;
              objc_msgSend(v22, "enumeratePublicEventNodesUsingBlock:", v50);
              v19 = v16 + v19;
              if (v10 && (v32 = CFAbsoluteTimeGetCurrent(), v32 - v31 >= 0.01))
              {
                v57 = 0;
                v10[2](v10, &v57, v19);
                if (!(v57 | v14 & 1))
                {
                  v14 = 0;
                  goto LABEL_19;
                }
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  v67 = 272;
                  v68 = 2080;
                  v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }
                v14 = 1;
                v35 = 1;
              }
              else
              {
                v32 = v31;
LABEL_19:
                v48[0] = v15;
                v48[1] = 3221225472;
                v48[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_225;
                v48[3] = &unk_1E84320C0;
                v49 = v39;
                objc_msgSend(v22, "enumerateROINodesUsingBlock:", v48);
                v19 = v16 + v19;
                if (v10 && (v33 = CFAbsoluteTimeGetCurrent(), v33 - v32 >= 0.01))
                {
                  v57 = 0;
                  v10[2](v10, &v57, v19);
                  if (!(v57 | v14 & 1))
                  {
                    v14 = 0;
                    goto LABEL_22;
                  }
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    v67 = 278;
                    v68 = 2080;
                    v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }
                  v14 = 1;
                  v35 = 1;
                }
                else
                {
                  v33 = v32;
LABEL_22:
                  v46[0] = v15;
                  v46[1] = 3221225472;
                  v46[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_227;
                  v46[3] = &unk_1E8432098;
                  v47 = v38;
                  objc_msgSend(v22, "enumeratePOINodesUsingBlock:", v46);
                  v19 = v16 + v19;
                  if (v10 && (Current = CFAbsoluteTimeGetCurrent(), Current - v33 >= 0.01))
                  {
                    v57 = 0;
                    v10[2](v10, &v57, v19);
                    if (v57 | v14 & 1)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 67109378;
                        v67 = 284;
                        v68 = 2080;
                        v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                      }
                      v14 = 1;
                      v35 = 1;
                    }
                    else
                    {
                      v14 = 0;
                      v35 = 0;
                    }
                  }
                  else
                  {
                    v35 = 0;
                    Current = v33;
                  }

                  v33 = Current;
                }

                v32 = v33;
              }

              v31 = v32;
            }

            v30 = v31;
          }

          v18 = v30;
          goto LABEL_60;
        }
        v57 = 0;
        v10[2](v10, &v57, v19);
        if (!(v57 | v14 & 1))
        {
          v14 = 0;
          goto LABEL_10;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v67 = 250;
          v68 = 2080;
          v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/"
                "Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v14 = 1;
        v35 = 1;
LABEL_60:

        objc_autoreleasePoolPop(v23);
        if (v35)
          goto LABEL_63;
        ++v20;
        v21 = v18;
      }
      while (v13 != v20);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v70, 16);
      if (!v13)
      {
LABEL_63:

        v7 = v36;
        v6 = v37;
        break;
      }
    }
  }

}

- (id)_knowledgeToDonateFromAccumulatedNodesWithProgressBlock:(id)a3
{
  id v4;
  void (**v5)(void *, _BYTE *, double);
  void *v6;
  double v7;
  double v8;
  PGGraphPortraitKnowledgeToDonate *v9;
  void *v10;
  double Current;
  void *v12;
  double v13;
  void *v14;
  double v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  char v28;
  double v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(void *, _BYTE *, double))_Block_copy(v4);
  v29 = 0.5;
  -[PGGraphPortraitDonationEnrichmentProcessor _locationNamedEntitiesFromAddressNodes:dates:currentProgress:progressFraction:progressBlock:](self, "_locationNamedEntitiesFromAddressNodes:dates:currentProgress:progressFraction:progressBlock:", self->_addressNodes, self->_datesByAddressNode, &v29, v4, 0.0714285714);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0.0;
  if (!v5 || (v8 = CFAbsoluteTimeGetCurrent(), v8 < 0.01))
  {
LABEL_8:
    -[PGGraphPortraitDonationEnrichmentProcessor _topicsFromTopicNodes:currentProgress:progressFraction:progressBlock:](self, "_topicsFromTopicNodes:currentProgress:progressFraction:progressBlock:", self->_meaningNodes, &v29, v4, 0.0714285714);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v7 >= 0.01)
      {
        v28 = 0;
        v5[2](v5, &v28, v29);
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v31 = 300;
            v32 = 2080;
            v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v9 = 0;
          goto LABEL_55;
        }
        v7 = Current;
      }
    }
    -[PGGraphPortraitDonationEnrichmentProcessor _topicsFromTopicNodes:currentProgress:progressFraction:progressBlock:](self, "_topicsFromTopicNodes:currentProgress:progressFraction:progressBlock:", self->_roiNodes, &v29, v4, 0.0714285714);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v13 = CFAbsoluteTimeGetCurrent();
      if (v13 - v7 >= 0.01)
      {
        v28 = 0;
        v5[2](v5, &v28, v29);
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v31 = 303;
            v32 = 2080;
            v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v9 = 0;
          goto LABEL_54;
        }
        v7 = v13;
      }
    }
    -[PGGraphPortraitDonationEnrichmentProcessor _topicsFromTopicNodes:currentProgress:progressFraction:progressBlock:](self, "_topicsFromTopicNodes:currentProgress:progressFraction:progressBlock:", self->_poiNodes, &v29, v4, 0.0714285714);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v15 = CFAbsoluteTimeGetCurrent();
      if (v15 - v7 >= 0.01)
      {
        v28 = 0;
        v5[2](v5, &v28, v29);
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v31 = 306;
            v32 = 2080;
            v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v9 = 0;
          goto LABEL_53;
        }
        v7 = v15;
      }
    }
    -[PGGraphPortraitDonationEnrichmentProcessor _namedEntitiesFromNamedEntityNodes:currentProgress:progressFraction:progressBlock:](self, "_namedEntitiesFromNamedEntityNodes:currentProgress:progressFraction:progressBlock:", self->_businessNodes, &v29, v4, 0.0714285714);
    v16 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v16;
    if (v5)
    {
      v17 = CFAbsoluteTimeGetCurrent();
      if (v17 - v7 >= 0.01)
      {
        v28 = 0;
        v5[2](v5, &v28, v29);
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v31 = 309;
            v32 = 2080;
            v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v9 = 0;
          goto LABEL_52;
        }
        v7 = v17;
      }
    }
    -[PGGraphPortraitDonationEnrichmentProcessor _namedEntitiesFromNamedEntityNodes:currentProgress:progressFraction:progressBlock:](self, "_namedEntitiesFromNamedEntityNodes:currentProgress:progressFraction:progressBlock:", self->_publicEventNodes, &v29, v4, 0.0714285714, v16);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v18 = CFAbsoluteTimeGetCurrent();
      if (v18 - v7 >= 0.01)
      {
        v28 = 0;
        v5[2](v5, &v28, v29);
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v31 = 312;
            v32 = 2080;
            v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v9 = 0;
LABEL_51:

LABEL_52:
LABEL_53:

LABEL_54:
LABEL_55:

          goto LABEL_56;
        }
        v7 = v18;
      }
    }
    v19 = v14;
    v20 = v10;
    v21 = v12;
    -[PGGraphPortraitDonationEnrichmentProcessor _namedEntitiesFromNamedEntityNodes:currentProgress:progressFraction:progressBlock:](self, "_namedEntitiesFromNamedEntityNodes:currentProgress:progressFraction:progressBlock:", self->_performerNodes, &v29, v4, 0.0714285714);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 && CFAbsoluteTimeGetCurrent() - v7 >= 0.01 && (v28 = 0, v5[2](v5, &v28, v29), v28))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        v31 = 315;
        v32 = 2080;
        v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Da"
              "ta Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v9 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v16);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObjectsFromArray:", v27);
      objc_msgSend(v23, "addObjectsFromArray:", v22);
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "addEntriesFromDictionary:", v19);
      objc_msgSend(v24, "addEntriesFromDictionary:", v21);
      v9 = -[PGGraphPortraitKnowledgeToDonate initWithTopics:namedEntities:locationNamedEntities:]([PGGraphPortraitKnowledgeToDonate alloc], "initWithTopics:namedEntities:locationNamedEntities:", v24, v23, v6);

      v12 = v21;
    }

    v10 = v20;
    v14 = v19;
    goto LABEL_51;
  }
  v28 = 0;
  v5[2](v5, &v28, v29);
  if (!v28)
  {
    v7 = v8;
    goto LABEL_8;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    v31 = 297;
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data M"
          "odel Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v9 = 0;
LABEL_56:

  return v9;
}

- (void)_donateKnowledge:(id)a3 donationDate:(id)a4 loggingConnection:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  dispatch_block_t v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend((id)objc_opt_class(), "graphDonationBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __94__PGGraphPortraitDonationEnrichmentProcessor__donateKnowledge_donationDate_loggingConnection___block_invoke;
  v17[3] = &unk_1E8434200;
  v18 = v7;
  v19 = v10;
  v20 = v8;
  v21 = v9;
  v11 = v9;
  v12 = v8;
  v13 = v10;
  v14 = v7;
  v15 = dispatch_block_create((dispatch_block_flags_t)0, v17);
  dispatch_get_global_queue(0, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v16, v15);

  dispatch_block_wait(v15, 0x2540BE400uLL);
}

- (id)_topicsFromTopicNodes:(id)a3 currentProgress:(double *)a4 progressFraction:(double)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  void (**v15)(void *, _BYTE *, double);
  double v16;
  double Current;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  double v31;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  char v39;
  uint64_t v40;
  uint8_t v41[128];
  uint8_t buf[4];
  int v43;
  __int16 v44;
  const char *v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  if (!a4)
  {
    v40 = 0;
    a4 = (double *)&v40;
  }
  v11 = objc_msgSend(v9, "count");
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(v9, "pg_accumulatedCount");
    v14 = *a4;
    v15 = (void (**)(void *, _BYTE *, double))_Block_copy(v10);
    v16 = 0.0;
    if (v15)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current >= 0.01)
      {
        v39 = 0;
        v15[2](v15, &v39, v14);
        if (v39)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v43 = 394;
            v44 = 2080;
            v45 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v18 = (id)MEMORY[0x1E0C9AA70];
LABEL_29:

          goto LABEL_30;
        }
        v16 = Current;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v34 = v9;
    v20 = v9;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v21)
    {
      v22 = v21;
      v23 = a5 / (double)v12;
      v24 = *(_QWORD *)v36;
      v25 = (double)v13;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v36 != v24)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          v28 = objc_msgSend(v20, "countForObject:", v27);
          objc_msgSend(v27, "pg_topic");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v28 / v25);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "setObject:forKeyedSubscript:", v30, v29);

            v14 = v23 + v14;
            if (v15)
            {
              v31 = CFAbsoluteTimeGetCurrent();
              if (v31 - v16 >= 0.01)
              {
                v39 = 0;
                v15[2](v15, &v39, v14);
                if (v39)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    v43 = 411;
                    v44 = 2080;
                    v45 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  v18 = (id)MEMORY[0x1E0C9AA70];
                  goto LABEL_28;
                }
                v16 = v31;
              }
            }
          }

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
        if (v22)
          continue;
        break;
      }
    }

    *a4 = v14;
    v18 = v19;
LABEL_28:
    v10 = v33;
    v9 = v34;

    goto LABEL_29;
  }
  v18 = (id)MEMORY[0x1E0C9AA70];
LABEL_30:

  return v18;
}

- (id)_locationNamedEntitiesFromAddressNodes:(id)a3 dates:(id)a4 currentProgress:(double *)a5 progressFraction:(double)a6 progressBlock:(id)a7
{
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  void (**v17)(void *, _BYTE *, double);
  double v18;
  double Current;
  id v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  uint64_t i;
  void *v26;
  unint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  double v38;
  double *v40;
  id v41;
  id v42;
  id v43;
  void (**v44)(void *, _BYTE *, double);
  uint64_t v45;
  uint64_t v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  char v56;
  uint64_t v57;
  _BYTE v58[128];
  uint8_t v59[128];
  uint8_t buf[4];
  int v61;
  __int16 v62;
  const char *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v47 = a4;
  v12 = a7;
  if (!a5)
  {
    v57 = 0;
    a5 = (double *)&v57;
  }
  v13 = objc_msgSend(v11, "count");
  if (v13)
  {
    v14 = v13;
    v15 = objc_msgSend(v11, "pg_accumulatedCount");
    v16 = *a5;
    v17 = (void (**)(void *, _BYTE *, double))_Block_copy(v12);
    v18 = 0.0;
    if (v17)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current >= 0.01)
      {
        v56 = 0;
        v17[2](v17, &v56, v16);
        if (v56)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v61 = 437;
            v62 = 2080;
            v63 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v20 = (id)MEMORY[0x1E0C9AA60];
LABEL_38:

          goto LABEL_39;
        }
        v18 = Current;
      }
    }
    v42 = v12;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v41 = v11;
    v22 = v11;
    v46 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
    if (v46)
    {
      v23 = a6 / (double)v14;
      v45 = *(_QWORD *)v53;
      v24 = (double)v15;
      v43 = v22;
      v44 = v17;
      while (2)
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v53 != v45)
            objc_enumerationMutation(v22);
          v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          v27 = objc_msgSend(v22, "countForObject:", v26);
          objc_msgSend(v47, "objectForKeyedSubscript:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "count"))
          {
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v29 = v28;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
            if (v30)
            {
              v31 = v30;
              v32 = (double)v27 / v24;
              v33 = *(_QWORD *)v49;
LABEL_20:
              v34 = 0;
              while (1)
              {
                if (*(_QWORD *)v49 != v33)
                  objc_enumerationMutation(v29);
                v35 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v34);
                objc_msgSend(v26, "pg_locationNamedEntity");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v36)
                  break;
                v37 = v36;
                objc_msgSend(v36, "setScore:", v32);
                objc_msgSend(v37, "setDate:", v35);
                objc_msgSend(v21, "addObject:", v37);

                if (v31 == ++v34)
                {
                  v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
                  if (v31)
                    goto LABEL_20;
                  break;
                }
              }
            }

            v22 = v43;
            v17 = v44;
          }
          v16 = v23 + v16;
          if (v17)
          {
            v38 = CFAbsoluteTimeGetCurrent();
            if (v38 - v18 >= 0.01)
            {
              v56 = 0;
              v17[2](v17, &v56, v16);
              if (v56)
              {
                if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109378;
                  v61 = 463;
                  v62 = 2080;
                  v63 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewor"
                        "k/Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                  _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                }

                v20 = (id)MEMORY[0x1E0C9AA60];
                goto LABEL_37;
              }
              v18 = v38;
            }
          }

        }
        v46 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v59, 16);
        if (v46)
          continue;
        break;
      }
    }

    *v40 = v16;
    v20 = v21;
LABEL_37:
    v11 = v41;

    v12 = v42;
    goto LABEL_38;
  }
  v20 = (id)MEMORY[0x1E0C9AA60];
LABEL_39:

  return v20;
}

- (id)_namedEntitiesFromNamedEntityNodes:(id)a3 currentProgress:(double *)a4 progressFraction:(double)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  double v14;
  void (**v15)(void *, _BYTE *, double);
  double v16;
  double Current;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t i;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  void *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char v40;
  uint64_t v41;
  uint8_t v42[128];
  uint8_t buf[4];
  int v44;
  __int16 v45;
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  if (!a4)
  {
    v41 = 0;
    a4 = (double *)&v41;
  }
  v11 = objc_msgSend(v9, "count");
  if (v11)
  {
    v12 = v11;
    v13 = objc_msgSend(v9, "pg_accumulatedCount");
    v14 = *a4;
    v15 = (void (**)(void *, _BYTE *, double))_Block_copy(v10);
    v16 = 0.0;
    if (v15)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current >= 0.01)
      {
        v40 = 0;
        v15[2](v15, &v40, v14);
        if (v40)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v44 = 489;
            v45 = 2080;
            v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v18 = (id)MEMORY[0x1E0C9AA60];
LABEL_30:

          goto LABEL_31;
        }
        v16 = Current;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", v10);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v35 = v9;
    v20 = v9;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    if (v21)
    {
      v22 = v21;
      v23 = a5 / (double)v12;
      v24 = *(_QWORD *)v37;
      v25 = (double)v13;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v37 != v24)
            objc_enumerationMutation(v20);
          v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          v28 = objc_msgSend(v20, "countForObject:", v27);
          objc_msgSend(v27, "pg_namedEntity");
          v29 = objc_claimAutoreleasedReturnValue();
          if (v29)
          {
            v30 = (void *)v29;
            v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D70C38]), "initWithItem:score:", v29, (double)v28 / v25);
            objc_msgSend(v19, "addObject:", v31);
            v14 = v23 + v14;
            if (v15)
            {
              v32 = CFAbsoluteTimeGetCurrent();
              if (v32 - v16 >= 0.01)
              {
                v40 = 0;
                v15[2](v15, &v40, v14);
                if (v40)
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 67109378;
                    v44 = 507;
                    v45 = 2080;
                    v46 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
                  }

                  v18 = (id)MEMORY[0x1E0C9AA60];
                  goto LABEL_29;
                }
                v16 = v32;
              }
            }

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        if (v22)
          continue;
        break;
      }
    }

    *a4 = v14;
    v18 = v19;
LABEL_29:
    v10 = v34;
    v9 = v35;

    goto LABEL_30;
  }
  v18 = (id)MEMORY[0x1E0C9AA60];
LABEL_31:

  return v18;
}

- (NSCountedSet)meaningNodes
{
  return self->_meaningNodes;
}

- (NSCountedSet)poiNodes
{
  return self->_poiNodes;
}

- (NSCountedSet)roiNodes
{
  return self->_roiNodes;
}

- (NSCountedSet)businessNodes
{
  return self->_businessNodes;
}

- (NSCountedSet)publicEventNodes
{
  return self->_publicEventNodes;
}

- (NSCountedSet)performerNodes
{
  return self->_performerNodes;
}

- (NSMutableDictionary)datesByAddressNode
{
  return self->_datesByAddressNode;
}

- (NSCountedSet)addressNodes
{
  return self->_addressNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addressNodes, 0);
  objc_storeStrong((id *)&self->_datesByAddressNode, 0);
  objc_storeStrong((id *)&self->_performerNodes, 0);
  objc_storeStrong((id *)&self->_publicEventNodes, 0);
  objc_storeStrong((id *)&self->_businessNodes, 0);
  objc_storeStrong((id *)&self->_roiNodes, 0);
  objc_storeStrong((id *)&self->_poiNodes, 0);
  objc_storeStrong((id *)&self->_meaningNodes, 0);
}

void __94__PGGraphPortraitDonationEnrichmentProcessor__donateKnowledge_donationDate_loggingConnection___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  id v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "topics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    v6 = 0;
    goto LABEL_7;
  }
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v24 = 0;
  v5 = objc_msgSend(MEMORY[0x1E0D70B28], "donatePhotosTopics:bundleId:date:error:", v2, v3, v4, &v24);
  v6 = v24;
  if ((v5 & 1) != 0)
  {
LABEL_7:
    v8 = 1;
    goto LABEL_8;
  }
  v7 = *(NSObject **)(a1 + 56);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v6;
    _os_log_error_impl(&dword_1CA237000, v7, OS_LOG_TYPE_ERROR, "PortraitEnrichment - Failed to donate topics with error: %@", buf, 0xCu);
  }
  v8 = 0;
LABEL_8:
  objc_msgSend(*(id *)(a1 + 32), "locationNamedEntities");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v8 && v10)
  {
    v11 = *(_QWORD *)(a1 + 40);
    v23 = v6;
    v12 = objc_msgSend(MEMORY[0x1E0D70B28], "donatePhotosLocationNamedEntities:bundleId:error:", v9, v11, &v23);
    v13 = v23;

    if ((v12 & 1) != 0)
    {
      v8 = 1;
    }
    else
    {
      v14 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v13;
        _os_log_error_impl(&dword_1CA237000, v14, OS_LOG_TYPE_ERROR, "PortraitEnrichment - Failed to donate location named entities with error: %@", buf, 0xCu);
      }
      v8 = 0;
    }
  }
  else
  {
    v13 = v6;
  }
  objc_msgSend(*(id *)(a1 + 32), "namedEntities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  if (v8 && v16)
  {
    v17 = *(_QWORD *)(a1 + 40);
    v18 = *(_QWORD *)(a1 + 48);
    v22 = v13;
    v19 = objc_msgSend(MEMORY[0x1E0D70B28], "donatePhotosNamedEntities:bundleId:date:error:", v15, v17, v18, &v22);
    v20 = v22;

    if ((v19 & 1) == 0)
    {
      v21 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v20;
        _os_log_error_impl(&dword_1CA237000, v21, OS_LOG_TYPE_ERROR, "PortraitEnrichment - Failed to donate named entities with error: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    v20 = v13;
  }

}

void __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  double v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a2, "timestampUTCStart");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", v5 + *(double *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);
  }
  objc_msgSend(v7, "addObject:", v6);
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

}

uint64_t __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_218(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_220(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_222(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_2;
  v5[3] = &unk_1E842BCC0;
  v6 = *(id *)(a1 + 40);
  objc_msgSend(v4, "enumeratePerformerNodesUsingBlock:", v5);

}

uint64_t __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_225(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_227(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __101__PGGraphPortraitDonationEnrichmentProcessor__accumulateKnowledgeNodesFromMomentNodes_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __88__PGGraphPortraitDonationEnrichmentProcessor__donateKnowledgeWithManager_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void (**v5)(void *, _BYTE *, double);
  double v6;
  double Current;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  NSObject *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  uint8_t buf[4];
  int v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "graph");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(NSObject **)(a1 + 32);
  if (v3)
  {
    if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA237000, v4, OS_LOG_TYPE_DEBUG, "PortraitEnrichment - Will donate graph knowledge to Portrait", buf, 2u);
    }
    v5 = (void (**)(void *, _BYTE *, double))_Block_copy(*(const void **)(a1 + 48));
    v6 = 0.0;
    if (v5)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current >= 0.01)
      {
        v18 = 0;
        v5[2](v5, &v18, 0.0);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 151;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_33;
        }
        v6 = Current;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_prepareForKnowledgeDonation");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -31557600.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v8);
    objc_msgSend(v3, "momentNodesOverlappingLocalDateInterval:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v12 = CFAbsoluteTimeGetCurrent();
      if (v12 - v6 >= 0.01)
      {
        v18 = 0;
        v5[2](v5, &v18, 0.2);
        if (v18)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            v20 = 161;
            v21 = 2080;
            v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
            v13 = MEMORY[0x1E0C81028];
LABEL_31:
            _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_32;
          }
          goto LABEL_32;
        }
        v6 = v12;
      }
    }
    if (objc_msgSend(v11, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "_accumulateKnowledgeNodesFromMomentNodes:progressBlock:", v11, *(_QWORD *)(a1 + 48));
      if (v5)
      {
        v14 = CFAbsoluteTimeGetCurrent();
        if (v14 - v6 >= 0.01)
        {
          v18 = 0;
          v5[2](v5, &v18, 0.5);
          if (v18)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              v20 = 167;
              v21 = 2080;
              v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/Data Model Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
              v13 = MEMORY[0x1E0C81028];
              goto LABEL_31;
            }
LABEL_32:

LABEL_33:
            goto LABEL_34;
          }
          v6 = v14;
        }
      }
      objc_msgSend(*(id *)(a1 + 40), "_knowledgeToDonateFromAccumulatedNodesWithProgressBlock:", *(_QWORD *)(a1 + 48));
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v17 = *(void **)(v16 + 40);
      *(_QWORD *)(v16 + 40) = v15;

    }
    if (!v5)
      goto LABEL_32;
    if (CFAbsoluteTimeGetCurrent() - v6 < 0.01)
      goto LABEL_32;
    v18 = 0;
    v5[2](v5, &v18, 1.0);
    if (!v18 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_32;
    *(_DWORD *)buf = 67109378;
    v20 = 172;
    v21 = 2080;
    v22 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Data M"
          "odel Enrichment/PGGraphPortraitDonationEnrichmentProcessor.m";
    v13 = MEMORY[0x1E0C81028];
    goto LABEL_31;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 32), OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1CA237000, v4, OS_LOG_TYPE_FAULT, "PortraitEnrichment - portrait donation can not run because the graph is nil", buf, 2u);
  }
LABEL_34:

}

@end
