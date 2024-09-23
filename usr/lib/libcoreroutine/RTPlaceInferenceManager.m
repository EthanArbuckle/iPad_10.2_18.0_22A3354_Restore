@implementation RTPlaceInferenceManager

void __55__RTPlaceInferenceManager_sanityCheckMapItemProviders___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  int v6;
  NSObject *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = objc_msgSend(v5, "isMemberOfClass:", objc_opt_class());
  if (a3 && v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v10;
      v15 = 2080;
      v16 = "+[RTPlaceInferenceManager sanityCheckMapItemProviders:]_block_invoke";
      v17 = 1024;
      v18 = 1031;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "the first mapItem provider must be %@ (in %s:%d)", (uint8_t *)&v13, 0x1Cu);

    }
  }
  if (objc_msgSend(v5, "isMemberOfClass:", objc_opt_class())
    && objc_msgSend(*(id *)(a1 + 32), "count") - 1 != a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412802;
      v14 = v12;
      v15 = 2080;
      v16 = "+[RTPlaceInferenceManager sanityCheckMapItemProviders:]_block_invoke";
      v17 = 1024;
      v18 = 1037;
      _os_log_error_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_ERROR, "the last mapItem provider must be %@ (in %s:%d)", (uint8_t *)&v13, 0x1Cu);

    }
  }

}

- (id)_placeInferenceFromInferredMapItem:(id)a3 referenceLocation:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (v9)
  {
    v27 = 0;
    v28 = 0;
    v26 = 0;
    v11 = -[RTPlaceInferenceManager _inferUserSpecificPlaceTypeForInferredMapItem:userSpecificPlaceType:userSpecificPlaceTypeSource:error:](self, "_inferUserSpecificPlaceTypeForInferredMapItem:userSpecificPlaceType:userSpecificPlaceTypeSource:error:", v9, &v28, &v27, &v26);
    v12 = v26;
    if (!v11)
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(a2);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v30 = v25;
        v31 = 2112;
        v32 = v9;
        v33 = 2112;
        v34 = v12;
        _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "%@, failed to infer user specific place type for inferredMapItem, %@ error, %@", buf, 0x20u);

      }
      if (a5)
        *a5 = objc_retainAutorelease(v12);
      v27 = 0;
      v28 = 0;
    }
    -[RTPlaceInferenceManager _loiIdentifierForInferredMapItem:](self, "_loiIdentifierForInferredMapItem:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0D18420];
    objc_msgSend(v9, "mapItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "placeInferencePlaceTypeFromMapItem:userType:source:", v16, 0, objc_msgSend(v9, "source"));

    v18 = objc_alloc(MEMORY[0x1E0D18420]);
    objc_msgSend(v9, "mapItem");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v27;
    v20 = v28;
    objc_msgSend(v9, "confidence");
    v22 = (void *)objc_msgSend(v18, "initWithMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:loiIdentifier:", v19, v20, v21, v17, v10, v14);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem", buf, 2u);
    }

    v22 = 0;
  }

  return v22;
}

void __66__RTPlaceInferenceManager_fetchPlaceInferencesForOptions_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v6 = 0;
  objc_msgSend(v2, "_placeInferencesForOptions:error:", v3, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v6;
  (*(void (**)(void))(a1[6] + 16))();

}

- (id)_selectMapItemProvidersForOptions:(id)a3 targetProvider:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  objc_class *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  char v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  objc_class *v29;
  void *v30;
  char v31;
  void *v32;
  void *v33;
  objc_class *v34;
  void *v35;
  char v36;
  void *v37;
  void *v38;
  NSObject *v39;
  objc_class *v40;
  void *v41;
  char v42;
  void *v43;
  void *v44;
  objc_class *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  objc_class *v51;
  void *v52;
  char v53;
  void *v54;
  uint8_t v56[16];

  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTPlaceInferenceManager defaultsManager](self, "defaultsManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", CFSTR("RTDefaultsMapItemProviderDenyList"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RTPlaceInferenceManager _addMapItemProviderFromArray:toSet:](self, "_addMapItemProviderFromArray:toSet:", v10, v8);
    objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "defaultForKey:defaultValue:", CFSTR("RTDefaultsMapItemProviderDenyList"), MEMORY[0x1E0C9AA60]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[RTPlaceInferenceManager _addMapItemProviderFromArray:toSet:](self, "_addMapItemProviderFromArray:toSet:", v12, v8);
    v13 = objc_msgSend(v6, "fidelityPolicy");
    if ((v13 & 0x20) != 0)
    {
      v40 = (objc_class *)objc_opt_class();
      NSStringFromClass(v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v8, "containsObject:", v41);

      if ((v42 & 1) == 0)
      {
        -[RTPlaceInferenceManager mapItemProviders](self, "mapItemProviders");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "objectForKeyedSubscript:", &unk_1E93267C8);
        v44 = (void *)objc_claimAutoreleasedReturnValue();

        if (v44)
          objc_msgSend(v7, "addObject:", v44);

      }
      goto LABEL_54;
    }
    switch(a4)
    {
      case 0uLL:
      case 3uLL:
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v8, "containsObject:", v15);

        if ((v16 & 1) == 0)
        {
          -[RTPlaceInferenceManager mapItemProviders](self, "mapItemProviders");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", &unk_1E93267F8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
            objc_msgSend(v7, "addObject:", v18);

        }
        if (!a4)
          goto LABEL_13;
        break;
      case 4uLL:
LABEL_13:
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v8, "containsObject:", v20);

        if ((v21 & 1) == 0)
        {
          -[RTPlaceInferenceManager mapItemProviders](self, "mapItemProviders");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", &unk_1E9326810);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (v23)
            objc_msgSend(v7, "addObject:", v23);

        }
        if (!a4)
          goto LABEL_18;
        break;
      case 8uLL:
LABEL_18:
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v8, "containsObject:", v25);

        if ((v26 & 1) == 0)
        {
          -[RTPlaceInferenceManager mapItemProviders](self, "mapItemProviders");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "objectForKeyedSubscript:", &unk_1E9326828);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (v28)
            objc_msgSend(v7, "addObject:", v28);

        }
        break;
      default:
        break;
    }
    if ((v13 & 3) != 0)
    {
      if (a4 <= 1)
      {
        v29 = (objc_class *)objc_opt_class();
        NSStringFromClass(v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v8, "containsObject:", v30);

        if ((v31 & 1) == 0)
        {
          -[RTPlaceInferenceManager mapItemProviders](self, "mapItemProviders");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "objectForKeyedSubscript:", &unk_1E93267C8);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          if (v33)
            objc_msgSend(v7, "addObject:", v33);

        }
      }
      if ((a4 | 2) == 2)
      {
        v34 = (objc_class *)objc_opt_class();
        NSStringFromClass(v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v8, "containsObject:", v35);

        if ((v36 & 1) == 0)
        {
          -[RTPlaceInferenceManager mapItemProviders](self, "mapItemProviders");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "objectForKeyedSubscript:", &unk_1E93267E0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          if (v38)
            objc_msgSend(v7, "addObject:", v38);

        }
      }
    }
    if ((v13 & 2) == 0)
    {
      if (a4 != 7)
        goto LABEL_53;
LABEL_48:
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v8, "containsObject:", v52);

      if ((v53 & 1) == 0)
      {
        -[RTPlaceInferenceManager mapItemProviders](self, "mapItemProviders");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = v48;
        v50 = &unk_1E9326858;
        goto LABEL_50;
      }
      goto LABEL_53;
    }
    if (a4)
    {
      if (a4 == 7)
        goto LABEL_48;
      if (a4 != 6)
        goto LABEL_53;
    }
    v45 = (objc_class *)objc_opt_class();
    NSStringFromClass(v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v8, "containsObject:", v46);

    if ((v47 & 1) == 0)
    {
      -[RTPlaceInferenceManager mapItemProviders](self, "mapItemProviders");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = v48;
      v50 = &unk_1E9326840;
LABEL_50:
      objc_msgSend(v48, "objectForKeyedSubscript:", v50);
      v54 = (void *)objc_claimAutoreleasedReturnValue();

      if (v54)
        objc_msgSend(v7, "addObject:", v54);

    }
LABEL_53:
    +[RTPlaceInferenceManager sanityCheckMapItemProviders:](RTPlaceInferenceManager, "sanityCheckMapItemProviders:", v7);
LABEL_54:

    goto LABEL_55;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v39 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v56 = 0;
    _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options", v56, 2u);
  }

  v7 = 0;
LABEL_55:

  return v7;
}

- (NSDictionary)mapItemProviders
{
  return self->_mapItemProviders;
}

+ (void)sanityCheckMapItemProviders:(id)a3
{
  id v3;
  _QWORD v4[4];
  id v5;

  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __55__RTPlaceInferenceManager_sanityCheckMapItemProviders___block_invoke;
    v4[3] = &unk_1E92974A0;
    v5 = v3;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v4);

  }
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)_addMapItemProviderFromArray:(id)a3 toSet:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v6 = a3;
  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __62__RTPlaceInferenceManager__addMapItemProviderFromArray_toSet___block_invoke;
    v7[3] = &unk_1E92974C8;
    v8 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

  }
}

- (id)_placeInferencesForOptions:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  NSObject *v56;
  objc_class *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  id v61;
  NSObject *v62;
  NSObject *v63;
  objc_class *v64;
  void *v65;
  uint64_t v66;
  objc_class *v67;
  uint64_t v68;
  _BOOL8 v70;
  void *v71;
  unint64_t v72;
  id v73;
  void *v74;
  void *v75;
  BOOL v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  id *v82;
  void *v83;
  void *v84;
  id v85;
  NSObject *v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  uint64_t v91;
  void *v92;
  void *v93;
  id v94;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  id v100;
  NSObject *v101;
  id v102;
  objc_class *v103;
  void *v104;
  uint64_t v105;
  id *v106;
  id *v107;
  id *v108;
  void *v109;
  void *v110;
  void *v111;
  objc_class *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  RTPlaceInferenceMetrics *v117;
  __CFString *v118;
  void *context;
  void *v120;
  void *v121;
  void *v122;
  id *v123;
  void *v124;
  void *v126;
  id obj;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  id v133;
  id v134;
  _QWORD v135[5];
  id v136;
  id v137;
  _QWORD v138[2];
  _QWORD v139[5];
  id v140;
  id v141;
  _QWORD v142[2];
  id v143;
  id v144;
  id v145;
  uint64_t v146;
  id v147;
  id v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  _QWORD v153[5];
  _BYTE v154[128];
  uint64_t v155;
  uint64_t v156;
  id v157;
  void *v158;
  _BYTE buf[12];
  __int16 v160;
  uint64_t v161;
  __int16 v162;
  uint64_t v163;
  uint64_t v164;
  _QWORD v165[4];

  v165[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "locations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTPlaceInferenceManager _placeInferencesForOptions:error:]";
      v160 = 1024;
      LODWORD(v161) = 412;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: options.locations.count (in %s:%d)", buf, 0x12u);
    }

  }
  objc_msgSend(v6, "locations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v6, "fidelityPolicy");
      objc_msgSend(v6, "locations");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v14;
      v160 = 2048;
      v161 = v15;
      v162 = 2048;
      v163 = v17;
      _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%@, fidelity policy, %lu, location count, %lu", buf, 0x20u);

    }
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("timestamp"), 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locations");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v158 = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v158, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sortedArrayUsingDescriptors:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v132 = v21;
    -[RTPlaceInferenceManager _selectLastLocationFromLocations:maxHorizontalUncertainty:](self, "_selectLastLocationFromLocations:maxHorizontalUncertainty:", v21, 250.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        v153[0] = MEMORY[0x1E0C809B0];
        v153[1] = 3221225472;
        v153[2] = __60__RTPlaceInferenceManager__placeInferencesForOptions_error___block_invoke;
        v153[3] = &__block_descriptor_40_e27_v32__0__CLLocation_8Q16_B24l;
        v153[4] = a2;
        objc_msgSend(v21, "enumerateObjectsUsingBlock:", v153);
      }
      v134 = v22;
      if ((objc_msgSend(v6, "fidelityPolicy") & 8) != 0 && (objc_msgSend(v6, "fidelityPolicy") & 2) != 0)
      {
        -[RTPlaceInferenceManager _estimatedLocationFromSortedLocations:](self, "_estimatedLocationFromSortedLocations:", v21);
        v23 = objc_claimAutoreleasedReturnValue();

        -[RTPlaceInferenceManager _updateCachedLocationsWithLocation:](self, "_updateCachedLocationsWithLocation:", v23);
        v134 = (id)v23;
      }
      if ((objc_msgSend(v6, "fidelityPolicy") & 0x10) != 0)
      {
        if ((objc_msgSend(v6, "fidelityPolicy") & 8) != 0 && (objc_msgSend(v6, "fidelityPolicy") & 2) == 0)
        {
          -[RTPlaceInferenceManager _closestCachedLocationForLocation:](self, "_closestCachedLocationForLocation:", v134);
          v38 = objc_claimAutoreleasedReturnValue();

          v134 = (id)v38;
        }
        v39 = objc_msgSend(objc_alloc(MEMORY[0x1E0D18420]), "initWithMapItem:finerGranularityMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:finerGranularityMapItemConfidence:loiIdentifier:preferredName:", 0, 0, 0, 0, 0, v134, 0.0, 0.0, 0, 0);
        v37 = (void *)v39;
        if (v39)
        {
          v155 = v39;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v155, 1);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v33 = 0;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v24 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v25 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v132, "firstObject");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "timestamp");
        v131 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v132, "lastObject");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "timestamp");
        v130 = (void *)objc_claimAutoreleasedReturnValue();

        v28 = -[RTPlaceInferenceManager placeInferencesLimit](self, "placeInferencesLimit");
        if (objc_msgSend(v6, "limit") >= 1)
          v28 = objc_msgSend(v6, "limit");
        v129 = v28;
        context = (void *)MEMORY[0x1D8231EA8]();
        objc_msgSend(v6, "clientIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = (void *)v24;
        v120 = v22;
        if (v29)
        {
          objc_msgSend(v6, "clientIdentifier");
          v30 = (const __CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v30 = CFSTR("unknown");
        }
        v121 = v18;
        v122 = (void *)v25;
        v123 = a4;

        v117 = -[RTPlaceInferenceMetrics initWithClientIdentifier:placeInferenceOptions:]([RTPlaceInferenceMetrics alloc], "initWithClientIdentifier:placeInferenceOptions:", v30, v6);
        v118 = (__CFString *)v30;
        self->_clientMappingIndex = -[RTPlaceInferenceManager _getMappingIndexForClientIdentifier:](self, "_getMappingIndexForClientIdentifier:", v30);
        -[RTPlaceInferenceManager _selectMapItemProvidersForOptions:](self, "_selectMapItemProvidersForOptions:", v6);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
        v41 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          v42 = objc_msgSend(v6, "fidelityPolicy");
          v43 = objc_msgSend(v40, "count");
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = v42;
          v160 = 2048;
          v161 = v43;
          _os_log_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_INFO, "fidelity policy %lu has %lu providers", buf, 0x16u);
        }

        v151 = 0u;
        v152 = 0u;
        v149 = 0u;
        v150 = 0u;
        obj = v40;
        v44 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v154, 16);
        v133 = v6;
        if (v44)
        {
          v45 = v44;
          v46 = *(_QWORD *)v150;
          do
          {
            for (i = 0; i != v45; ++i)
            {
              if (*(_QWORD *)v150 != v46)
                objc_enumerationMutation(obj);
              v48 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * i);
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v128, "count"))
              {
                v49 = objc_alloc(MEMORY[0x1E0D18428]);
                v50 = objc_msgSend(v6, "fidelityPolicy");
                objc_msgSend(v6, "accessPoints");
                v51 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "clientIdentifier");
                v52 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v116) = 0;
                v53 = (void *)objc_msgSend(v49, "initWithFidelityPolicy:locations:accessPoints:distance:location:startDate:endDate:limit:useBackground:clientIdentifier:", v50, v132, v51, v134, v131, v130, 50.0, v129, v116, v52);

                v148 = 0;
                objc_msgSend(v48, "mapItemsWithOptions:error:", v53, &v148);
                v54 = (void *)objc_claimAutoreleasedReturnValue();
                v55 = v148;
                _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                v56 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  v57 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v57);
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  v59 = objc_msgSend(v54, "count");
                  *(_DWORD *)buf = 138412802;
                  *(_QWORD *)&buf[4] = v58;
                  v160 = 2048;
                  v161 = v59;
                  v162 = 2112;
                  v163 = (uint64_t)v55;
                  _os_log_impl(&dword_1D1A22000, v56, OS_LOG_TYPE_INFO, "provider, %@, mapItems, %lu, error, %@", buf, 0x20u);

                }
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v60 = objc_msgSend(v55, "code");
                  v147 = 0;
                  -[RTPlaceInferenceManager _savePlaceInferenceQueriesFromInferredMapItems:inferenceErrorCode:referenceLocation:options:outError:](self, "_savePlaceInferenceQueriesFromInferredMapItems:inferenceErrorCode:referenceLocation:options:outError:", v54, v60, v134, v133, &v147);
                  v61 = v147;
                  if (v61)
                  {
                    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                    v62 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
                    {
                      v67 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v67);
                      v124 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 138412546;
                      *(_QWORD *)&buf[4] = v124;
                      v160 = 2112;
                      v161 = (uint64_t)v61;
                      _os_log_error_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_ERROR, "%@, saving BluePOI queries hits error, %@", buf, 0x16u);

                    }
                  }

                }
                if (v55)
                {
                  objc_msgSend(v126, "addObject:", v55);
                  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
                  v63 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
                  {
                    v64 = (objc_class *)objc_opt_class();
                    NSStringFromClass(v64);
                    v65 = (void *)objc_claimAutoreleasedReturnValue();
                    v66 = objc_msgSend(v54, "count");
                    *(_DWORD *)buf = 138412802;
                    *(_QWORD *)&buf[4] = v65;
                    v160 = 2048;
                    v161 = v66;
                    v162 = 2112;
                    v163 = (uint64_t)v55;
                    _os_log_debug_impl(&dword_1D1A22000, v63, OS_LOG_TYPE_DEBUG, "provider, %@, mapItems, %lu, error, %@", buf, 0x20u);

                  }
                }
                else if (objc_msgSend(v54, "count"))
                {
                  objc_msgSend(v128, "addObjectsFromArray:", v54);
                }

                v6 = v133;
              }
            }
            v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v154, 16);
          }
          while (v45);
        }

        v68 = objc_msgSend(v6, "fidelityPolicy");
        v70 = (objc_msgSend(v6, "fidelityPolicy") & 0x20) == 0 && v68 != 7;
        v37 = v128;
        if (objc_msgSend(v128, "count"))
        {
          v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v128, "count"));
          if (objc_msgSend(v128, "count"))
          {
            v72 = 0;
            v73 = 0;
            do
            {
              v74 = v73;
              *(_QWORD *)buf = 0;
              v146 = 0;
              objc_msgSend(v128, "objectAtIndexedSubscript:", v72);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              v145 = v73;
              v76 = -[RTPlaceInferenceManager _learnedPlaceTypeForInferredMapItem:placeType:placeTypeSource:error:](self, "_learnedPlaceTypeForInferredMapItem:placeType:placeTypeSource:error:", v75, buf, &v146, &v145);
              v73 = v145;

              if (!v76)
              {
                *(_QWORD *)buf = 0;
                v146 = 0;
              }
              v77 = objc_alloc(MEMORY[0x1E0D18408]);
              objc_msgSend(v128, "objectAtIndexedSubscript:", v72);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)buf);
              v79 = (void *)objc_claimAutoreleasedReturnValue();
              v80 = (void *)objc_msgSend(v77, "initWithFirstObject:secondObject:", v78, v79);

              if (v80)
                objc_msgSend(v71, "addObject:", v80);
              if (v73)
                objc_msgSend(v126, "addObject:", v73);

              ++v72;
            }
            while (v72 < objc_msgSend(v128, "count"));
          }
          else
          {
            v73 = 0;
          }
          -[RTPlaceInferenceManager inferredMapItemFuser](self, "inferredMapItemFuser");
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = v73;
          objc_msgSend(v83, "fusedInferredMapItemsUsingCandidates:referenceLocation:snapToBestKnownPlaceAndAoi:error:", v71, v134, v70, &v144);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v85 = v144;

          v33 = v122;
          v82 = v123;
          if (v85)
            objc_msgSend(v126, "addObject:", v85);
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v86 = objc_claimAutoreleasedReturnValue();
          v6 = v133;
          if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
          {
            v87 = objc_msgSend(v128, "count");
            v88 = objc_msgSend(v84, "count");
            *(_DWORD *)buf = 134218498;
            *(_QWORD *)&buf[4] = v87;
            v160 = 2048;
            v161 = v88;
            v162 = 2112;
            v163 = (uint64_t)v85;
            _os_log_impl(&dword_1D1A22000, v86, OS_LOG_TYPE_INFO, "fusion, inferrend mapitems, %lu, fused mapitems, %lu, error, %@", buf, 0x20u);
          }

          v81 = v84;
        }
        else
        {
          v81 = (void *)MEMORY[0x1E0C9AA60];
          v33 = v122;
          v82 = v123;
        }
        if (objc_msgSend(v81, "count"))
        {
          objc_msgSend(v81, "firstObject");
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v89, "mapItem");
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          if (v90)
            goto LABEL_97;
        }
        -[RTPlaceInferenceManager _getFallbackMapItemProviderForOptions:](self, "_getFallbackMapItemProviderForOptions:", v6);
        v91 = objc_claimAutoreleasedReturnValue();
        if (!v91)
          goto LABEL_97;
        v92 = (void *)v91;
        v93 = v81;
        v94 = objc_alloc(MEMORY[0x1E0D18428]);
        v95 = objc_msgSend(v6, "fidelityPolicy");
        objc_msgSend(v6, "accessPoints");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "clientIdentifier");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v116) = 0;
        v98 = (void *)objc_msgSend(v94, "initWithFidelityPolicy:locations:accessPoints:distance:location:startDate:endDate:limit:useBackground:clientIdentifier:", v95, v132, v96, v134, v131, v130, 50.0, v129, v116, v97);

        v143 = 0;
        objc_msgSend(v92, "mapItemsWithOptions:error:", v98, &v143);
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v143;
        if (v100)
        {
          objc_msgSend(v126, "addObject:", v100);
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v101 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
          {
            v113 = (objc_class *)objc_opt_class();
            NSStringFromClass(v113);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            v115 = objc_msgSend(v99, "count");
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v114;
            v160 = 2048;
            v161 = v115;
            v162 = 2112;
            v163 = (uint64_t)v100;
            _os_log_debug_impl(&dword_1D1A22000, v101, OS_LOG_TYPE_DEBUG, "provider, %@, mapItems, %lu, error, %@", buf, 0x20u);

          }
          v102 = 0;
        }
        else
        {
          v102 = v99;
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v101 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
          {
            v103 = (objc_class *)objc_opt_class();
            NSStringFromClass(v103);
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v105 = objc_msgSend(v102, "count");
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v104;
            v160 = 2048;
            v161 = v105;
            v162 = 2112;
            v163 = 0;
            _os_log_impl(&dword_1D1A22000, v101, OS_LOG_TYPE_INFO, "provider, %@, mapItems, %lu, error, %@", buf, 0x20u);

          }
        }
        v81 = v93;

        v6 = v133;
        v33 = v122;
        v82 = v123;
        v37 = v128;
        if (!v102)
        {
LABEL_97:
          v135[0] = MEMORY[0x1E0C809B0];
          v135[1] = 3221225472;
          v135[2] = __60__RTPlaceInferenceManager__placeInferencesForOptions_error___block_invoke_2;
          v135[3] = &unk_1E9297450;
          v135[4] = self;
          v106 = &v136;
          v136 = v134;
          v107 = &v137;
          v137 = v33;
          v108 = (id *)v138;
          v138[0] = v126;
          v138[1] = v129;
          objc_msgSend(v81, "enumerateObjectsUsingBlock:", v135);
          v102 = (id)MEMORY[0x1E0C9AA60];
        }
        else
        {
          v139[0] = MEMORY[0x1E0C809B0];
          v139[1] = 3221225472;
          v139[2] = __60__RTPlaceInferenceManager__placeInferencesForOptions_error___block_invoke_148;
          v139[3] = &unk_1E9297428;
          v139[4] = self;
          v106 = &v140;
          v140 = v134;
          v107 = &v141;
          v141 = v122;
          v108 = (id *)v142;
          v142[0] = v126;
          v142[1] = v129;
          objc_msgSend(v102, "enumerateObjectsUsingBlock:", v139);
        }

        v22 = v120;
        if ((objc_msgSend(v6, "fidelityPolicy") & 8) != 0 && (objc_msgSend(v6, "fidelityPolicy") & 2) == 0)
        {
          -[RTPlaceInferenceManager _selectBestCandidateAndUpdateReferenceLocation:](self, "_selectBestCandidateAndUpdateReferenceLocation:", v33);
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "removeAllObjects");
          if (v109)
            objc_msgSend(v33, "addObject:", v109);

        }
        -[RTPlaceInferenceManager dailyMetrics](self, "dailyMetrics");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "increaseCountForClientMappingIndex:", LODWORD(self->_clientMappingIndex));

        -[RTPlaceInferenceManager sendPlaceInferenceMetrics:inferredMapItems:fusedMapItems:fallbackInferredMapItems:finalPlaceInferences:referenceLocation:](self, "sendPlaceInferenceMetrics:inferredMapItems:fusedMapItems:fallbackInferredMapItems:finalPlaceInferences:referenceLocation:", v117, v37, v81, v102, v33, v134);
        objc_autoreleasePoolPop(context);
        if (v82 && objc_msgSend(v126, "count") && !objc_msgSend(v33, "count"))
        {
          _RTSafeArray();
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          _RTMultiErrorCreate();
          *v82 = (id)objc_claimAutoreleasedReturnValue();

        }
        v18 = v121;
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = self;
        _os_log_error_impl(&dword_1D1A22000, v34, OS_LOG_TYPE_ERROR, "At least one non-cell location should be provided, %@", buf, 0xCu);
      }

      if (!a4)
      {
        v33 = 0;
LABEL_109:

        goto LABEL_110;
      }
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0D18598];
      v156 = *MEMORY[0x1E0CB2D50];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("At least one non-cell location should be provided."));
      v134 = (id)objc_claimAutoreleasedReturnValue();
      v157 = v134;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v157, &v156, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 7, v37);
      v33 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_109;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = self;
    _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "At least one location should be provided, %@", buf, 0xCu);
  }

  if (a4)
  {
    v31 = (void *)MEMORY[0x1E0CB35C8];
    v32 = *MEMORY[0x1E0D18598];
    v164 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("At least one location should be provided."));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v165[0] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v165, &v164, 1);
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "errorWithDomain:code:userInfo:", v32, 7);
    v33 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_110:

    goto LABEL_111;
  }
  v33 = 0;
LABEL_111:

  return v33;
}

- (unint64_t)placeInferencesLimit
{
  return self->_placeInferencesLimit;
}

- (id)_selectMapItemProvidersForOptions:(id)a3
{
  return -[RTPlaceInferenceManager _selectMapItemProvidersForOptions:targetProvider:](self, "_selectMapItemProvidersForOptions:targetProvider:", a3, 0);
}

- (id)_selectLastLocationFromLocations:(id)a3 maxHorizontalUncertainty:(double)a4
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  _QWORD v10[6];
  _BYTE buf[24];
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTPlaceInferenceManager _selectLastLocationFromLocations:maxHorizontalUncertainty:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 330;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations.count (in %s:%d)", buf, 0x12u);
    }

  }
  if (objc_msgSend(v5, "count"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v12 = __Block_byref_object_copy__2;
    v13 = __Block_byref_object_dispose__2;
    v14 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __85__RTPlaceInferenceManager__selectLastLocationFromLocations_maxHorizontalUncertainty___block_invoke;
    v10[3] = &unk_1E92973E0;
    *(double *)&v10[5] = a4;
    v10[4] = buf;
    objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v10);
    if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
    {
      v7 = objc_alloc(MEMORY[0x1E0D183B0]);
      v8 = (void *)objc_msgSend(v7, "initWithCLLocation:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
    }
    else
    {
      v8 = 0;
    }
    _Block_object_dispose(buf, 8);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)_getMappingIndexForClientIdentifier:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "hasSuffix:", CFSTR("CoreRoutine")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "hasSuffix:", CFSTR("DoNotDisturb.bundle")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "hasSuffix:", CFSTR("Emergency SOS.bundle")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "hasSuffix:", CFSTR("findmy")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "hasSuffix:", CFSTR("GeocorrectionDLocationBundle.bundle")) & 1) != 0)
  {
    v4 = 7;
  }
  else if ((objc_msgSend(v3, "hasSuffix:", CFSTR("HomeKitDaemon.framework")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "hasSuffix:", CFSTR("CoreParsec.framework")) & 1) != 0)
  {
    v4 = 2;
  }
  else if (objc_msgSend(v3, "hasSuffix:", CFSTR("VoiceMemos")))
  {
    v4 = 8;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_getFallbackMapItemProviderForOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if ((objc_msgSend(v4, "fidelityPolicy") & 4) != 0)
  {
    -[RTPlaceInferenceManager _selectMapItemProvidersForOptions:targetProvider:](self, "_selectMapItemProvidersForOptions:targetProvider:", v4, 7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)sendPlaceInferenceMetrics:(id)a3 inferredMapItems:(id)a4 fusedMapItems:(id)a5 fallbackInferredMapItems:(id)a6 finalPlaceInferences:(id)a7 referenceLocation:(id)a8
{
  id v13;
  id v14;
  void *v15;
  double v16;
  double v17;
  unint64_t v18;
  _BOOL4 v19;
  dispatch_semaphore_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  dispatch_time_t v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  char v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  uint64_t v48;
  _BOOL8 v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  BOOL v66;
  void *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  uint64_t v72;
  void *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  uint64_t v80;
  id v82;
  id v83;
  id v84;
  id v85;
  uint64_t v86;
  _QWORD v87[4];
  NSObject *v88;
  __int128 *p_buf;
  uint64_t *v90;
  uint64_t v91;
  id *v92;
  uint64_t v93;
  uint64_t (*v94)(uint64_t, uint64_t);
  void (*v95)(uint64_t);
  id v96;
  _QWORD v97[5];
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  int v101;
  _QWORD v102[12];
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  uint64_t (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  id v114;
  uint64_t v115;
  uint64_t *v116;
  uint64_t v117;
  int v118;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  char v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  char v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  char v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  char v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  char v138;
  __int128 buf;
  uint64_t v140;
  uint64_t (*v141)(uint64_t, uint64_t);
  void (*v142)(uint64_t);
  id v143;
  uint64_t v144;
  uint8_t v145[16];
  uint64_t v146;

  v146 = *MEMORY[0x1E0C80C00];
  v82 = a3;
  v13 = a4;
  v83 = a5;
  v14 = a6;
  v85 = a7;
  v84 = a8;
  v78 = v14;
  v79 = objc_msgSend(v14, "count");
  v135 = 0;
  v136 = &v135;
  v137 = 0x2020000000;
  v138 = 0;
  v131 = 0;
  v132 = &v131;
  v133 = 0x2020000000;
  v134 = 0;
  v127 = 0;
  v128 = &v127;
  v129 = 0x2020000000;
  v130 = 0;
  v123 = 0;
  v124 = &v123;
  v125 = 0x2020000000;
  v126 = 0;
  v119 = 0;
  v120 = &v119;
  v121 = 0x2020000000;
  v122 = 0;
  v115 = 0;
  v116 = &v115;
  v117 = 0x2020000000;
  v118 = 0;
  v109 = 0;
  v110 = &v109;
  v111 = 0x3032000000;
  v112 = __Block_byref_object_copy__2;
  v113 = __Block_byref_object_dispose__2;
  v114 = 0;
  v103 = 0;
  v104 = &v103;
  v105 = 0x3032000000;
  v106 = __Block_byref_object_copy__2;
  v107 = __Block_byref_object_dispose__2;
  v108 = (id)objc_opt_new();
  v102[0] = MEMORY[0x1E0C809B0];
  v102[1] = 3221225472;
  v102[2] = __148__RTPlaceInferenceManager_sendPlaceInferenceMetrics_inferredMapItems_fusedMapItems_fallbackInferredMapItems_finalPlaceInferences_referenceLocation___block_invoke;
  v102[3] = &unk_1E92974F0;
  v102[4] = &v109;
  v102[5] = &v115;
  v102[6] = &v123;
  v102[7] = &v131;
  v102[8] = &v135;
  v102[9] = &v103;
  v102[10] = &v119;
  v102[11] = &v127;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v102);
  v80 = objc_msgSend(v83, "count");
  v98 = 0;
  v99 = &v98;
  v100 = 0x2020000000;
  v101 = 0;
  v97[0] = MEMORY[0x1E0C809B0];
  v97[1] = 3221225472;
  v97[2] = __148__RTPlaceInferenceManager_sendPlaceInferenceMetrics_inferredMapItems_fusedMapItems_fallbackInferredMapItems_finalPlaceInferences_referenceLocation___block_invoke_2;
  v97[3] = &unk_1E9297518;
  v97[4] = &v98;
  objc_msgSend(v83, "enumerateObjectsUsingBlock:", v97);
  if (self->_visitEntryTime)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", self->_visitEntryTime);
    v17 = v16;

    v18 = vcvtad_u64_f64(v17);
    v19 = 1;
  }
  else if (self->_clientMappingIndex == 2)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v140 = 0x3032000000;
    v141 = __Block_byref_object_copy__2;
    v142 = __Block_byref_object_dispose__2;
    v143 = 0;
    v91 = 0;
    v92 = (id *)&v91;
    v93 = 0x3032000000;
    v94 = __Block_byref_object_copy__2;
    v95 = __Block_byref_object_dispose__2;
    v96 = 0;
    v20 = dispatch_semaphore_create(0);
    -[RTPlaceInferenceManager visitStore](self, "visitStore");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_alloc(MEMORY[0x1E0D18508]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0D185C8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", &unk_1E9326888);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithAscending:confidence:dateInterval:labelVisit:limit:sources:", 0, v23, 0, 1, &unk_1E9326870, v24);
    v87[0] = MEMORY[0x1E0C809B0];
    v87[1] = 3221225472;
    v87[2] = __148__RTPlaceInferenceManager_sendPlaceInferenceMetrics_inferredMapItems_fusedMapItems_fallbackInferredMapItems_finalPlaceInferences_referenceLocation___block_invoke_176;
    v87[3] = &unk_1E9296EE0;
    p_buf = &buf;
    v90 = &v91;
    v26 = v20;
    v88 = v26;
    objc_msgSend(v21, "fetchVisitsWithOptions:handler:", v25, v87);

    v27 = v26;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(v27, v29))
      goto LABEL_10;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "timeIntervalSinceDate:", v28);
    v31 = v30;
    v75 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_2);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "filteredArrayUsingPredicate:", v76);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "firstObject");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v75, "submitToCoreAnalytics:type:duration:", v34, 1, v31);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v145 = 0;
      _os_log_fault_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v145, 2u);
    }

    v36 = (void *)MEMORY[0x1E0CB35C8];
    v144 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)v145 = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v145, &v144, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
    {
      v39 = objc_retainAutorelease(v38);

      v40 = (void *)v28;
      v41 = 0;
    }
    else
    {
LABEL_10:
      v40 = (void *)v28;
      v39 = 0;
      v41 = 1;
    }

    v42 = v39;
    if ((v41 & 1) == 0)
      objc_storeStrong(v92 + 5, v39);
    v43 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "type");
    v19 = v43 == 1;
    if (v43 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "entry");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "timeIntervalSinceDate:", v45);
      v47 = v46;

      v18 = vcvtad_u64_f64(v47);
    }
    else
    {
      v18 = -1;
    }

    _Block_object_dispose(&v91, 8);
    _Block_object_dispose(&buf, 8);

  }
  else
  {
    v19 = 0;
    v18 = -1;
  }
  if (v18 >= 0xE10)
    v48 = 3600;
  else
    v48 = v18;
  v49 = v18 < 0xE11 && v19;
  objc_msgSend(v82, "setPlaceInferences:", v85);
  objc_msgSend(v82, "setTopPersonalizedLabelsInferredMapItems:topBluePOIInferredMapItem:", v104[5], v110[5]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v99 + 6));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v50, CFSTR("afterFusionCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v51, CFSTR("beforeFusionCount"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v48);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v52, CFSTR("callEntryLatency"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_clientMappingIndex);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v53, CFSTR("clientIdMappingIndex"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v110[5] != 0);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v54, CFSTR("hasBluePOIResults"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v120 + 24));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v55, CFSTR("hasConfidentLocalHints"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v136 + 24));
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v56, CFSTR("hasCurrentPOIResult"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v132 + 24));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v57, CFSTR("hasLearnedPlaceInResults"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v128 + 24));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v58, CFSTR("hasMapSupportResults"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((unsigned __int8 *)v124 + 24));
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v59, CFSTR("hasRevGeocodeInResults"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v80 != 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v60, CFSTR("hasFusedResults"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v79 != 0);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v61, CFSTR("hasFallbackResults"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v49);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v62, CFSTR("isInVisit"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *((unsigned int *)v116 + 6));
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v63, CFSTR("sourceCount"));

  if (v84
    && objc_msgSend(v85, "count")
    && (objc_msgSend(v85, "objectAtIndexedSubscript:", 0),
        v64 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v64, "referenceLocation"),
        v65 = (void *)objc_claimAutoreleasedReturnValue(),
        v66 = v65 == 0,
        v65,
        v64,
        !v66))
  {
    -[RTPlaceInferenceManager distanceCalculator](self, "distanceCalculator");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "objectAtIndexedSubscript:", 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "referenceLocation");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v86 = 0;
    objc_msgSend(v67, "distanceFromLocation:toLocation:error:", v84, v69, &v86);
    v71 = v70;

    v72 = (uint64_t)v71;
  }
  else
  {
    v72 = -1;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v72);
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v82, "setObject:forKey:", v73, CFSTR("distanceBetweenReferenceLocationAndUpdatedReferenceLocation"));

  objc_msgSend(v82, "submitMetrics");
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v74 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v82;
    _os_log_impl(&dword_1D1A22000, v74, OS_LOG_TYPE_INFO, "metrics, %@", (uint8_t *)&buf, 0xCu);
  }

  _Block_object_dispose(&v98, 8);
  _Block_object_dispose(&v103, 8);

  _Block_object_dispose(&v109, 8);
  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);
  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v131, 8);
  _Block_object_dispose(&v135, 8);

}

void __85__RTPlaceInferenceManager__selectLastLocationFromLocations_maxHorizontalUncertainty___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "horizontalAccuracy");
  if (v7 < *(double *)(a1 + 40))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)fetchPlaceInferencesForOptions:(id)a3 handler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, NSObject *);
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD block[5];
  id v16;
  void (**v17)(id, _QWORD, NSObject *);
  uint64_t v18;
  void *v19;
  uint8_t buf[4];
  RTPlaceInferenceManager *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, NSObject *))a4;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
    goto LABEL_9;
  }
  if (!v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v21 = self;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "options is required, %@", buf, 0xCu);
    }

    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D18598];
    v18 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("options is required."));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 7, v14);
    v9 = objc_claimAutoreleasedReturnValue();

    v7[2](v7, 0, v9);
LABEL_9:

    goto LABEL_10;
  }
  -[RTNotifier queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__RTPlaceInferenceManager_fetchPlaceInferencesForOptions_handler___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v16 = v6;
  v17 = v7;
  dispatch_async(v8, block);

LABEL_10:
}

void __60__RTPlaceInferenceManager__loiIdentifierForInferredMapItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v5 = a3;
  objc_msgSend(a2, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v5;
  v11 = v5;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (RTPlaceInferenceDailyMetrics)dailyMetrics
{
  return self->_dailyMetrics;
}

- (id)_loiIdentifierForInferredMapItem:(id)a3
{
  id v5;
  dispatch_semaphore_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  void *v32;
  id v33;
  _QWORD v34[4];
  NSObject *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  id *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  _BYTE buf[12];
  __int16 v51;
  id v52;
  _QWORD v53[4];

  v53[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__2;
  v48 = __Block_byref_object_dispose__2;
  v49 = 0;
  v38 = 0;
  v39 = (id *)&v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__2;
  v42 = __Block_byref_object_dispose__2;
  v43 = 0;
  v6 = dispatch_semaphore_create(0);
  -[RTPlaceInferenceManager learnedLocationStore](self, "learnedLocationStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mapItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __60__RTPlaceInferenceManager__loiIdentifierForInferredMapItem___block_invoke;
  v34[3] = &unk_1E9297478;
  v36 = &v44;
  v37 = &v38;
  v9 = v6;
  v35 = v9;
  objc_msgSend(v7, "fetchLocationOfInterestWithMapItem:handler:", v8, v34);

  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v11);
  v15 = v14;
  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filteredArrayUsingPredicate:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "submitToCoreAnalytics:type:duration:", v20, 1, v15);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v22 = (void *)MEMORY[0x1E0CB35C8];
  v53[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v53, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_retainAutorelease(v24);

    v26 = 0;
  }
  else
  {
LABEL_6:
    v25 = 0;
    v26 = 1;
  }

  v27 = v25;
  if ((v26 & 1) == 0)
    objc_storeStrong(v39 + 5, v25);
  if (!v39[5])
    goto LABEL_14;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v39[5];
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v32;
    v51 = 2112;
    v52 = v33;
    _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "%@, error, %@", buf, 0x16u);

  }
  if (v39[5])
    v29 = 0;
  else
LABEL_14:
    v29 = (void *)v45[5];
  v30 = v29;

  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v44, 8);

  return v30;
}

- (BOOL)_inferUserSpecificPlaceTypeForInferredMapItem:(id)a3 userSpecificPlaceType:(unint64_t *)a4 userSpecificPlaceTypeSource:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  unint64_t v15;
  NSObject *v16;
  const __CFString *v17;
  NSObject *v18;
  NSObject *v19;
  id v21;
  uint64_t v22;
  uint8_t buf[16];

  v10 = a3;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem", buf, 2u);
    }

    if (!a6)
      goto LABEL_19;
    v17 = CFSTR("inferredMapItem");
    goto LABEL_18;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: userSpecificPlaceType", buf, 2u);
    }

    if (!a6)
      goto LABEL_19;
    v17 = CFSTR("userSpecificPlaceType");
LABEL_18:
    _RTErrorInvalidParameterCreate((uint64_t)v17);
    v13 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: userSpecificPlaceTypeSource", buf, 2u);
    }

    if (a6)
    {
      v17 = CFSTR("userSpecificPlaceTypeSource");
      goto LABEL_18;
    }
LABEL_19:
    v13 = 0;
    goto LABEL_24;
  }
  v22 = 0;
  *(_QWORD *)buf = 0;
  -[RTPlaceInferenceManager learnedLocationStore](self, "learnedLocationStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mapItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v13 = objc_msgSend(v11, "placeTypeForMapItem:placeType:placeTypeSource:error:", v12, buf, &v22, &v21);
  v14 = v21;

  if ((v13 & 1) != 0)
  {
    *a4 = +[RTPlaceInferenceManager userSpecificPlaceTypeFromLearnedPlaceType:](RTPlaceInferenceManager, "userSpecificPlaceTypeFromLearnedPlaceType:", *(_QWORD *)buf);
    v15 = +[RTPlaceInferenceManager userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:](RTPlaceInferenceManager, "userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:", v22);
  }
  else
  {
    if (a6)
      *a6 = objc_retainAutorelease(v14);
    v15 = 0;
    *a4 = 0;
  }
  *a5 = v15;

LABEL_24:
  return v13;
}

+ (unint64_t)userSpecificPlaceTypeSourceFromLearnedPlaceTypeSource:(unint64_t)a3
{
  return a3 & 7;
}

+ (unint64_t)userSpecificPlaceTypeFromLearnedPlaceType:(unint64_t)a3
{
  if (a3 - 1 >= 4)
    return 0;
  else
    return a3;
}

- (RTPlaceInferenceManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithQueue_defaultsManager_distanceCalculator_eventManager_fingerprintManager_inferredMapItemFuser_learnedLocationStore_locationManager_mapServiceManager_mapsSupportManager_metricManager_motionActivityManager_placeInferenceQueryStore_platform_portraitManager_visitStore_);
}

- (RTPlaceInferenceManager)initWithQueue:(id)a3 defaultsManager:(id)a4 distanceCalculator:(id)a5 eventManager:(id)a6 fingerprintManager:(id)a7 inferredMapItemFuser:(id)a8 learnedLocationStore:(id)a9 locationManager:(id)a10 mapServiceManager:(id)a11 mapsSupportManager:(id)a12 metricManager:(id)a13 motionActivityManager:(id)a14 placeInferenceQueryStore:(id)a15 platform:(id)a16 portraitManager:(id)a17 visitStore:(id)a18
{
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSMutableArray *cachedLocations;
  void *v32;
  RTPlaceInferenceDailyMetrics *v33;
  RTPlaceInferenceDailyMetrics *dailyMetrics;
  uint64_t v35;
  NSDictionary *mapItemProviders;
  RTPlaceInferenceManager *v37;
  RTPlaceInferenceManager *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  const char *v45;
  NSObject *v47;
  id obj;
  id v49;
  RTPlaceInferenceManager *v51;
  id v52;
  id v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  objc_super v65;
  uint8_t buf[16];

  v64 = a3;
  obj = a4;
  v56 = a4;
  v63 = a5;
  v62 = a6;
  v61 = a7;
  v49 = a8;
  v23 = a8;
  v24 = a9;
  v55 = a10;
  v53 = a11;
  v25 = a12;
  v52 = a13;
  v60 = a14;
  v59 = a15;
  v58 = a16;
  v57 = a17;
  v26 = a18;
  v54 = v26;
  if (!v64)
  {
    v27 = v56;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: queue", buf, 2u);
    }

    v38 = 0;
    v41 = v63;
    goto LABEL_27;
  }
  v27 = v56;
  if (!v56)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v42 = objc_claimAutoreleasedReturnValue();
    v41 = v63;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v42, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v38 = 0;
LABEL_27:
    v28 = v55;
    v29 = v53;
    v37 = self;
    v39 = v52;
    goto LABEL_55;
  }
  if (v63)
  {
    v28 = v55;
    v29 = v53;
    if (v62)
    {
      if (v61)
      {
        if (v23)
        {
          if (v24)
          {
            if (v55)
            {
              if (v53)
              {
                if (v25)
                {
                  if (v60)
                  {
                    if (v59)
                    {
                      if (v58)
                      {
                        if (v57)
                        {
                          if (v26)
                          {
                            v65.receiver = self;
                            v65.super_class = (Class)RTPlaceInferenceManager;
                            v51 = -[RTNotifier init](&v65, sel_init);
                            if (v51)
                            {
                              objc_storeStrong((id *)&v51->_defaultsManager, obj);
                              objc_storeStrong((id *)&v51->_distanceCalculator, a5);
                              objc_storeStrong((id *)&v51->_metricManager, a13);
                              objc_storeStrong((id *)&v51->_inferredMapItemFuser, v49);
                              objc_storeStrong((id *)&v51->_learnedLocationStore, a9);
                              v51->_placeInferencesLimit = 50;
                              v30 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 10);
                              cachedLocations = v51->_cachedLocations;
                              v51->_cachedLocations = (NSMutableArray *)v30;

                              v51->_cachedLocationIndex = 0;
                              objc_storeStrong((id *)&v51->_locationManager, a10);
                              objc_storeStrong((id *)&v51->_mapServiceManager, a11);
                              objc_storeStrong((id *)&v51->_visitStore, a18);
                              objc_storeStrong((id *)&v51->_placeInferenceQueryStore, a15);
                              -[RTDefaultsManager objectForKey:](v51->_defaultsManager, "objectForKey:", CFSTR("RTDefaultsPlaceInferenceManagerPlaceInferencesLimit"));
                              v32 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                                v51->_placeInferencesLimit = objc_msgSend(v32, "unsignedIntegerValue");
                              v51->_clientMappingIndex = 0;
                              v33 = -[RTPlaceInferenceDailyMetrics initWithDefaultsManager:]([RTPlaceInferenceDailyMetrics alloc], "initWithDefaultsManager:", v56);
                              dailyMetrics = v51->_dailyMetrics;
                              v51->_dailyMetrics = v33;

                              -[RTPlaceInferenceManager createAllMapItemProvidersWithDefaultManager:distanceCalculator:eventManager:fingerprintManager:learnedLocationStore:locationManager:mapServiceManager:mapsSupportManager:motionActivityManager:platform:portraitManager:visitStore:](v51, "createAllMapItemProvidersWithDefaultManager:distanceCalculator:eventManager:fingerprintManager:learnedLocationStore:locationManager:mapServiceManager:mapsSupportManager:motionActivityManager:platform:portraitManager:visitStore:", v56, v63, v62, v61, v24, v55, v53, v25, v60, v58, v57, v54);
                              v35 = objc_claimAutoreleasedReturnValue();
                              v29 = v53;
                              mapItemProviders = v51->_mapItemProviders;
                              v51->_mapItemProviders = (NSDictionary *)v35;

                              -[RTService setup](v51, "setup");
                            }
                            v37 = v51;
                            v38 = v37;
                            v39 = v52;
                          }
                          else
                          {
                            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                            v47 = objc_claimAutoreleasedReturnValue();
                            v39 = v52;
                            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_error_impl(&dword_1D1A22000, v47, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitStore", buf, 2u);
                            }

                            v38 = 0;
                            v37 = self;
                          }
                          v41 = v63;
                          v28 = v55;
                          v27 = v56;
                          goto LABEL_55;
                        }
                        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                        v44 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                        {
                          *(_WORD *)buf = 0;
                          v45 = "Invalid parameter not satisfying: portraitManager";
                          goto LABEL_53;
                        }
LABEL_54:

                        v38 = 0;
                        v37 = self;
                        v39 = v52;
                        v41 = v63;
                        goto LABEL_55;
                      }
                      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                      v44 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                        goto LABEL_54;
                      *(_WORD *)buf = 0;
                      v45 = "Invalid parameter not satisfying: platform";
                    }
                    else
                    {
                      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                      v44 = objc_claimAutoreleasedReturnValue();
                      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                        goto LABEL_54;
                      *(_WORD *)buf = 0;
                      v45 = "Invalid parameter not satisfying: placeInferenceQueryStore";
                    }
                  }
                  else
                  {
                    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                    v44 = objc_claimAutoreleasedReturnValue();
                    if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                      goto LABEL_54;
                    *(_WORD *)buf = 0;
                    v45 = "Invalid parameter not satisfying: motionActivityManager";
                  }
                }
                else
                {
                  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                    goto LABEL_54;
                  *(_WORD *)buf = 0;
                  v45 = "Invalid parameter not satisfying: mapsSupportManager";
                }
              }
              else
              {
                _rt_log_facility_get_os_log(RTLogFacilityGeneral);
                v44 = objc_claimAutoreleasedReturnValue();
                if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                  goto LABEL_54;
                *(_WORD *)buf = 0;
                v45 = "Invalid parameter not satisfying: mapServiceManager";
              }
            }
            else
            {
              _rt_log_facility_get_os_log(RTLogFacilityGeneral);
              v44 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
                goto LABEL_54;
              *(_WORD *)buf = 0;
              v45 = "Invalid parameter not satisfying: locationManager";
            }
          }
          else
          {
            _rt_log_facility_get_os_log(RTLogFacilityGeneral);
            v44 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              goto LABEL_54;
            *(_WORD *)buf = 0;
            v45 = "Invalid parameter not satisfying: learnedLocationStore";
          }
        }
        else
        {
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v44 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            goto LABEL_54;
          *(_WORD *)buf = 0;
          v45 = "Invalid parameter not satisfying: inferredMapItemFuser";
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v44 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
          goto LABEL_54;
        *(_WORD *)buf = 0;
        v45 = "Invalid parameter not satisfying: fingerprintManager";
      }
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v44 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        goto LABEL_54;
      *(_WORD *)buf = 0;
      v45 = "Invalid parameter not satisfying: eventManager";
    }
LABEL_53:
    _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, v45, buf, 2u);
    goto LABEL_54;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v43 = objc_claimAutoreleasedReturnValue();
  v28 = v55;
  v29 = v53;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v43, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", buf, 2u);
  }

  v38 = 0;
  v37 = self;
  v39 = v52;
  v41 = 0;
LABEL_55:

  return v38;
}

- (id)createAllMapItemProvidersWithDefaultManager:(id)a3 distanceCalculator:(id)a4 eventManager:(id)a5 fingerprintManager:(id)a6 learnedLocationStore:(id)a7 locationManager:(id)a8 mapServiceManager:(id)a9 mapsSupportManager:(id)a10 motionActivityManager:(id)a11 platform:(id)a12 portraitManager:(id)a13 visitStore:(id)a14
{
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  RTMapItemProviderEventKit *v30;
  RTMapItemProviderLearnedPlace *v31;
  RTMapItemProviderMapsSupport *v32;
  void *v33;
  RTMapItemProviderProactiveExperts *v34;
  RTMapItemProviderReverseGeocode *v35;
  NSObject *v36;
  NSObject *v37;
  const char *v38;
  RTMapItemProviderCurrentPOI *v40;
  RTMapItemProviderProactiveExperts *v41;
  RTMapItemProviderMapsSupport *v42;
  RTMapItemProviderLearnedPlace *v43;
  void *v44;
  RTMapItemProviderEventKit *v45;
  RTMapItemProviderCurrentPOI *v47;
  id v48;
  RTMapItemProviderBluePOI *v49;
  RTMapItemProviderBluePOI *v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint8_t buf[16];

  v48 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v54 = a8;
  v23 = a9;
  v53 = a10;
  v52 = a11;
  v51 = a12;
  v24 = a13;
  v25 = a14;
  v26 = v25;
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", buf, 2u);
    }

    v29 = 0;
    v27 = v48;
    goto LABEL_30;
  }
  if (!v20)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    v27 = v48;
    v28 = v23;
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: eventManager";
LABEL_51:
    _os_log_error_impl(&dword_1D1A22000, v37, OS_LOG_TYPE_ERROR, v38, buf, 2u);
    goto LABEL_52;
  }
  v27 = v48;
  v28 = v23;
  if (!v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: fingerprintManager";
    goto LABEL_51;
  }
  if (!v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: learnedLocationStore";
    goto LABEL_51;
  }
  if (!v54)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_51;
  }
  if (!v23)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: mapServiceManager";
    goto LABEL_51;
  }
  if (!v53)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: mapsSupportManager";
    goto LABEL_51;
  }
  if (!v52)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_51;
  }
  if (!v51)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: platform";
    goto LABEL_51;
  }
  if (!v24)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      goto LABEL_52;
    *(_WORD *)buf = 0;
    v38 = "Invalid parameter not satisfying: portraitManager";
    goto LABEL_51;
  }
  if (!v25)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v38 = "Invalid parameter not satisfying: visitStore";
      goto LABEL_51;
    }
LABEL_52:

    v29 = 0;
    goto LABEL_53;
  }
  v29 = (void *)objc_opt_new();
  v49 = [RTMapItemProviderBluePOI alloc];
  -[RTPlaceInferenceManager placeInferenceQueryStore](self, "placeInferenceQueryStore");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = -[RTMapItemProviderBluePOI initWithDefaultsManager:distanceCalculator:fingerprintManager:locationManager:mapServiceManager:motionActivityManager:placeInferenceQueryStore:platform:](v49, "initWithDefaultsManager:distanceCalculator:fingerprintManager:locationManager:mapServiceManager:motionActivityManager:placeInferenceQueryStore:platform:", v48, v19, v21, v54, v23, v52, v44, v51);

  if (v50)
    objc_msgSend(v29, "setObject:forKey:", v50, &unk_1E93267C8);
  v30 = -[RTMapItemProviderEventKit initWithDefaultsManager:distanceCalculator:eventManager:mapServiceManager:]([RTMapItemProviderEventKit alloc], "initWithDefaultsManager:distanceCalculator:eventManager:mapServiceManager:", v48, v19, v20, v23);
  if (v30)
    objc_msgSend(v29, "setObject:forKey:", v30, &unk_1E93267E0);
  v45 = v30;
  v31 = -[RTMapItemProviderLearnedPlace initWithDefaultsManager:distanceCalculator:learnedLocationStore:]([RTMapItemProviderLearnedPlace alloc], "initWithDefaultsManager:distanceCalculator:learnedLocationStore:", v48, v19, v22);
  if (v31)
    objc_msgSend(v29, "setObject:forKey:", v31, &unk_1E93267F8);
  v43 = v31;
  v32 = -[RTMapItemProviderMapsSupport initWithDefaultsManager:distanceCalculator:mapsSupportManager:]([RTMapItemProviderMapsSupport alloc], "initWithDefaultsManager:distanceCalculator:mapsSupportManager:", v48, v19, v53);
  if (v32)
    objc_msgSend(v29, "setObject:forKey:", v32, &unk_1E9326810);
  v42 = v32;
  v40 = [RTMapItemProviderCurrentPOI alloc];
  -[RTPlaceInferenceManager placeInferenceQueryStore](self, "placeInferenceQueryStore");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = -[RTMapItemProviderCurrentPOI initWithDefaultsManager:distanceCalculator:placeInferenceQueryStore:visitStore:](v40, "initWithDefaultsManager:distanceCalculator:placeInferenceQueryStore:visitStore:", v48, v19, v33, v26);

  if (v47)
    objc_msgSend(v29, "setObject:forKey:", v47, &unk_1E9326828);
  v34 = -[RTMapItemProviderProactiveExperts initWithDefaultsManager:distanceCalculator:mapServiceManager:personalizationPortraitManager:]([RTMapItemProviderProactiveExperts alloc], "initWithDefaultsManager:distanceCalculator:mapServiceManager:personalizationPortraitManager:", v48, v19, v23, v24);
  if (v34)
    objc_msgSend(v29, "setObject:forKey:", v34, &unk_1E9326840);
  v41 = v34;
  v35 = -[RTMapItemProviderReverseGeocode initWithDefaultsManager:mapServiceManager:]([RTMapItemProviderReverseGeocode alloc], "initWithDefaultsManager:mapServiceManager:", v48, v23);
  if (v35)
    objc_msgSend(v29, "setObject:forKey:", v35, &unk_1E9326858);

LABEL_30:
  v28 = v23;
LABEL_53:

  return v29;
}

- (void)_registerForDailyMetricsNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel_onDailyMetricsNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

  -[RTPlaceInferenceManager visitManager](self, "visitManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:", self, sel_onVisitManagerVisitIncidentNotification_, v5);

  -[RTPlaceInferenceManager visitManager](self, "visitManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTPointOfInterestMonitorVisitNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:", self, sel_onPointOfInterestVisitNotification_, v6);

}

- (void)_shutdownWithHandler:(id)a3
{
  void (**v5)(id, _QWORD);
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  RTPlaceInferenceManager *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (void (**)(id, _QWORD))a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = self;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@ %@", (uint8_t *)&v8, 0x16u);

  }
  -[RTPlaceInferenceManager _unRegisterForDailyMetricsNotifications](self, "_unRegisterForDailyMetricsNotifications");
  if (v5)
    v5[2](v5, 0);

}

- (void)_unRegisterForDailyMetricsNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[RTPlaceInferenceManager locationManager](self, "locationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:fromNotification:", self, v4);

  -[RTPlaceInferenceManager visitManager](self, "visitManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:fromNotification:", self, v6);

  -[RTPlaceInferenceManager visitManager](self, "visitManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTPointOfInterestMonitorVisitNotification, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObserver:fromNotification:", self, v7);

}

- (void)_updateCachedLocationsWithLocation:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  NSMutableArray *cachedLocations;
  char *v10;
  uint64_t v11;
  unint64_t cachedLocationIndex;
  int v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "-[RTPlaceInferenceManager _updateCachedLocationsWithLocation:]";
      v15 = 1024;
      LODWORD(v16) = 354;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", (uint8_t *)&v13, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(a2);
    v10 = (char *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSMutableArray count](self->_cachedLocations, "count");
    cachedLocationIndex = self->_cachedLocationIndex;
    v13 = 138413058;
    v14 = v10;
    v15 = 2112;
    v16 = v5;
    v17 = 2048;
    v18 = v11;
    v19 = 2048;
    v20 = cachedLocationIndex;
    _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, location, %@, cached locations count, %lu, current index, %lu", (uint8_t *)&v13, 0x2Au);

  }
  v8 = -[NSMutableArray count](self->_cachedLocations, "count");
  cachedLocations = self->_cachedLocations;
  if (v8 > 9)
    -[NSMutableArray replaceObjectAtIndex:withObject:](cachedLocations, "replaceObjectAtIndex:withObject:", self->_cachedLocationIndex, v5);
  else
    -[NSMutableArray addObject:](cachedLocations, "addObject:", v5);
  self->_cachedLocationIndex = (self->_cachedLocationIndex + 1) % 0xA;

}

- (id)_closestCachedLocationForLocation:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  NSObject *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  NSObject *v17;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  NSMutableArray *obj;
  id v27;
  NSObject *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  double v40;
  __int16 v41;
  uint64_t v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v27 = a3;
  if (v27)
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = self->_cachedLocations;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
    if (v4)
    {
      v5 = v4;
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v9 = *(_QWORD *)v30;
      v10 = 1.79769313e308;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          v12 = v7;
          if (*(_QWORD *)v30 != v9)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          -[RTPlaceInferenceManager distanceCalculator](self, "distanceCalculator");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = v7;
          objc_msgSend(v14, "distanceFromLocation:toLocation:error:", v27, v13, &v28);
          v16 = v15;
          v7 = v28;

          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            NSStringFromSelector(a2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            v34 = v20;
            v35 = 2048;
            v36 = v6;
            v37 = 2112;
            v38 = v13;
            v39 = 2048;
            v40 = v16;
            v41 = 2112;
            v42 = (uint64_t)v7;
            _os_log_debug_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_DEBUG, "%@, index, %lu, cached location, %@, distance, %.3f, error, %@", buf, 0x34u);

          }
          if (!v7 && v16 <= 50.0 && v16 < v10)
          {
            v19 = v13;

            ++v6;
            v10 = v16;
            v8 = v19;
          }
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v43, 16);
      }
      while (v5);
    }
    else
    {
      v7 = 0;
      v8 = 0;
      v10 = 1.79769313e308;
    }

    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[NSMutableArray count](self->_cachedLocations, "count");
      *(_DWORD *)buf = 138413314;
      v34 = v22;
      v35 = 2112;
      v36 = v8;
      v37 = 2112;
      v38 = v27;
      v39 = 2048;
      v40 = v10;
      v41 = 2048;
      v42 = v23;
      _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@, selected cached location, %@, for location, %@, distance, %.3f, cached locations count, %lu", buf, 0x34u);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location", buf, 2u);
    }
    v8 = 0;
  }

  return v8;
}

void __60__RTPlaceInferenceManager__placeInferencesForOptions_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412802;
    v9 = v7;
    v10 = 2048;
    v11 = a3 + 1;
    v12 = 2112;
    v13 = v5;
    _os_log_debug_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_DEBUG, "%@, sorted location %lu, %@", (uint8_t *)&v8, 0x20u);

  }
}

void __60__RTPlaceInferenceManager__placeInferencesForOptions_error___block_invoke_148(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = 0;
  objc_msgSend(v6, "_placeInferenceFromInferredMapItem:referenceLocation:error:", a2, v7, &v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v10;
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);
  if (v9)
    objc_msgSend(*(id *)(a1 + 56), "addObject:", v9);
  if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") >= *(_QWORD *)(a1 + 64))
    *a4 = 1;

}

void __60__RTPlaceInferenceManager__placeInferencesForOptions_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(a2, "convertToInferredMapItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = *(void **)(a1 + 32);
    v8 = *(_QWORD *)(a1 + 40);
    v11 = 0;
    objc_msgSend(v7, "_placeInferenceFromInferredMapItem:referenceLocation:error:", v6, v8, &v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v11;
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);
    if (v10)
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v10);
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 48), "count") >= *(_QWORD *)(a1 + 64))
      *a4 = 1;

  }
}

- (BOOL)_savePlaceInferenceQueriesFromInferredMapItems:(id)a3 inferenceErrorCode:(int64_t)a4 referenceLocation:(id)a5 options:(id)a6 outError:(id *)a7
{
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  dispatch_semaphore_t v25;
  void *v26;
  NSObject *v27;
  void *v28;
  dispatch_time_t v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  char v43;
  NSObject *v44;
  void *v45;
  id v46;
  id v47;
  BOOL v48;
  dispatch_semaphore_t v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  dispatch_time_t v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  NSObject *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  char v73;
  NSObject *v74;
  void *v75;
  id v76;
  void *v79;
  id obj;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v88;
  id v89;
  id v90;
  void *v91;
  dispatch_semaphore_t dsema;
  _QWORD v93[4];
  NSObject *v94;
  uint64_t *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  _QWORD v100[4];
  NSObject *v101;
  uint64_t *v102;
  uint64_t v103;
  id *v104;
  uint64_t v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  id v108;
  _BYTE v109[128];
  _BYTE buf[12];
  __int16 v111;
  void *v112;
  __int16 v113;
  id v114;
  _QWORD v115[4];

  v115[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v89 = a5;
  v90 = a6;
  v103 = 0;
  v104 = (id *)&v103;
  v105 = 0x3032000000;
  v106 = __Block_byref_object_copy__2;
  v107 = __Block_byref_object_dispose__2;
  v108 = 0;
  v79 = v9;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    obj = v9;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
    if (v10)
    {
      dsema = 0;
      v11 = 0;
      v85 = *(_QWORD *)v97;
      v82 = *MEMORY[0x1E0D18598];
      v83 = *MEMORY[0x1E0CB2D50];
      while (2)
      {
        v84 = v10;
        v12 = 0;
        v91 = v11;
        do
        {
          if (*(_QWORD *)v97 != v85)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v12);
          v14 = (void *)MEMORY[0x1E0D18420];
          objc_msgSend(v13, "mapItem");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "placeInferencePlaceTypeFromMapItem:userType:source:", v15, 0, 0x4000);

          v17 = objc_alloc(MEMORY[0x1E0D18420]);
          objc_msgSend(v13, "mapItem");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "confidence");
          v19 = (void *)objc_msgSend(v17, "initWithMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:loiIdentifier:", v18, 0, 0, v16, v89, 0);

          v20 = objc_alloc(MEMORY[0x1E0D18430]);
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v90, "fidelityPolicy");
          objc_msgSend(v90, "clientIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v20, "initWithIdentifier:date:errorCode:fidelityPolicyMask:placeInference:sourceIdentifier:", v21, v88, a4, v22, v19, v23);

          v25 = dispatch_semaphore_create(0);
          -[RTPlaceInferenceManager placeInferenceQueryStore](self, "placeInferenceQueryStore");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v93[0] = MEMORY[0x1E0C809B0];
          v93[1] = 3221225472;
          v93[2] = __128__RTPlaceInferenceManager__savePlaceInferenceQueriesFromInferredMapItems_inferenceErrorCode_referenceLocation_options_outError___block_invoke_155;
          v93[3] = &unk_1E9297038;
          v95 = &v103;
          v27 = v25;
          v94 = v27;
          objc_msgSend(v26, "storePlaceInferenceQuery:handler:", v24, v93);

          dsema = v27;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = dispatch_time(0, 3600000000000);
          if (!dispatch_semaphore_wait(dsema, v29))
            goto LABEL_12;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "timeIntervalSinceDate:", v28);
          v32 = v31;
          v33 = (void *)objc_opt_new();
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_2);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "filteredArrayUsingPredicate:", v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "firstObject");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v33, "submitToCoreAnalytics:type:duration:", v37, 1, v32);
          _rt_log_facility_get_os_log(RTLogFacilityGeneral);
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
          }

          v39 = (void *)MEMORY[0x1E0CB35C8];
          v115[0] = v83;
          *(_QWORD *)buf = CFSTR("semaphore wait timeout");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v115, 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "errorWithDomain:code:userInfo:", v82, 15, v40);
          v41 = (void *)objc_claimAutoreleasedReturnValue();

          if (v41)
          {
            v42 = objc_retainAutorelease(v41);

            v43 = 0;
          }
          else
          {
LABEL_12:
            v43 = 1;
            v42 = v91;
          }

          v11 = v42;
          if ((v43 & 1) == 0)
            objc_storeStrong(v104 + 5, v42);
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v44 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = v104[5];
            *(_DWORD *)buf = 138412802;
            *(_QWORD *)&buf[4] = v45;
            v111 = 2112;
            v112 = v24;
            v113 = 2112;
            v114 = v46;
            _os_log_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_INFO, "%@, save placeInferenceQuery, %@, error, %@", buf, 0x20u);

          }
          v47 = v104[5];
          if (v47)
          {
            if (a7)
              *a7 = objc_retainAutorelease(v47);

            v48 = 0;
            goto LABEL_41;
          }

          ++v12;
          v91 = v11;
        }
        while (v84 != v12);
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v109, 16);
        if (v10)
          continue;
        break;
      }
    }
    else
    {
      dsema = 0;
      v11 = 0;
    }

    if (a7)
      *a7 = 0;
    v48 = 1;
  }
  else
  {
    v49 = dispatch_semaphore_create(0);
    v88 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D18420]), "initWithMapItem:finerGranularityMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:finerGranularityMapItemConfidence:loiIdentifier:", 0, 0, 0, 0, 0, v89, 0.0, 0.0, 0);
    v50 = objc_alloc(MEMORY[0x1E0D18430]);
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = objc_msgSend(v90, "fidelityPolicy");
    objc_msgSend(v90, "clientIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v50, "initWithIdentifier:date:errorCode:fidelityPolicyMask:placeInference:sourceIdentifier:", v51, v52, a4, v53, v88, v54);

    -[RTPlaceInferenceManager placeInferenceQueryStore](self, "placeInferenceQueryStore");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v100[0] = MEMORY[0x1E0C809B0];
    v100[1] = 3221225472;
    v100[2] = __128__RTPlaceInferenceManager__savePlaceInferenceQueriesFromInferredMapItems_inferenceErrorCode_referenceLocation_options_outError___block_invoke;
    v100[3] = &unk_1E9297038;
    v102 = &v103;
    v57 = v49;
    v101 = v57;
    objc_msgSend(v56, "storePlaceInferenceQuery:handler:", v55, v100);

    dsema = v57;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = dispatch_time(0, 3600000000000);
    if (!dispatch_semaphore_wait(dsema, v59))
      goto LABEL_33;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "timeIntervalSinceDate:", v58);
    v62 = v61;
    v63 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_2);
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "filteredArrayUsingPredicate:", v64);
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "firstObject");
    v67 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v63, "submitToCoreAnalytics:type:duration:", v67, 1, v62);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v68, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v69 = (void *)MEMORY[0x1E0CB35C8];
    v115[0] = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v115, 1);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v69, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    if (v71)
    {
      v72 = objc_retainAutorelease(v71);

      v73 = 0;
    }
    else
    {
LABEL_33:
      v72 = 0;
      v73 = 1;
    }

    v11 = v72;
    if ((v73 & 1) == 0)
      objc_storeStrong(v104 + 5, v72);
    _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
    v74 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      v76 = v104[5];
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = v75;
      v111 = 2112;
      v112 = v55;
      v113 = 2112;
      v114 = v76;
      _os_log_impl(&dword_1D1A22000, v74, OS_LOG_TYPE_INFO, "%@, save placeInferenceQuery, %@, error, %@", buf, 0x20u);

    }
    if (a7)
      *a7 = objc_retainAutorelease(v104[5]);
    v48 = v104[5] == 0;

  }
LABEL_41:

  _Block_object_dispose(&v103, 8);
  return v48;
}

void __128__RTPlaceInferenceManager__savePlaceInferenceQueriesFromInferredMapItems_inferenceErrorCode_referenceLocation_options_outError___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __128__RTPlaceInferenceManager__savePlaceInferenceQueriesFromInferredMapItems_inferenceErrorCode_referenceLocation_options_outError___block_invoke_155(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

- (id)_selectBestCandidateAndUpdateReferenceLocation:(id)a3
{
  double v3;
  uint64_t i;
  uint64_t (*v5)(uint64_t, uint64_t);
  NSObject *v6;
  void *v7;
  void *v8;
  BOOL v9;
  dispatch_semaphore_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
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
  id v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  BOOL v39;
  double v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void *v42;
  uint64_t v43;
  double v44;
  id v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  void *v59;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  id obj;
  uint64_t v66;
  uint64_t v68;
  uint64_t v69;
  uint64_t (*v70)(uint64_t, uint64_t);
  _QWORD v71[4];
  NSObject *v72;
  uint64_t *v73;
  _BYTE *v74;
  uint64_t v75;
  uint64_t *v76;
  uint64_t v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  void (*v79)(uint64_t);
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _BYTE v85[12];
  __int16 v86;
  uint64_t v87;
  _BYTE buf[24];
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  _BYTE v92[128];
  _QWORD v93[4];

  v93[1] = *MEMORY[0x1E0C80C00];
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  obj = a3;
  v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
  if (!v69)
  {
    v61 = 0;
    v57 = 0;
    v46 = obj;
LABEL_33:

    goto LABEL_35;
  }
  v66 = 0;
  v61 = 0;
  v70 = 0;
  v68 = *(_QWORD *)v82;
  v62 = *MEMORY[0x1E0D18598];
  v63 = *MEMORY[0x1E0CB2D50];
  v3 = -1.0;
  do
  {
    for (i = 0; i != v69; ++i)
    {
      if (*(_QWORD *)v82 != v68)
        objc_enumerationMutation(obj);
      v5 = *(uint64_t (**)(uint64_t, uint64_t))(*((_QWORD *)&v81 + 1) + 8 * i);
      _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = v7;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v66 + i + 1;
        *(_WORD *)&buf[22] = 2112;
        v89 = v5;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, placeInference candidate %lu, %@", buf, 0x20u);

      }
      objc_msgSend(v5, "loiIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8 == 0;

      if (!v9)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x3032000000;
        v89 = __Block_byref_object_copy__2;
        v90 = __Block_byref_object_dispose__2;
        v91 = 0;
        v75 = 0;
        v76 = &v75;
        v77 = 0x3032000000;
        v78 = __Block_byref_object_copy__2;
        v79 = __Block_byref_object_dispose__2;
        v80 = 0;
        v10 = dispatch_semaphore_create(0);
        -[RTPlaceInferenceManager learnedLocationStore](self, "learnedLocationStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "loiIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v71[0] = MEMORY[0x1E0C809B0];
        v71[1] = 3221225472;
        v71[2] = __74__RTPlaceInferenceManager__selectBestCandidateAndUpdateReferenceLocation___block_invoke;
        v71[3] = &unk_1E9297478;
        v73 = &v75;
        v74 = buf;
        v13 = v10;
        v72 = v13;
        objc_msgSend(v11, "fetchLocationOfInterestWithIdentifier:handler:", v12, v71);

        v14 = v13;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = dispatch_time(0, 3600000000000);
        if (!dispatch_semaphore_wait(v14, v16))
          goto LABEL_14;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceDate:", v15);
        v19 = v18;
        v20 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_2);
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
          *(_WORD *)v85 = 0;
          _os_log_fault_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v85, 2u);
        }

        v26 = (void *)MEMORY[0x1E0CB35C8];
        v93[0] = v63;
        *(_QWORD *)v85 = CFSTR("semaphore wait timeout");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v93, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", v62, 15, v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = objc_retainAutorelease(v28);

          v30 = 0;
        }
        else
        {
LABEL_14:
          v29 = 0;
          v30 = 1;
        }

        v31 = v29;
        if ((v30 & 1) == 0)
          objc_storeStrong((id *)(*(_QWORD *)&buf[8] + 40), v29);
        if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
        {
          _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
          v32 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            NSStringFromSelector(a2);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
            *(_DWORD *)v85 = 138412546;
            *(_QWORD *)&v85[4] = v33;
            v86 = 2112;
            v87 = v34;
            _os_log_error_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_ERROR, "%@, error, %@", v85, 0x16u);

          }
LABEL_25:

          goto LABEL_26;
        }
        objc_msgSend((id)v76[5], "location");
        v32 = objc_claimAutoreleasedReturnValue();
        -[NSObject location](v32, "location");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "sourceAccuracy") != 2)
        {

          goto LABEL_25;
        }
        objc_msgSend((id)v76[5], "location");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "location");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "horizontalUncertainty");
        v39 = v38 > 40.0;

        if (v39 || (objc_msgSend(v5, "confidence"), v40 <= v3))
        {
LABEL_26:
          v41 = v70;
        }
        else
        {
          v41 = v5;

          objc_msgSend((id)v76[5], "location");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "location");
          v43 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v41, "confidence");
          v3 = v44;
          v61 = (void *)v43;
        }

        _Block_object_dispose(&v75, 8);
        _Block_object_dispose(buf, 8);

        v70 = v41;
        continue;
      }
    }
    v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
    v66 += i;
  }
  while (v69);

  if (v70)
  {
    v45 = objc_alloc(MEMORY[0x1E0D18420]);
    objc_msgSend(v70, "mapItem");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "finerGranularityMapItem");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v70, "userType");
    v49 = objc_msgSend(v70, "userTypeSource");
    v50 = objc_msgSend(v70, "placeType");
    objc_msgSend(v70, "confidence");
    v52 = v51;
    objc_msgSend(v70, "finerGranularityMapItemConfidence");
    v54 = v53;
    objc_msgSend(v70, "loiIdentifier");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "preferredName");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v45, "initWithMapItem:finerGranularityMapItem:userType:userTypeSource:placeType:referenceLocation:confidence:finerGranularityMapItemConfidence:loiIdentifier:preferredName:", v46, v47, v48, v49, v50, v61, v52, v54, v55, v56);

    goto LABEL_33;
  }
  v57 = 0;
LABEL_35:
  _rt_log_facility_get_os_log(RTLogFacilityLearnedLocation);
  v58 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v59;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v57;
    _os_log_impl(&dword_1D1A22000, v58, OS_LOG_TYPE_INFO, "%@, selected best candidate, %@", buf, 0x16u);

  }
  return v57;
}

void __74__RTPlaceInferenceManager__selectBestCandidateAndUpdateReferenceLocation___block_invoke(uint64_t a1, void *a2, void *a3)
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

- (id)_estimatedLocationFromSortedLocations:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[8];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0;
      v9 = *(_QWORD *)v27;
      v10 = 0.0;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v9)
            objc_enumerationMutation(v5);
          v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v12, "type", (_QWORD)v26) == 1)
          {
            objc_msgSend(v12, "speed");
            if (v13 >= 0.0)
            {
              objc_msgSend(v12, "speed");
              v10 = v10 + v14;
              ++v8;
            }
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);

      if (v8)
      {
        v15 = v10 / (double)v8;
LABEL_19:
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", (_QWORD)v26);
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKey:](v16, "setObject:forKey:", v18, CFSTR("kRTLocationSmootherAverageMovingSpeed"));

        v19 = MEMORY[0x1E0C9AAB0];
        -[NSObject setObject:forKey:](v16, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("kRTLocationSmootherEnableFallbackModel"));
        -[NSObject setObject:forKey:](v16, "setObject:forKey:", v19, CFSTR("kRTLocationSmootherPreciseLocationOnlyMode"));
        -[RTPlaceInferenceManager locationManager](self, "locationManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "locationSmoother");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "timestamp");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "timeIntervalSinceReferenceDate");
        objc_msgSend(v21, "estimateLocationWithLocations:timestamp:parameters:meta:", v5, v16, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D183B0]), "initWithCLLocation:", v24);
        goto LABEL_20;
      }
    }
    else
    {

    }
    v15 = 0.0;
    goto LABEL_19;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locations.count", buf, 2u);
  }
  v17 = 0;
LABEL_20:

  return v17;
}

void __62__RTPlaceInferenceManager__addMapItemProviderFromArray_toSet___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (BOOL)_learnedPlaceTypeForInferredMapItem:(id)a3 placeType:(unint64_t *)a4 placeTypeSource:(unint64_t *)a5 error:(id *)a6
{
  id v10;
  BOOL v11;
  id v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  const __CFString *v16;
  NSObject *v17;
  NSObject *v18;
  id v20;
  uint64_t v21;
  uint8_t buf[16];

  v10 = a3;
  if (!v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: inferredMapItem", buf, 2u);
    }

    if (!a6)
      goto LABEL_19;
    v16 = CFSTR("inferredMapItem");
    goto LABEL_18;
  }
  if (!a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeType", buf, 2u);
    }

    if (!a6)
      goto LABEL_19;
    v16 = CFSTR("placeType");
LABEL_18:
    _RTErrorInvalidParameterCreate((uint64_t)v16);
    v11 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (!a5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: placeTypeSource", buf, 2u);
    }

    if (a6)
    {
      v16 = CFSTR("placeTypeSource");
      goto LABEL_18;
    }
LABEL_19:
    v11 = 0;
    goto LABEL_24;
  }
  v21 = 0;
  *(_QWORD *)buf = 0;
  v20 = 0;
  v11 = -[RTPlaceInferenceManager _inferUserSpecificPlaceTypeForInferredMapItem:userSpecificPlaceType:userSpecificPlaceTypeSource:error:](self, "_inferUserSpecificPlaceTypeForInferredMapItem:userSpecificPlaceType:userSpecificPlaceTypeSource:error:", v10, buf, &v21, &v20);
  v12 = v20;
  v13 = v12;
  if (v11)
  {
    *a4 = +[RTPlaceInferenceManager learnedPlaceTypeFromUserSpecificPlaceType:](RTPlaceInferenceManager, "learnedPlaceTypeFromUserSpecificPlaceType:", *(_QWORD *)buf);
    v14 = +[RTPlaceInferenceManager learnedPlaceTypeSourceFromUserSpecificPlaceTypeSource:](RTPlaceInferenceManager, "learnedPlaceTypeSourceFromUserSpecificPlaceTypeSource:", v21);
  }
  else
  {
    if (a6)
      *a6 = objc_retainAutorelease(v12);
    v14 = 0;
    *a4 = 0;
  }
  *a5 = v14;

LABEL_24:
  return v11;
}

void __148__RTPlaceInferenceManager_sendPlaceInferenceMetrics_inferredMapItems_fusedMapItems_fallbackInferredMapItems_finalPlaceInferences_referenceLocation___block_invoke(_QWORD *a1, void *a2)
{
  uint64_t v4;
  char v5;
  void *v6;
  char v7;
  char v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  if ((objc_msgSend(v10, "source") & 0x4000) != 0 || (objc_msgSend(v10, "source") & 0x80000) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[4] + 8) + 40), a2);
    ++*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
LABEL_16:
    v6 = v10;
    goto LABEL_17;
  }
  if ((objc_msgSend(v10, "source") & 1) != 0 || (objc_msgSend(v10, "source") & 0x40000) != 0)
  {
    v9 = a1[6];
LABEL_15:
    *(_BYTE *)(*(_QWORD *)(v9 + 8) + 24) = 1;
    goto LABEL_16;
  }
  if ((objc_msgSend(v10, "source") & 0x2000) != 0)
  {
    ++*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
    v9 = a1[7];
    goto LABEL_15;
  }
  v4 = objc_msgSend(v10, "source");
  ++*(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  if ((v4 & 0x10000) != 0)
  {
    v9 = a1[8];
    goto LABEL_15;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1[9] + 8) + 40), "addObject:", v10);
  if ((objc_msgSend(v10, "source") & 0x40) != 0)
    *(_BYTE *)(*(_QWORD *)(a1[10] + 8) + 24) = 1;
  v5 = objc_msgSend(v10, "source");
  v6 = v10;
  if ((v5 & 0x10) != 0
    || (v7 = objc_msgSend(v10, "source"), v6 = v10, (v7 & 0x40) != 0)
    || (v8 = objc_msgSend(v10, "source"), v6 = v10, v8 < 0))
  {
    *(_BYTE *)(*(_QWORD *)(a1[11] + 8) + 24) = 1;
  }
LABEL_17:

}

void __148__RTPlaceInferenceManager_sendPlaceInferenceMetrics_inferredMapItems_fusedMapItems_fallbackInferredMapItems_finalPlaceInferences_referenceLocation___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "mapItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
}

void __148__RTPlaceInferenceManager_sendPlaceInferenceMetrics_inferredMapItems_fusedMapItems_fallbackInferredMapItems_finalPlaceInferences_referenceLocation___block_invoke_176(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v8;
    v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "fetched visit, %@, error, %@", (uint8_t *)&v15, 0x16u);

  }
  objc_msgSend(v5, "firstObject");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v6;
  v14 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_onVisitManagerVisitIncidentNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSDate *v9;
  NSDate *visitEntryTime;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVisitManagerVisitIncidentNotification, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  v7 = v11;
  if (v6)
  {
    objc_msgSend(v11, "visitIncident");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "type") == 1)
    {
      objc_msgSend(v8, "entry");
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
      visitEntryTime = self->_visitEntryTime;
      self->_visitEntryTime = v9;
    }
    else
    {
      if (objc_msgSend(v8, "type") != 3)
      {
LABEL_7:

        v7 = v11;
        goto LABEL_8;
      }
      visitEntryTime = self->_visitEntryTime;
      self->_visitEntryTime = 0;
    }

    goto LABEL_7;
  }
LABEL_8:

}

- (void)onVisitManagerVisitIncidentNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__RTPlaceInferenceManager_onVisitManagerVisitIncidentNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __67__RTPlaceInferenceManager_onVisitManagerVisitIncidentNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onVisitManagerVisitIncidentNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onPointOfInterestVisitNotification:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  NSDate *v9;
  NSDate *visitEntryTime;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTPointOfInterestMonitorVisitNotification, "notificationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  v7 = v11;
  if (v6)
  {
    objc_msgSend(v11, "visit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "type") == 1)
    {
      objc_msgSend(v8, "entry");
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
      visitEntryTime = self->_visitEntryTime;
      self->_visitEntryTime = v9;

    }
    v7 = v11;
  }

}

- (void)onPointOfInterestVisitNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__RTPlaceInferenceManager_onPointOfInterestVisitNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __62__RTPlaceInferenceManager_onPointOfInterestVisitNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onPointOfInterestVisitNotification:", *(_QWORD *)(a1 + 40));
}

- (void)_onDailyMetricsNotification:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, received notification, %@", (uint8_t *)&v9, 0x16u);

  }
  -[RTPlaceInferenceManager dailyMetrics](self, "dailyMetrics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "submit");

}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__RTPlaceInferenceManager_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __54__RTPlaceInferenceManager_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDailyMetricsNotification:", *(_QWORD *)(a1 + 40));
}

+ (unint64_t)learnedPlaceTypeFromUserSpecificPlaceType:(unint64_t)a3
{
  if (a3 - 1 >= 4)
    return 0;
  else
    return a3;
}

+ (unint64_t)learnedPlaceTypeSourceFromUserSpecificPlaceTypeSource:(unint64_t)a3
{
  return a3 & 7;
}

+ (unint64_t)userSpecificPlaceTypeFromLocationOfInterestType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) < 5)
    return a3 + 1;
  else
    return 0;
}

+ (unint64_t)userSpecificPlaceTypeSourceFromLocationOfInterestTypeSource:(unint64_t)a3
{
  return a3 & 7;
}

+ (unint64_t)learnedPlaceTypeFromLocationOfInterestType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) < 5)
    return a3 + 1;
  else
    return 0;
}

+ (unint64_t)learnedPlaceTypeSourceFromLocationOfInterestTypeSource:(unint64_t)a3
{
  return a3 & 7;
}

+ (int64_t)periodicPurgePolicy
{
  return 1;
}

- (void)_performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  if ((unint64_t)a3 > 1)
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }
  else
  {
    -[RTPlaceInferenceManager placeInferenceQueryStore](self, "placeInferenceQueryStore");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__RTPlaceInferenceManager__performPurgeOfType_referenceDate_completion___block_invoke;
    v12[3] = &unk_1E9297568;
    v13 = v10;
    objc_msgSend(v11, "purgePlaceInferenceQueriesPredating:handler:", v8, v12);

  }
}

uint64_t __72__RTPlaceInferenceManager__performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)performPurgeOfType:(int64_t)a3 referenceDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  int64_t v16;

  v8 = a4;
  v9 = a5;
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__RTPlaceInferenceManager_performPurgeOfType_referenceDate_completion___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __71__RTPlaceInferenceManager_performPurgeOfType_referenceDate_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performPurgeOfType:referenceDate:completion:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTInferredMapItemFuser)inferredMapItemFuser
{
  return self->_inferredMapItemFuser;
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (RTMapServiceManager)mapServiceManager
{
  return self->_mapServiceManager;
}

- (RTVisitManager)visitManager
{
  return self->_visitManager;
}

- (void)setVisitManager:(id)a3
{
  objc_storeStrong((id *)&self->_visitManager, a3);
}

- (RTVisitStore)visitStore
{
  return self->_visitStore;
}

- (void)setPlaceInferencesLimit:(unint64_t)a3
{
  self->_placeInferencesLimit = a3;
}

- (NSMutableArray)cachedLocations
{
  return self->_cachedLocations;
}

- (unint64_t)cachedLocationIndex
{
  return self->_cachedLocationIndex;
}

- (void)setDailyMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_dailyMetrics, a3);
}

- (NSDate)visitEntryTime
{
  return self->_visitEntryTime;
}

- (void)setVisitEntryTime:(id)a3
{
  objc_storeStrong((id *)&self->_visitEntryTime, a3);
}

- (unint64_t)clientMappingIndex
{
  return self->_clientMappingIndex;
}

- (void)setClientMappingIndex:(unint64_t)a3
{
  self->_clientMappingIndex = a3;
}

- (RTPlaceInferenceQueryStore)placeInferenceQueryStore
{
  return self->_placeInferenceQueryStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeInferenceQueryStore, 0);
  objc_storeStrong((id *)&self->_visitEntryTime, 0);
  objc_storeStrong((id *)&self->_dailyMetrics, 0);
  objc_storeStrong((id *)&self->_cachedLocations, 0);
  objc_storeStrong((id *)&self->_mapItemProviders, 0);
  objc_storeStrong((id *)&self->_visitStore, 0);
  objc_storeStrong((id *)&self->_visitManager, 0);
  objc_storeStrong((id *)&self->_mapServiceManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_inferredMapItemFuser, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
}

@end
