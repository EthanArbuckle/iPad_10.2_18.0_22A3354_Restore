@implementation RTMapItemProviderMapsSupport

- (id)mapItemsWithOptions:(id)a3 error:(id *)a4
{
  id v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  dispatch_semaphore_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  dispatch_time_t v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  char v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  dispatch_semaphore_t v40;
  void *v41;
  NSObject *v42;
  void *v43;
  dispatch_time_t v44;
  void *v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  char v58;
  id v59;
  id v60;
  id v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t j;
  void *v65;
  dispatch_semaphore_t v66;
  void *v67;
  NSObject *v68;
  void *v69;
  dispatch_time_t v70;
  void *v71;
  double v72;
  double v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  NSObject *v79;
  void *v80;
  void *v81;
  void *v82;
  id v83;
  char v84;
  id v85;
  id v86;
  id v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t k;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  _RTMap *v98;
  void *v99;
  void *v102;
  void *v104;
  void *v105;
  void *v106;
  RTMapsSupportOptions *v107;
  void *v108;
  _QWORD v109[5];
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _QWORD v114[4];
  NSObject *v115;
  uint8_t *v116;
  uint64_t *v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _QWORD v122[4];
  NSObject *v123;
  uint8_t *v124;
  uint64_t *v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
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
  id *v148;
  uint64_t v149;
  uint64_t (*v150)(uint64_t, uint64_t);
  void (*v151)(uint64_t);
  id v152;
  uint8_t v153[8];
  uint8_t *v154;
  uint64_t v155;
  uint64_t (*v156)(uint64_t, uint64_t);
  void (*v157)(uint64_t);
  id v158;
  _BYTE v159[128];
  uint64_t v160;
  id *v161;
  uint64_t v162;
  uint64_t (*v163)(uint64_t, uint64_t);
  void (*v164)(uint64_t);
  id v165;
  uint8_t buf[8];
  uint8_t *v167;
  uint64_t v168;
  uint64_t (*v169)(uint64_t, uint64_t);
  void (*v170)(uint64_t);
  id v171;
  _BYTE v172[128];
  uint64_t v173;
  uint8_t v174[8];
  uint64_t v175;

  v175 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "distance");
  v6 = v5;
  v108 = v4;
  objc_msgSend(v4, "location");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v7, -16200.0);
  v105 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v105 && v106)
  {
    objc_msgSend(v105, "earlierDate:", v106);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToDate:", v105);

    if (v10)
      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v105, v106);
    else
      v8 = 0;
  }
  v102 = (void *)v8;
  v107 = -[RTMapsSupportOptions initWithDateInterval:location:distance:]([RTMapsSupportOptions alloc], "initWithDateInterval:location:distance:", v8, v104, v6);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = 0;
  v141 = &v140;
  v142 = 0x3032000000;
  v143 = __Block_byref_object_copy__119;
  v144 = __Block_byref_object_dispose__119;
  v145 = 0;
  v134 = 0;
  v135 = (id *)&v134;
  v136 = 0x3032000000;
  v137 = __Block_byref_object_copy__119;
  v138 = __Block_byref_object_dispose__119;
  v139 = 0;
  v12 = dispatch_semaphore_create(0);
  -[RTMapItemProviderMapsSupport mapsSupportManager](self, "mapsSupportManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v130[0] = MEMORY[0x1E0C809B0];
  v130[1] = 3221225472;
  v130[2] = __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke;
  v130[3] = &unk_1E9296EE0;
  v132 = &v140;
  v133 = &v134;
  v14 = v12;
  v131 = v14;
  objc_msgSend(v13, "fetchFavoritePlacesWithOptions:handler:", v107, v130);

  v15 = v14;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v15, v17))
    goto LABEL_11;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSinceDate:", v16);
  v20 = v19;
  v21 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_86);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "filteredArrayUsingPredicate:", v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "submitToCoreAnalytics:type:duration:", v25, 1, v20);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v27 = (void *)MEMORY[0x1E0CB35C8];
  v160 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v160, 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = objc_retainAutorelease(v29);

    v31 = 0;
  }
  else
  {
LABEL_11:
    v30 = 0;
    v31 = 1;
  }

  v32 = v30;
  if ((v31 & 1) == 0)
    objc_storeStrong(v135 + 5, v30);
  v33 = v135[5];
  if (v33)
  {
    if ((objc_msgSend(v33, "isOnlyTimeoutError") & 1) != 0)
    {
      v34 = (void *)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v34 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v135[5]);
    }
  }
  else
  {
    v128 = 0u;
    v129 = 0u;
    v126 = 0u;
    v127 = 0u;
    v35 = (id)v141[5];
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v126, v172, 16);
    if (v36)
    {
      v37 = *(_QWORD *)v127;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v127 != v37)
            objc_enumerationMutation(v35);
          objc_msgSend(*(id *)(*((_QWORD *)&v126 + 1) + 8 * i), "mapItem");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v39);

        }
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v126, v172, 16);
      }
      while (v36);
    }

    *(_QWORD *)buf = 0;
    v167 = buf;
    v168 = 0x3032000000;
    v169 = __Block_byref_object_copy__119;
    v170 = __Block_byref_object_dispose__119;
    v171 = 0;
    v160 = 0;
    v161 = (id *)&v160;
    v162 = 0x3032000000;
    v163 = __Block_byref_object_copy__119;
    v164 = __Block_byref_object_dispose__119;
    v165 = 0;
    v40 = dispatch_semaphore_create(0);

    -[RTMapItemProviderMapsSupport mapsSupportManager](self, "mapsSupportManager");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v122[0] = MEMORY[0x1E0C809B0];
    v122[1] = 3221225472;
    v122[2] = __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_2;
    v122[3] = &unk_1E9296EE0;
    v124 = buf;
    v125 = &v160;
    v42 = v40;
    v123 = v42;
    objc_msgSend(v41, "fetchHistoryEntryPlaceDisplaysWithOptions:handler:", v107, v122);

    v15 = v42;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v15, v44))
      goto LABEL_31;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "timeIntervalSinceDate:", v43);
    v47 = v46;
    v48 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_86);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "filteredArrayUsingPredicate:", v49);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "firstObject");
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v48, "submitToCoreAnalytics:type:duration:", v52, 1, v47);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v53 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v153 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v53, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v153, 2u);
    }

    v54 = (void *)MEMORY[0x1E0CB35C8];
    v147 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v153 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v153, &v147, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    if (v56)
    {
      v57 = objc_retainAutorelease(v56);

      v58 = 0;
    }
    else
    {
LABEL_31:
      v58 = 1;
      v57 = v32;
    }

    v59 = v57;
    if ((v58 & 1) == 0)
      objc_storeStrong(v161 + 5, v57);
    v60 = v161[5];
    if (v60)
    {
      if ((objc_msgSend(v60, "isOnlyTimeoutError") & 1) != 0)
      {
        v34 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v34 = 0;
        if (a4)
          *a4 = objc_retainAutorelease(v161[5]);
      }
    }
    else
    {
      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v61 = *((id *)v167 + 5);
      v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v118, v159, 16);
      if (v62)
      {
        v63 = *(_QWORD *)v119;
        do
        {
          for (j = 0; j != v62; ++j)
          {
            if (*(_QWORD *)v119 != v63)
              objc_enumerationMutation(v61);
            objc_msgSend(*(id *)(*((_QWORD *)&v118 + 1) + 8 * j), "mapItem");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v65);

          }
          v62 = objc_msgSend(v61, "countByEnumeratingWithState:objects:count:", &v118, v159, 16);
        }
        while (v62);
      }

      *(_QWORD *)v153 = 0;
      v154 = v153;
      v155 = 0x3032000000;
      v156 = __Block_byref_object_copy__119;
      v157 = __Block_byref_object_dispose__119;
      v158 = 0;
      v147 = 0;
      v148 = (id *)&v147;
      v149 = 0x3032000000;
      v150 = __Block_byref_object_copy__119;
      v151 = __Block_byref_object_dispose__119;
      v152 = 0;
      v66 = dispatch_semaphore_create(0);

      -[RTMapItemProviderMapsSupport mapsSupportManager](self, "mapsSupportManager");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v114[0] = MEMORY[0x1E0C809B0];
      v114[1] = 3221225472;
      v114[2] = __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_3;
      v114[3] = &unk_1E9296EE0;
      v116 = v153;
      v117 = &v147;
      v68 = v66;
      v115 = v68;
      objc_msgSend(v67, "fetchHistoryEntryRoutesWithOptions:handler:", v107, v114);

      v15 = v68;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      v70 = dispatch_time(0, 3600000000000);
      if (!dispatch_semaphore_wait(v15, v70))
        goto LABEL_52;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "timeIntervalSinceDate:", v69);
      v73 = v72;
      v74 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_86);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v76, "filteredArrayUsingPredicate:", v75);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "firstObject");
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v74, "submitToCoreAnalytics:type:duration:", v78, 1, v73);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v79 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v174 = 0;
        _os_log_fault_impl(&dword_1D1A22000, v79, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v174, 2u);
      }

      v80 = (void *)MEMORY[0x1E0CB35C8];
      v173 = *MEMORY[0x1E0CB2D50];
      *(_QWORD *)v174 = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v174, &v173, 1);
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();

      if (v82)
      {
        v83 = objc_retainAutorelease(v82);

        v84 = 0;
      }
      else
      {
LABEL_52:
        v84 = 1;
        v83 = v59;
      }

      v85 = v83;
      if ((v84 & 1) == 0)
        objc_storeStrong(v148 + 5, v83);
      v86 = v148[5];
      if (v86)
      {
        if ((objc_msgSend(v86, "isOnlyTimeoutError") & 1) != 0)
        {
          v34 = (void *)MEMORY[0x1E0C9AA60];
        }
        else
        {
          v34 = 0;
          if (a4)
            *a4 = objc_retainAutorelease(v148[5]);
        }
      }
      else
      {
        v112 = 0u;
        v113 = 0u;
        v110 = 0u;
        v111 = 0u;
        v87 = *((id *)v154 + 5);
        v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v110, v146, 16);
        if (v88)
        {
          v89 = *(_QWORD *)v111;
          do
          {
            for (k = 0; k != v88; ++k)
            {
              if (*(_QWORD *)v111 != v89)
                objc_enumerationMutation(v87);
              v91 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * k);
              objc_msgSend(v91, "originMapItem");
              v92 = (void *)objc_claimAutoreleasedReturnValue();

              if (v92)
              {
                objc_msgSend(v91, "originMapItem");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addObject:", v93);

              }
              objc_msgSend(v91, "destinationMapItem");
              v94 = (void *)objc_claimAutoreleasedReturnValue();

              if (v94)
              {
                objc_msgSend(v91, "destinationMapItem");
                v95 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "addObject:", v95);

              }
            }
            v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v110, v146, 16);
          }
          while (v88);
        }

        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_91);
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "filteredArrayUsingPredicate:", v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        v98 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v97);
        v109[0] = MEMORY[0x1E0C809B0];
        v109[1] = 3221225472;
        v109[2] = __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_5;
        v109[3] = &unk_1E9298788;
        v109[4] = self;
        -[_RTMap withBlock:](v98, "withBlock:", v109);
        v99 = (void *)objc_claimAutoreleasedReturnValue();

        -[RTMapItemProviderBase filterInferredMapItems:byDistance:fromLocation:error:](self, "filterInferredMapItems:byDistance:fromLocation:error:", v99, v104, a4, v6);
        v34 = (void *)objc_claimAutoreleasedReturnValue();

      }
      _Block_object_dispose(&v147, 8);

      _Block_object_dispose(v153, 8);
      v59 = v85;
    }

    _Block_object_dispose(&v160, 8);
    _Block_object_dispose(buf, 8);

    v32 = v59;
  }

  _Block_object_dispose(&v134, 8);
  _Block_object_dispose(&v140, 8);

  return v34;
}

- (RTMapsSupportManager)mapsSupportManager
{
  return self->_mapsSupportManager;
}

void __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke(uint64_t a1, void *a2, void *a3)
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

void __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
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

void __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
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

- (RTMapItemProviderMapsSupport)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_distanceCalculator_mapsSupportManager_);
}

- (RTMapItemProviderMapsSupport)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 mapsSupportManager:(id)a5
{
  id v8;
  id v9;
  id v10;
  RTMapItemProviderMapsSupportParameters *v11;
  RTMapItemProviderMapsSupport *v12;
  NSObject *v13;
  uint8_t v15[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = -[RTMapItemProviderMapsSupportParameters initWithDefaultsManager:]([RTMapItemProviderMapsSupportParameters alloc], "initWithDefaultsManager:", v8);
    self = -[RTMapItemProviderMapsSupport initWithDefaultsManager:distanceCalculator:mapsSupportManager:parameters:](self, "initWithDefaultsManager:distanceCalculator:mapsSupportManager:parameters:", v8, v9, v10, v11);

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

- (RTMapItemProviderMapsSupport)initWithDefaultsManager:(id)a3 distanceCalculator:(id)a4 mapsSupportManager:(id)a5 parameters:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  RTMapItemProviderMapsSupport *v15;
  id *p_isa;
  NSObject *v17;
  id v18;
  RTMapItemProviderMapsSupport *v19;
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
    v21 = "Invalid parameter not satisfying: mapsSupportManager";
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
  v23.super_class = (Class)RTMapItemProviderMapsSupport;
  v15 = -[RTMapItemProviderBase initWithDefaultsManager:distanceCalculator:](&v23, sel_initWithDefaultsManager_distanceCalculator_, v10, v11);
  p_isa = (id *)&v15->super.super.isa;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mapsSupportManager, a5);
    objc_storeStrong(p_isa + 4, a6);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = p_isa[4];
      *(_DWORD *)buf = 138412290;
      v25 = v18;
      _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "initialized RTMapItemProviderMapsSupport with parameters: %@", buf, 0xCu);
    }

  }
  self = p_isa;
  v19 = self;
LABEL_12:

  return v19;
}

BOOL __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  v2 = a2;
  if (objc_msgSend(v2, "validMUID"))
  {
    objc_msgSend(v2, "address");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "mergedThoroughfare");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id __58__RTMapItemProviderMapsSupport_mapItemsWithOptions_error___block_invoke_5(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  double v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D183A8];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(*(id *)(a1 + 32), "confidenceFromMapItemSource:", objc_msgSend(v4, "source"));
  v7 = (void *)objc_msgSend(v5, "initWithMapItem:confidence:source:", v4, objc_msgSend(v4, "source"), v6);

  return v7;
}

- (double)confidenceFromMapItemSource:(unint64_t)a3
{
  double result;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((uint64_t)a3 > 1023)
  {
    if ((uint64_t)a3 >= 0x8000)
    {
      if ((uint64_t)a3 < 0x20000)
      {
        if (a3 != 0x8000 && a3 != 0x10000)
          return 0.0;
      }
      else if (a3 != 0x20000 && a3 != 0x40000 && a3 != 0x80000)
      {
        return 0.0;
      }
    }
    else if ((uint64_t)a3 <= 4095)
    {
      if (a3 != 1024 && a3 != 2048)
        return 0.0;
    }
    else if (a3 != 4096 && a3 != 0x2000 && a3 != 0x4000)
    {
      return 0.0;
    }
    goto LABEL_31;
  }
  if ((uint64_t)a3 <= 15)
  {
    if (a3 >= 3 && a3 != 4 && a3 != 8)
      return 0.0;
LABEL_31:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = 136315394;
      v6 = "-[RTMapItemProviderMapsSupport confidenceFromMapItemSource:]";
      v7 = 1024;
      v8 = 241;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid source in RTMapItemProviderMapsSupport. (in %s:%d)", (uint8_t *)&v5, 0x12u);
    }

    return 0.0;
  }
  if ((uint64_t)a3 <= 127)
  {
    if (a3 != 16)
    {
      if (a3 == 64)
      {
        -[RTMapItemProviderMapsSupportParameters historyEntryRouteConfidence](self->_parameters, "historyEntryRouteConfidence");
        return result;
      }
      return 0.0;
    }
    -[RTMapItemProviderMapsSupportParameters favoriteConfidence](self->_parameters, "favoriteConfidence");
  }
  else
  {
    if (a3 != 128)
    {
      if (a3 != 256 && a3 != 512)
        return 0.0;
      goto LABEL_31;
    }
    -[RTMapItemProviderMapsSupportParameters historyEntryPlaceDisplayConfidence](self->_parameters, "historyEntryPlaceDisplayConfidence");
  }
  return result;
}

- (BOOL)skipForOptions:(id)a3 error:(id *)a4
{
  return 0;
}

- (void)setMapsSupportManager:(id)a3
{
  objc_storeStrong((id *)&self->_mapsSupportManager, a3);
}

- (RTMapItemProviderMapsSupportParameters)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_mapsSupportManager, 0);
}

@end
