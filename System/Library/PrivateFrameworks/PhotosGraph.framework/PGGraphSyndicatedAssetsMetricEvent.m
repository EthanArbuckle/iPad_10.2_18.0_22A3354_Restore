@implementation PGGraphSyndicatedAssetsMetricEvent

- (PGGraphSyndicatedAssetsMetricEvent)initWithWorkingContext:(id)a3
{
  id v5;
  PGGraphSyndicatedAssetsMetricEvent *v6;
  PGGraphSyndicatedAssetsMetricEvent *v7;
  NSDictionary *payload;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGGraphSyndicatedAssetsMetricEvent;
  v6 = -[PGGraphSyndicatedAssetsMetricEvent init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workingContext, a3);
    payload = v7->_payload;
    v7->_payload = (NSDictionary *)MEMORY[0x1E0C9AA70];

  }
  return v7;
}

- (id)identifier
{
  return CFSTR("com.apple.Photos.Intelligence.Graph.SyndicatedAssets");
}

- (BOOL)shouldReportMetrics
{
  return 1;
}

- (void)gatherMetricsWithProgressBlock:(id)a3
{
  id v4;
  void (**v5)(void *, _BYTE *, double);
  double v6;
  double v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double Current;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  double v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSDictionary *v60;
  NSDictionary *payload;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  void *v66;
  NSObject *v67;
  id v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  id v80;
  char v81;
  _QWORD v82[10];
  _QWORD v83[10];
  _QWORD v84[3];
  uint8_t buf[4];
  _BYTE v86[14];
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void (**)(void *, _BYTE *, double))_Block_copy(v4);
  v6 = 0.0;
  if (!v5 || (v7 = CFAbsoluteTimeGetCurrent(), v7 < 0.01))
  {
LABEL_7:
    -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isSystemPhotoLibrary") & 1) == 0)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "PGGraphSyndicatedAssetsMetricEvent: Only reporting for system photo library.", buf, 2u);
      }
      if (v5)
      {
        if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
        {
          v81 = 0;
          v5[2](v5, &v81, 1.0);
          if (v81)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v86 = 55;
              *(_WORD *)&v86[4] = 2080;
              *(_QWORD *)&v86[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_77;
    }
    v80 = 0;
    objc_msgSend(MEMORY[0x1E0CD16F8], "openPhotoLibraryWithWellKnownIdentifier:error:", 3, &v80);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v80;
    v12 = v11;
    if (!v10 || v11)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)v86 = v12;
        _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "PGGraphSyndicatedAssetsMetricEvent: Failed to open syndicated library: %@", buf, 0xCu);
        if (!v5)
          goto LABEL_76;
      }
      else if (!v5)
      {
LABEL_76:

LABEL_77:
        goto LABEL_78;
      }
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        v81 = 0;
        v5[2](v5, &v81, 1.0);
        if (v81)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v86 = 63;
            *(_WORD *)&v86[4] = 2080;
            *(_QWORD *)&v86[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
      goto LABEL_76;
    }
    objc_msgSend(v10, "librarySpecificFetchOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIncludeGuestAssets:", 1);
    v14 = *MEMORY[0x1E0CD19F0];
    v84[0] = *MEMORY[0x1E0CD1A50];
    v84[1] = v14;
    v84[2] = *MEMORY[0x1E0CD1978];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v84, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFetchPropertySets:", v15);

    v70 = v13;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    if (!v17)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_DEFAULT, "PGGraphSyndicatedAssetsMetricEvent: No assets to report.", buf, 2u);
      }
      v40 = v13;
      if (v5)
      {
        if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
        {
          v81 = 0;
          v5[2](v5, &v81, 1.0);
          if (v81)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v86 = 76;
              *(_WORD *)&v86[4] = 2080;
              *(_QWORD *)&v86[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_75;
    }
    v18 = v17;
    v66 = v10;
    v67 = v8;
    v68 = v4;
    v69 = v9;
    v19 = 0;
    v76 = 0;
    v77 = 0;
    v73 = 0;
    v75 = 0;
    v78 = 0;
    v20 = 0;
    v71 = 0;
    while (2)
    {
      v21 = v19;
      while (1)
      {
        v22 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        switch(objc_msgSend(v23, "syndicationEligibility"))
        {
          case -6:
            ++v71;
            break;
          case -5:
            ++v73;
            break;
          case -4:
          case -3:
            ++v20;
            break;
          case -2:
          case -1:
            ++v78;
            break;
          case 0:
            ++v75;
            break;
          case 1:
            ++v76;
            break;
          case 2:
            ++v77;
            break;
          default:
            break;
        }
        if (v5)
          break;

        objc_autoreleasePoolPop(v22);
        if (v18 == ++v21)
          goto LABEL_46;
      }
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v6 >= 0.01)
      {
        v81 = 0;
        v5[2](v5, &v81, 0.2);
        if (v81)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v86 = 122;
            *(_WORD *)&v86[4] = 2080;
            *(_QWORD *)&v86[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }

          objc_autoreleasePoolPop(v22);
          v8 = v67;
          v4 = v68;
          goto LABEL_82;
        }
        v6 = Current;
      }

      objc_autoreleasePoolPop(v22);
      if (++v19 != v18)
        continue;
      break;
    }
    v25 = CFAbsoluteTimeGetCurrent();
    if (v25 - v6 >= 0.01)
    {
      v81 = 0;
      v5[2](v5, &v81, 0.4);
      if (v81)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v86 = 125;
          *(_WORD *)&v86[4] = 2080;
          *(_QWORD *)&v86[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v8 = v67;
        v4 = v68;
LABEL_82:
        v10 = v66;
        v40 = v70;
LABEL_75:

        v12 = 0;
        goto LABEL_76;
      }
      v6 = v25;
    }
LABEL_46:
    v26 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setIncludeGuestAssets:", 1);
    objc_msgSend(v27, "setInternalPredicate:", v28);
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v27);
    v29 = objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v26);
    v30 = (void *)MEMORY[0x1CAA4EB2C]();
    v31 = (void *)MEMORY[0x1E0CD1670];
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fetchMomentUUIDByAssetUUIDForAssets:options:", v29, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v33, "allValues");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setWithArray:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = objc_msgSend(v36, "count");
    objc_autoreleasePoolPop(v30);
    v65 = (void *)v29;
    if (v5)
    {
      v38 = CFAbsoluteTimeGetCurrent();
      if (v38 - v6 >= 0.01)
      {
        v81 = 0;
        v5[2](v5, &v81, 0.6);
        if (v81)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v86 = 144;
            *(_WORD *)&v86[4] = 2080;
            *(_QWORD *)&v86[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
            v39 = MEMORY[0x1E0C81028];
LABEL_64:
            _os_log_impl(&dword_1CA237000, v39, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_65;
          }
          goto LABEL_65;
        }
        v6 = v38;
      }
    }
    v41 = (void *)MEMORY[0x1CAA4EB2C]();
    v42 = (void *)MEMORY[0x1E0CD13B8];
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "fetchAssetCollectionsContainingAssets:withType:options:", v29, 4, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v45 = objc_msgSend(v44, "count");
    objc_autoreleasePoolPop(v41);
    if (v5)
    {
      v46 = CFAbsoluteTimeGetCurrent();
      if (v46 - v6 >= 0.01)
      {
        v81 = 0;
        v5[2](v5, &v81, 0.8);
        if (v81)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v86 = 152;
            *(_WORD *)&v86[4] = 2080;
            *(_QWORD *)&v86[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
            v39 = MEMORY[0x1E0C81028];
            goto LABEL_64;
          }
LABEL_65:
          v8 = v67;
          v4 = v68;
          v10 = v66;
          v40 = v70;
LABEL_74:

          goto LABEL_75;
        }
        v6 = v46;
      }
    }
    v47 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v9, "librarySpecificFetchOptions");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type == %d"), 18);
    v64 = v45;
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setPredicate:", v49);

    objc_msgSend(MEMORY[0x1E0CD1720], "fetchAnsweredYesOrNoQuestionsWithOptions:validQuestionsOnly:", v48, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1720], "questionsWithValidEntitiesFromQuestions:photoLibrary:", v50, v9);
    v51 = v37;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v50, "count");
    v62 = v53 - objc_msgSend(v52, "count");

    objc_autoreleasePoolPop(v47);
    v82[0] = CFSTR("numberOfAssetsWithoutResource");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v83[0] = v72;
    v82[1] = CFSTR("numberOfAssetsWithSyndicationStateIncompatible");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v83[1] = v74;
    v82[2] = CFSTR("numberOfAssetsNotProcessed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v83[2] = v63;
    v82[3] = CFSTR("numberOfAssetsNotComputed");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v83[3] = v79;
    v82[4] = CFSTR("numberOfAssetsNotEligible");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v75);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v83[4] = v54;
    v82[5] = CFSTR("numberOfAssetsEligible");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v76);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v83[5] = v55;
    v82[6] = CFSTR("numberOfAssetsInferredAsGuest");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v77);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v83[6] = v56;
    v82[7] = CFSTR("numberOfMomentsFeaturingGuestAssets");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v51);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v83[7] = v57;
    v82[8] = CFSTR("numberOfMemoriesFeaturingGuestAssets");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v64);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v83[8] = v58;
    v82[9] = CFSTR("numberOfInvalidQuestions");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v62);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v83[9] = v59;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 10);
    v60 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    payload = self->_payload;
    self->_payload = v60;

    v9 = v69;
    v8 = v67;
    v4 = v68;
    v10 = v66;
    v40 = v70;
    if (v5)
    {
      if (CFAbsoluteTimeGetCurrent() - v6 >= 0.01)
      {
        v81 = 0;
        v5[2](v5, &v81, 1.0);
        if (v81)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v86 = 176;
            *(_WORD *)&v86[4] = 2080;
            *(_QWORD *)&v86[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    goto LABEL_74;
  }
  v81 = 0;
  v5[2](v5, &v81, 0.0);
  if (!v81)
  {
    v6 = v7;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v86 = 48;
    *(_WORD *)&v86[4] = 2080;
    *(_QWORD *)&v86[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Metrics/MetricEvents/PGGraphSyndicatedAssetsMetricEvent.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_78:

}

- (PGManagerWorkingContext)workingContext
{
  return self->_workingContext;
}

- (void)setWorkingContext:(id)a3
{
  objc_storeStrong((id *)&self->_workingContext, a3);
}

- (id)payload
{
  return self->_payload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

@end
