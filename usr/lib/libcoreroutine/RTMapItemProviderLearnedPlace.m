@implementation RTMapItemProviderLearnedPlace

void __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  dispatch_semaphore_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  dispatch_time_t v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  char v30;
  dispatch_semaphore_t v31;
  void *v32;
  NSObject *v33;
  void *v34;
  dispatch_time_t v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  char v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  void *v56;
  unint64_t i;
  id v58;
  void *v59;
  _BOOL4 v60;
  void *v61;
  void *v62;
  int v63;
  NSObject *v64;
  uint64_t v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  unint64_t v76;
  unint64_t v77;
  RTMapItemProviderLearnedPlaceParameters *parameters;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  int v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t j;
  void *v93;
  id v94;
  id v96;
  uint64_t v97;
  id v98;
  id v99;
  void *v100;
  id v102;
  void *v103;
  void *v104;
  void *v106;
  void *v107;
  NSObject *v108;
  NSObject *dsema;
  id v110;
  void *v111;
  id v112;
  id v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  id v118;
  id v119;
  _QWORD v120[4];
  id v121;
  id v122;
  _QWORD v123[5];
  id v124;
  id v125;
  _QWORD v126[4];
  NSObject *v127;
  uint8_t *v128;
  uint64_t *v129;
  _QWORD v130[4];
  NSObject *v131;
  uint64_t *v132;
  uint64_t *v133;
  uint64_t v134;
  id *v135;
  uint64_t v136;
  uint64_t (*v137)(uint64_t, uint64_t);
  void (*v138)(uint64_t);
  id v139;
  uint64_t v140;
  uint64_t *v141;
  uint64_t v142;
  uint64_t (*v143)(uint64_t, uint64_t);
  void (*v144)(uint64_t);
  id v145;
  _BYTE v146[128];
  uint64_t v147;
  const __CFString *v148;
  _BYTE buf[12];
  __int16 v150;
  id v151;
  uint64_t v152;
  id *v153;
  uint64_t v154;
  uint64_t (*v155)(uint64_t, uint64_t);
  void (*v156)(uint64_t);
  id v157;
  uint8_t v158[8];
  uint8_t *v159;
  uint64_t v160;
  uint64_t (*v161)(uint64_t, uint64_t);
  void (*v162)(uint64_t);
  id v163;
  _QWORD v164[4];

  v164[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "distance");
  v7 = v6;
  v100 = v5;
  objc_msgSend(v5, "location");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTMapItemProviderLearnedPlaceParameters maxDistanceThreshold](self->_parameters, "maxDistanceThreshold");
  if (v8 < v7)
    v7 = v8;
  -[RTMapItemProviderLearnedPlaceParameters minDistanceThreshold](self->_parameters, "minDistanceThreshold");
  if (v7 < v9)
    v7 = v9;
  -[RTMapItemProviderLearnedPlaceParameters softDistanceThreshold](self->_parameters, "softDistanceThreshold");
  if (v10 >= v7)
    v11 = v10;
  else
    v11 = v7;
  v139 = 0;
  v140 = 0;
  v141 = &v140;
  v142 = 0x3032000000;
  v143 = __Block_byref_object_copy__55;
  v144 = __Block_byref_object_dispose__55;
  v145 = 0;
  v134 = 0;
  v135 = (id *)&v134;
  v136 = 0x3032000000;
  v137 = __Block_byref_object_copy__55;
  v138 = __Block_byref_object_dispose__55;
  v12 = dispatch_semaphore_create(0);
  -[RTMapItemProviderLearnedPlace learnedLocationStore](self, "learnedLocationStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v130[0] = MEMORY[0x1E0C809B0];
  v130[1] = 3221225472;
  v130[2] = __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke;
  v130[3] = &unk_1E9296EE0;
  v132 = &v140;
  v133 = &v134;
  v14 = v12;
  v131 = v14;
  objc_msgSend(v13, "fetchLocationsOfInterestWithinDistance:location:handler:", v107, v130, v11);

  dsema = v14;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(dsema, v16))
    goto LABEL_13;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "timeIntervalSinceDate:", v15);
  v19 = v18;
  v20 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_41);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "filteredArrayUsingPredicate:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "submitToCoreAnalytics:type:duration:", v24, 1, v19);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v158 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v158, 2u);
  }

  v26 = (void *)MEMORY[0x1E0CB35C8];
  v152 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v158 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v158, &v152, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    v29 = objc_retainAutorelease(v28);

    v30 = 0;
  }
  else
  {
LABEL_13:
    v29 = 0;
    v30 = 1;
  }

  v99 = v29;
  if ((v30 & 1) == 0)
    objc_storeStrong(v135 + 5, v29);
  *(_QWORD *)v158 = 0;
  v159 = v158;
  v160 = 0x3032000000;
  v161 = __Block_byref_object_copy__55;
  v162 = __Block_byref_object_dispose__55;
  v163 = 0;
  v152 = 0;
  v153 = (id *)&v152;
  v154 = 0x3032000000;
  v155 = __Block_byref_object_copy__55;
  v156 = __Block_byref_object_dispose__55;
  v157 = 0;
  v31 = dispatch_semaphore_create(0);
  -[RTMapItemProviderLearnedPlace learnedLocationStore](self, "learnedLocationStore");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v126[0] = MEMORY[0x1E0C809B0];
  v126[1] = 3221225472;
  v126[2] = __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_2;
  v126[3] = &unk_1E9296EE0;
  v128 = v158;
  v129 = &v152;
  v33 = v31;
  v127 = v33;
  objc_msgSend(v32, "fetchPlacesWithinDistance:location:handler:", v107, v126, v11);

  v108 = v33;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v108, v35))
    goto LABEL_21;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "timeIntervalSinceDate:", v34);
  v38 = v37;
  v39 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "filteredArrayUsingPredicate:", v40);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "firstObject");
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "submitToCoreAnalytics:type:duration:", v43, 1, v38);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v44 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v45 = (void *)MEMORY[0x1E0CB35C8];
  v164[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v164, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
  {
    v48 = objc_retainAutorelease(v47);

    v49 = 0;
  }
  else
  {
LABEL_21:
    v48 = 0;
    v49 = 1;
  }

  v98 = v48;
  if ((v49 & 1) == 0)
    objc_storeStrong(v153 + 5, v48);
  if (!((unint64_t)v135[5] | (unint64_t)v153[5]))
  {
LABEL_30:
    objc_msgSend(MEMORY[0x1E0C99DE8], "array", v96, v97);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)v141[5];
    v123[0] = MEMORY[0x1E0C809B0];
    v123[1] = 3221225472;
    v123[2] = __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_3;
    v123[3] = &unk_1E929C9A8;
    v123[4] = self;
    v110 = v107;
    v124 = v110;
    v54 = v52;
    v125 = v54;
    objc_msgSend(v53, "enumerateObjectsUsingBlock:", v123);
    v55 = (void *)objc_opt_new();
    v56 = (void *)*((_QWORD *)v159 + 5);
    v120[0] = MEMORY[0x1E0C809B0];
    v120[1] = 3221225472;
    v120[2] = __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_19;
    v120[3] = &unk_1E929C9F8;
    v102 = v55;
    v121 = v102;
    v112 = v54;
    v122 = v112;
    objc_msgSend(v56, "enumerateObjectsUsingBlock:", v120);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; i < objc_msgSend(v112, "count"); ++i)
    {
      objc_msgSend(v112, "objectAtIndexedSubscript:", i);
      v58 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "mapItem");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = v59 == 0;

      if (v60)
      {
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v64 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = v66;
          v150 = 2112;
          v151 = v58;
          _os_log_impl(&dword_1D1A22000, v64, OS_LOG_TYPE_INFO, "%@, found place with nil mapItem, %@", buf, 0x16u);

        }
      }
      else
      {
        *(_QWORD *)buf = 0;
        v164[0] = 0;
        -[RTMapItemProviderLearnedPlace learnedLocationStore](self, "learnedLocationStore");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "mapItem");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v119 = 0;
        v63 = objc_msgSend(v61, "placeTypeForMapItem:placeType:placeTypeSource:error:", v62, buf, v164, &v119);
        v64 = v119;

        if (v63)
        {
          v65 = *(_QWORD *)buf;
        }
        else
        {
          v65 = 0;
          *(_QWORD *)buf = 0;
          v164[0] = 0;
        }
        -[RTMapItemProviderLearnedPlace confidenceForPlaceType:](self, "confidenceForPlaceType:", v65);
        v68 = v67;
        objc_msgSend(v58, "mapItem");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "appendSource:", 0x2000);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183A8]), "initWithMapItem:confidence:source:", v70, 0x2000, v68);
        if (!v71)
        {
          v86 = (void *)MEMORY[0x1E0CB35C8];
          v147 = *MEMORY[0x1E0CB2D50];
          v148 = CFSTR("inferredMapItem was nil");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v148, &v147, 1);
          v87 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 0, v87);
          v88 = (void *)objc_claimAutoreleasedReturnValue();

          if (a4)
            *a4 = objc_retainAutorelease(v88);

LABEL_55:
          v51 = 0;
          goto LABEL_64;
        }
        if (*(_QWORD *)buf)
        {
          objc_msgSend(v111, "addObject:", v71);
          -[RTMapItemProviderLearnedPlace adjustConfidenceAndCollectMetrics:learnedPlace:maxConfidence:](self, "adjustConfidenceAndCollectMetrics:learnedPlace:maxConfidence:", v110, v58, v68);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          v73 = objc_alloc(MEMORY[0x1E0CB3940]);
          v74 = (void *)objc_msgSend(v73, "initWithCString:encoding:", RTAnalyticsEventLearnedPlaceConfidence, 1);
          log_analytics_submission(v74, v72);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@"), v74);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          AnalyticsSendEvent();

        }
        else
        {
          v76 = -[RTMapItemProviderLearnedPlace coalescedMapItemSourceForPlace:](self, "coalescedMapItemSourceForPlace:", v58);
          v77 = -[RTMapItemProviderLearnedPlaceParameters revGeoSourceMask](self->_parameters, "revGeoSourceMask");
          parameters = self->_parameters;
          if ((v76 & ~v77) != 0)
          {
            -[RTMapItemProviderLearnedPlaceParameters nonRevGeoConfidence](parameters, "nonRevGeoConfidence");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setValue:forKey:", v79, CFSTR("confidence"));

            v80 = v106;
          }
          else
          {
            -[RTMapItemProviderLearnedPlaceParameters revGeoConfidence](parameters, "revGeoConfidence");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v71, "setValue:forKey:", v81, CFSTR("confidence"));

            objc_msgSend(v71, "mapItem");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "identifier");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            v84 = objc_msgSend(v102, "containsObject:", v83);

            if (v84)
              v80 = v104;
            else
              v80 = v103;
          }
          objc_msgSend(v80, "addObject:", v71);
        }

      }
    }
    v118 = 0;
    -[RTMapItemProviderBase filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:](self, "filterInferredMapItems:byDistance:fromLocation:andAppendSource:error:", v104, v110, 0x2000, &v118, v7);
    v64 = objc_claimAutoreleasedReturnValue();
    v85 = v118;
    if (v85)
    {
      v58 = v85;
      if (a4)
      {
        v58 = objc_retainAutorelease(v85);
        v51 = 0;
        *a4 = v58;
        goto LABEL_64;
      }
      goto LABEL_55;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v106, "count")+ objc_msgSend(v111, "count")+ objc_msgSend(v103, "count")+ -[NSObject count](v64, "count"));
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "addObjectsFromArray:", v111);
    objc_msgSend(v89, "addObjectsFromArray:", v106);
    objc_msgSend(v89, "addObjectsFromArray:", v64);
    objc_msgSend(v89, "addObjectsFromArray:", v103);
    v116 = 0u;
    v117 = 0u;
    v114 = 0u;
    v115 = 0u;
    v51 = v89;
    v90 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v114, v146, 16);
    if (v90)
    {
      v91 = *(_QWORD *)v115;
      do
      {
        for (j = 0; j != v90; ++j)
        {
          if (*(_QWORD *)v115 != v91)
            objc_enumerationMutation(v51);
          objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * j), "mapItem");
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = (id)objc_msgSend(v93, "removeSource:", -[RTMapItemProviderLearnedPlaceParameters removeSourceMask](self->_parameters, "removeSourceMask"));

        }
        v90 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v114, v146, 16);
      }
      while (v90);
    }

    v58 = 0;
LABEL_64:

    goto LABEL_65;
  }
  v96 = v153[5];
  v97 = 1;
  _RTSafeArray();
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  _RTMultiErrorCreate();
  v112 = (id)objc_claimAutoreleasedReturnValue();

  if (!v135[5] || !v153[5])
  {

    goto LABEL_30;
  }
  if (!a4)
  {
    v51 = 0;
LABEL_65:

    goto LABEL_66;
  }
  v113 = objc_retainAutorelease(v112);
  v51 = 0;
  *a4 = v113;

LABEL_66:
  _Block_object_dispose(&v152, 8);

  _Block_object_dispose(v158, 8);
  _Block_object_dispose(&v134, 8);

  _Block_object_dispose(&v140, 8);
  return v51;
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

void __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (RTMapItemProviderLearnedPlace)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_learnedLocationStore_);
}

- (RTMapItemProviderLearnedPlace)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5
{
  id v8;
  id v9;
  id v10;
  RTMapItemProviderLearnedPlaceParameters *v11;
  RTMapItemProviderLearnedPlace *v12;
  NSObject *v13;
  uint8_t v15[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = -[RTMapItemProviderLearnedPlaceParameters initWithDefaultsManager:]([RTMapItemProviderLearnedPlaceParameters alloc], "initWithDefaultsManager:", v8);
    self = -[RTMapItemProviderLearnedPlace initWithDefaultsManager:distanceCalculator:learnedLocationStore:parameters:](self, "initWithDefaultsManager:distanceCalculator:learnedLocationStore:parameters:", v8, v9, v10, v11);

    v12 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", v15, 2u);
    }

    v12 = 0;
  }

  return v12;
}

- (RTMapItemProviderLearnedPlace)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 learnedLocationStore:(id)a5 parameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  RTMapItemProviderLearnedPlace *v15;
  id *p_isa;
  NSObject *v17;
  id v18;
  RTMapItemProviderLearnedPlace *v19;
  NSObject *v20;
  const char *v21;
  objc_super v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = v13;
  if (!v12)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      v19 = 0;
      goto LABEL_12;
    }
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: learnedLocationStore";
LABEL_14:
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, v21, buf, 2u);
    goto LABEL_11;
  }
  if (!v13)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v21 = "Invalid parameter not satisfying: parameters";
    goto LABEL_14;
  }
  v23.receiver = self;
  v23.super_class = (Class)RTMapItemProviderLearnedPlace;
  v15 = -[RTMapItemProviderBase initWithDefaultsManager:distanceCalculator:](&v23, sel_initWithDefaultsManager_distanceCalculator_, v10, v11);
  p_isa = (id *)&v15->super.super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_learnedLocationStore, a5);
    objc_storeStrong(p_isa + 4, a6);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = p_isa[4];
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderLearnedPlace with parameters: %@", buf, 0xCu);
    }

  }
  self = p_isa;
  v19 = self;
LABEL_12:

  return v19;
}

void __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "distanceCalculator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "location");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "checkConsistencyBetweenLocation:otherLocation:error:", v5, v7, 0);

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(_QWORD *)(a1 + 40);
    v13 = CFSTR("NO");
    v14 = 138412802;
    if (v8)
      v13 = CFSTR("YES");
    v15 = v3;
    v16 = 2112;
    v17 = v12;
    v18 = 2112;
    v19 = v13;
    _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "Processing LOI, %@, near entry location, %@, consistent, %@", (uint8_t *)&v14, 0x20u);
  }

  if (v8)
  {
    v10 = *(void **)(a1 + 48);
    objc_msgSend(v3, "place");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);

  }
}

void __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, uint64_t, _BYTE *);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v3 = a2;
  objc_msgSend(v3, "mapItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = *(void **)(a1 + 32);
    objc_msgSend(v3, "mapItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v8);

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v9 = *(void **)(a1 + 40);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_2_20;
  v14 = &unk_1E929C9D0;
  v10 = v3;
  v15 = v10;
  v16 = &v17;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v11);
  if (!*((_BYTE *)v18 + 24))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10, v11, v12, v13, v14);

  _Block_object_dispose(&v17, 8);
}

void __59__RTMapItemProviderLearnedPlace_mapItemsWithOptions_error___block_invoke_2_20(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqual:", v7))
  {

LABEL_4:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_5;
  }
  objc_msgSend(*(id *)(a1 + 32), "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "mapItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToMapItem:", v9);

  if (v10)
    goto LABEL_4;
LABEL_5:

}

- (id)learnedPlaceForInferredMapItem:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  char v29;
  id v30;
  id v31;
  uint64_t v33;
  uint64_t v34;
  void (*v35)(uint64_t, void *, void *);
  void *v36;
  NSObject *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  id *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint8_t buf[16];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__55;
  v50 = __Block_byref_object_dispose__55;
  v51 = 0;
  v40 = 0;
  v41 = (id *)&v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy__55;
  v44 = __Block_byref_object_dispose__55;
  v45 = 0;
  v8 = (void *)MEMORY[0x1D8231EA8]();
  -[RTMapItemProviderLearnedPlace learnedLocationStore](self, "learnedLocationStore");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = __70__RTMapItemProviderLearnedPlace_learnedPlaceForInferredMapItem_error___block_invoke;
  v36 = &unk_1E929AEF0;
  v38 = &v40;
  v39 = &v46;
  v12 = v7;
  v37 = v12;
  objc_msgSend(v9, "fetchPlaceWithMapItemIdentifier:handler:", v11, &v33);

  objc_autoreleasePoolPop(v8);
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", v33, v34, v35, v36);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v13, v15))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceDate:", v14);
  v18 = v17;
  v19 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_41);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "firstObject");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "submitToCoreAnalytics:type:duration:", v23, 1, v18);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v25 = (void *)MEMORY[0x1E0CB35C8];
  v52 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v52, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    v28 = objc_retainAutorelease(v27);

    v29 = 0;
  }
  else
  {
LABEL_6:
    v28 = 0;
    v29 = 1;
  }

  v30 = v28;
  if ((v29 & 1) == 0)
    objc_storeStrong(v41 + 5, v28);
  if (a4)
    *a4 = objc_retainAutorelease(v41[5]);
  v31 = (id)v47[5];
  _Block_object_dispose(&v40, 8);

  _Block_object_dispose(&v46, 8);
  return v31;
}

void __70__RTMapItemProviderLearnedPlace_learnedPlaceForInferredMapItem_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v5 = a2;
  v9 = a3;
  if (v9)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (unint64_t)coalescedMapItemSourceForPlace:(id)a3
{
  id v4;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  NSObject *v24;
  uint64_t v26;
  uint64_t v27;
  intptr_t (*v28)(uint64_t, void *);
  void *v29;
  NSObject *v30;
  uint8_t *v31;
  uint8_t v32[8];
  uint8_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[8];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    *(_QWORD *)v32 = 0;
    v33 = v32;
    v34 = 0x2020000000;
    v35 = 0;
    v5 = dispatch_semaphore_create(0);
    -[RTMapItemProviderLearnedPlace learnedLocationStore](self, "learnedLocationStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __64__RTMapItemProviderLearnedPlace_coalescedMapItemSourceForPlace___block_invoke;
    v29 = &unk_1E9298FF0;
    v31 = v32;
    v7 = v5;
    v30 = v7;
    objc_msgSend(v6, "fetchLocationOfInterestWithPlace:handler:", v4, &v26);

    v8 = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now", v26, v27, v28, v29);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(v8, v10))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v9);
      v13 = v12;
      v14 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_41);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
      }

      v20 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)buf = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v36, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
    }

    v23 = *((_QWORD *)v33 + 3);
    _Block_object_dispose(v32, 8);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v32 = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: place", v32, 2u);
    }

    v23 = 0x2000;
  }

  return v23;
}

intptr_t __64__RTMapItemProviderLearnedPlace_coalescedMapItemSourceForPlace___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    objc_msgSend(a2, "visits", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v10;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v10 != v6)
            objc_enumerationMutation(v3);
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "placeSource");
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v5);
    }

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (double)confidenceForPlaceType:(unint64_t)a3
{
  double result;

  switch(a3)
  {
    case 1uLL:
      -[RTMapItemProviderLearnedPlaceParameters homeConfidence](self->_parameters, "homeConfidence");
      break;
    case 2uLL:
      -[RTMapItemProviderLearnedPlaceParameters workConfidence](self->_parameters, "workConfidence");
      break;
    case 3uLL:
      -[RTMapItemProviderLearnedPlaceParameters schoolConfidence](self->_parameters, "schoolConfidence");
      break;
    case 4uLL:
      -[RTMapItemProviderLearnedPlaceParameters gymConfidence](self->_parameters, "gymConfidence");
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

- (id)adjustConfidenceAndCollectMetrics:(id)a3 learnedPlace:(id)a4 maxConfidence:(double)a5
{
  id v8;
  void *v9;
  void *v10;
  dispatch_semaphore_t v11;
  RTLearnedLocationStore *learnedLocationStore;
  void *v13;
  id v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  dispatch_time_t v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  char v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, void *, void *);
  void *v53;
  id v54;
  NSObject *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  id *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint8_t buf[16];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "type"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("type"));

  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__55;
  v68 = __Block_byref_object_dispose__55;
  v69 = 0;
  v58 = 0;
  v59 = (id *)&v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__55;
  v62 = __Block_byref_object_dispose__55;
  v63 = 0;
  v11 = dispatch_semaphore_create(0);
  learnedLocationStore = self->_learnedLocationStore;
  objc_msgSend(v8, "mapItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = MEMORY[0x1E0C809B0];
  v51 = 3221225472;
  v52 = __94__RTMapItemProviderLearnedPlace_adjustConfidenceAndCollectMetrics_learnedPlace_maxConfidence___block_invoke;
  v53 = &unk_1E929CA20;
  v14 = v8;
  v54 = v14;
  v56 = &v58;
  v57 = &v64;
  v15 = v11;
  v55 = v15;
  -[RTLearnedLocationStore fetchLocationOfInterestWithMapItem:handler:](learnedLocationStore, "fetchLocationOfInterestWithMapItem:handler:", v13, &v50);

  v16 = v15;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v16, v18))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceDate:", v17);
  v21 = v20;
  v22 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_41);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "filteredArrayUsingPredicate:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "firstObject");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "submitToCoreAnalytics:type:duration:", v26, 1, v21);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v28 = (void *)MEMORY[0x1E0CB35C8];
  v70 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v70, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = objc_retainAutorelease(v30);

    v32 = 0;
  }
  else
  {
LABEL_6:
    v31 = 0;
    v32 = 1;
  }

  v33 = v31;
  if ((v32 & 1) == 0)
    objc_storeStrong(v59 + 5, v31);
  if (!v59[5] && v65[5])
  {
    objc_msgSend(v49, "latitude");
    objc_msgSend(v49, "longitude");
    objc_msgSend((id)v65[5], "location");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "location");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "latitude");
    objc_msgSend((id)v65[5], "location");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "location");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "longitude");
    RTCommonCalculateDistanceHighPrecision();
    v39 = v38;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v40, CFSTR("distance"));

    objc_msgSend((id)v65[5], "location");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "location");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "horizontalUncertainty");
    v44 = v43;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v45, CFSTR("uncertainty"));

    v46 = 0.0;
    if (v44 > 0.0 && v39 < v44 + v44)
      v46 = (a5 + -0.55) * (dbl_1D1EED4D8[vcvtmd_s64_f64(v39 / v44 * 4.0)] + -0.0346) / 0.1628 + 0.55;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v46, v49, v50, v51, v52, v53, v54);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v47, CFSTR("confidence"));

  }
  _Block_object_dispose(&v58, 8);

  _Block_object_dispose(&v64, 8);
  return v9;
}

void __94__RTMapItemProviderLearnedPlace_adjustConfidenceAndCollectMetrics_learnedPlace_maxConfidence___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void **v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v13 = 138412802;
    v14 = v5;
    v15 = 2112;
    v16 = v8;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "fetched LOI, %@, with learnedPlace, %@, error, %@", (uint8_t *)&v13, 0x20u);
  }

  if (v6)
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v10 = v6;
LABEL_7:
    v11 = v10;
    v12 = *v9;
    *v9 = v11;

    goto LABEL_8;
  }
  if (v5)
  {
    v9 = (void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v10 = v5;
    goto LABEL_7;
  }
LABEL_8:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)setLearnedLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationStore, a3);
}

- (RTMapItemProviderLearnedPlaceParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
}

@end
